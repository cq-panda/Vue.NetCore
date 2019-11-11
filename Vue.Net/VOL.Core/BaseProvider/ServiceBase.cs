using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using VOL.Core.CacheManager;
using VOL.Core.Configuration;
using VOL.Core.Const;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.Filters;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity;
using VOL.Entity.DomainModels;
using VOL.Entity.SystemModels;

namespace VOL.Core.BaseProvider
{
    public abstract class ServiceBase<T, TRepository> : ServiceFunFilter<T>
         where T : BaseEntity
         where TRepository : IRepository<T>
    {
        public ICacheService CacheContext
        {
            get
            {
                return AutofacContainerModule.GetService<ICacheService>();
            }
        }

        public Microsoft.AspNetCore.Http.HttpContext Context
        {
            get
            {
                return HttpContext.Current;
            }
        }
        private WebResponseContent Response { get; set; }

        protected IRepository<T> repository;

        private PropertyInfo[] _propertyInfo { get; set; } = null;
        private PropertyInfo[] TProperties
        {
            get
            {
                if (_propertyInfo != null)
                {
                    return _propertyInfo;
                }
                _propertyInfo = typeof(T).GetProperties();
                return _propertyInfo;
            }
        }

        public ServiceBase()
        {
        }

        public ServiceBase(TRepository repository)
        {
            Response = new WebResponseContent(true);
            this.repository = repository;
        }

        protected virtual void Init(IRepository<T> repository)
        {

        }

        private const string _desc = "desc";
        private const string _asc = "asc";
        /// <summary>
        /// 生成排序字段
        /// </summary>
        /// <param name="pageData"></param>
        /// <param name="propertyInfo"></param>
        private void GetPageDataSort(PageDataOptions pageData, PropertyInfo[] propertyInfo)
        {

            if (base.OrderByExpression != null)
            {
                pageData.Sort = string.Join(" ,", base.OrderByExpression.GetExpressionToDic().Select(x => x.Key + "  " + x.Value.ToString()).ToList());
                return;
            }
            pageData.Sort = (pageData.Sort ?? "").Trim().ToLower();

            //如果没有排序字段，则使用主键作为排序字段
            //如果主键不是自增Int类型则使用appsettings.json中CreateMember->DateField配置的创建时间作为排序
            if (!string.IsNullOrEmpty(pageData.Sort))
            {
                PropertyInfo property = propertyInfo.GetKeyProperty();
                if (property.PropertyType == typeof(int) || property.PropertyType == typeof(Int64))
                {
                    if (!propertyInfo.Any(x => x.Name.ToLower() == pageData.Sort))
                    {
                        pageData.Sort = propertyInfo.GetKeyName();
                    }
                }
                else
                {
                    if (string.IsNullOrEmpty(AppSetting.CreateMember.DateField))
                        throw new Exception("未配置好查询的排序默认排序字段");
                    pageData.Sort = AppSetting.CreateMember.DateField;
                }

            }
            pageData.Order = (pageData.Order ?? _desc).Trim().ToLower();
            if (pageData.Order != _desc && pageData.Order != _asc)
            {
                pageData.Order = _desc;
            }
            pageData.Sort = pageData.Sort + "  " + pageData.Order;

        }

        /// <summary>
        /// 验证排序与查询字段合法性
        /// </summary>
        /// <param name="options"></param>
        /// <param name="queryable"></param>
        /// <returns></returns>
        private PageDataOptions ValidatePageOptions(PageDataOptions options, out IQueryable<T> queryable)
        {
            options = options ?? new PageDataOptions();
            GetPageDataSort(options, TProperties);
            List<SearchParameters> searchParametersList = new List<SearchParameters>();
            if (!string.IsNullOrEmpty(options.Wheres))
            {
                try
                {
                    searchParametersList = options.Wheres.DeserializeObject<List<SearchParameters>>();
                }
                catch { }
            }
            QueryRelativeList?.Invoke(searchParametersList);
            //  Connection
            queryable = repository.DbContext.Set<T>();
            //判断列的数据类型数字，日期的需要判断值的格式是否正确
            for (int i = 0; i < searchParametersList.Count; i++)
            {
                SearchParameters x = searchParametersList[i];
                x.DisplayType = x.DisplayType.GetDBCondition();
                if (string.IsNullOrEmpty(x.Value))
                {
                    searchParametersList.Remove(x);
                    continue;
                }

                PropertyInfo property = TProperties.Where(c => c.Name.ToUpper() == x.Name.ToUpper()).FirstOrDefault();
                // property
                //移除查询的值与数据库类型不匹配的数据
                // x.Value = string.Join(",", dbType.ValidationVal(x.Value.Split(',')).Where(q => q != ""));
                object[] values = property.ValidationValueForDbType(x.Value.Split(',')).Where(q => q.Item1).Select(s => s.Item3).ToArray();
                // if (string.IsNullOrEmpty(x.Value))
                if (values == null || values.Length == 0)
                {
                    searchParametersList.Remove(x);
                    continue;
                }
                if (x.DisplayType == HtmlElementType.Contains)
                    x.Value = string.Join(",", values);
                LinqExpressionType expressionType = x.DisplayType.GetLinqCondition();
                queryable = LinqExpressionType.In == expressionType
                              ? queryable.Where(x.Name.CreateExpression<T>(values, expressionType))
                              : queryable.Where(x.Name.CreateExpression<T>(x.Value, expressionType));
            }
            options.Wheres = searchParametersList.GetEntitySql();
            options.TableName = base.TableName ?? typeof(T).Name;
            return options;
        }

        /// <summary>
        /// 加载页面数据
        /// </summary>
        /// <param name="loadSingleParameters"></param>
        /// <returns></returns>
        public virtual PageGridData<T> GetPageData(PageDataOptions options)
        {
            options = ValidatePageOptions(options, out IQueryable<T> queryable);
            Dictionary<string, QueryOrderBy> orderbyDic = new Dictionary<string, QueryOrderBy>();
            options.Sort.Split(',').Select(x => x.Trim()).Where(c => c.Length > 0).ToList().ForEach(s =>
            {
                string[] sortArr = s.Split(' ').Select(x => x.Trim()).Where(c => c.Length > 0).ToArray();
                if (sortArr.Length == 2)
                {
                    orderbyDic.Add(sortArr[0], sortArr[1].ToLower() == "desc"
                        ? QueryOrderBy.Desc
                        : QueryOrderBy.Asc);
                }
            });
            PageGridData<T> pageGridData = new PageGridData<T>();

            if (QueryRelativeExpression != null)
            {
                queryable = QueryRelativeExpression.Invoke(queryable);
            }

            if (options.Export)
            {
                pageGridData.rows = queryable.GetIQueryableOrderBy(orderbyDic).Take(Limit).ToList();
            }
            else
            {
                pageGridData.rows = repository.IQueryablePage(queryable,
                                    options.Page,
                                    options.Rows,
                                    out int rowCount,
                                    orderbyDic).ToList();
                pageGridData.total = rowCount;
            }
            GetPageDataOnExecuted?.Invoke(pageGridData);
            return pageGridData;

        }

        public virtual object GetDetailPage(PageDataOptions pageData)
        {
            Type detailType = typeof(T).GetCustomAttribute<EntityAttribute>().DetailTable[0];
            object obj = typeof(ServiceBase<T, TRepository>)
                 .GetMethod("GetDetailPage", BindingFlags.Instance | BindingFlags.NonPublic)
                 .MakeGenericMethod(new Type[] { detailType }).Invoke(this, new object[] { pageData });
            return obj;
        }

        private PageGridData<Detail> GetDetailPage<Detail>(PageDataOptions options) where Detail : class
        {
            //校验查询值，排序字段，分页大小规则待完
            PageGridData<Detail> gridData = new PageGridData<Detail>();
            if (options.Value == null) return gridData;
            //主表主键字段
            string keyName = typeof(T).GetKeyName();

            //生成查询条件
            Expression<Func<Detail, bool>> whereExpression = keyName.CreateExpression<Detail>(options.Value, LinqExpressionType.Equal);

            var queryeable = repository.DbContext.Set<Detail>().Where(whereExpression);

            gridData.total = queryeable.Count();
            //生成排序字段
            var sort = (options.Sort ?? typeof(Detail).GetKeyName()).GetExpression<Detail>();
            gridData.rows = queryeable
                .OrderByDescending(sort)
                .Skip((options.Page - 1) * options.Rows)
                .Take(options.Rows)
                .ToList();
            return gridData;
        }



        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="files"></param>
        /// <returns></returns>
        public virtual WebResponseContent Upload(List<Microsoft.AspNetCore.Http.IFormFile> files)
        {
            return new WebResponseContent { Status = true, Message = "文件上传功能开发中...." };
        }

        private List<string> GetIgnoreTemplate()
        {
            //忽略创建人、修改人、审核等字段
            List<string> ignoreTemplate = UserIgnoreFields.ToList();
            ignoreTemplate.AddRange(auditFields.ToList());
            return ignoreTemplate;
        }

        public virtual WebResponseContent DownLoadTemplate()
        {
            string tableName = typeof(T).GetEntityTableCnName();

            string dicPath = $"Download/{DateTime.Now.ToString("yyyMMdd")}/Template/".MapPath();
            if (!Directory.Exists(dicPath)) Directory.CreateDirectory(dicPath);
            string fileName = tableName + DateTime.Now.ToString("yyyyMMddHHssmm") + ".xlsx";

            EPPlusHelper.ExportTemplate<T>(GetIgnoreTemplate(), dicPath, fileName);
            return Response.OK(null, dicPath + fileName);
        }

        /// <summary>
        /// 导入表数据Excel文件夹
        /// </summary>
        /// <param name="files"></param>
        /// <returns></returns>
        public virtual WebResponseContent Import(List<Microsoft.AspNetCore.Http.IFormFile> files)
        {
            if (files == null || files.Count == 0)
                return new WebResponseContent { Status = true, Message = "请选择上传的文件" };
            Microsoft.AspNetCore.Http.IFormFile formFile = files[0];
            string dicPath = $"Upload/{DateTime.Now.ToString("yyyMMdd")}/{typeof(T).Name}/".MapPath();
            if (!Directory.Exists(dicPath)) Directory.CreateDirectory(dicPath);
            dicPath = $"{dicPath}{Guid.NewGuid().ToString()}_{formFile.FileName}";

            using (var stream = new FileStream(dicPath, FileMode.Create))
            {
                formFile.CopyTo(stream);
            }
            try
            {
                Response = EPPlusHelper.ReadToDataTable<T>(dicPath, GetIgnoreTemplate());
            }
            catch (Exception ex)
            {
                Response.Error("未能处理导入的文件,请检查导入的文件是否正确");
                Logger.Error($"表{typeof(T).GetEntityTableCnName()}导入失败{ex.Message + ex.InnerException?.Message}");
            }
            if (!Response.Status) return Response;
            repository.AddRange(Response.Data as List<T>, true);
            return new WebResponseContent { Status = true, Message = "文件上传成功" };
        }

        /// <summary>
        /// 导出
        /// </summary>
        /// <param name="pageData"></param>
        /// <returns></returns>
        public virtual WebResponseContent Export(PageDataOptions pageData)
        {
            pageData.Export = true;
            List<T> list = GetPageData(pageData).rows;
            string tableName = typeof(T).GetEntityTableCnName();
            string fileName = tableName + DateTime.Now.ToString("yyyyMMddHHssmm") + ".xlsx";
            string folder = DateTime.Now.ToString("yyyyMMdd");
            string savePath = $"Download/ExcelExport/{folder}/".MapPath();
            List<string> ignoreColumn = new List<string>();
            if (ExportOnExecuting != null)
            {
                Response = ExportOnExecuting(list, ignoreColumn);
                if (!Response.Status) return Response;
            }
            EPPlusHelper.Export(list, ignoreColumn, savePath, fileName);
            return Response.OK(null, (savePath + "/" + fileName).EncryptDES(AppSetting.Secret.ExportFile));
        }

        /// <summary>
        /// 新建
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        public virtual WebResponseContent Add(SaveModel saveDataModel)
        {
            if (AddOnExecute != null)
            {
                Response = AddOnExecute(saveDataModel);
                if (!Response.Status) return Response;
            }
            if (saveDataModel == null
                || saveDataModel.MainData == null
                || saveDataModel.MainData.Count == 0)
                return Response.Set(ResponseType.ParametersLack, false);

            saveDataModel.DetailData = saveDataModel.DetailData?.Where(x => x.Count > 0).ToList();
            Type type = typeof(T);

            string validReslut = type.ValidateDicInEntity(saveDataModel.MainData, true, UserIgnoreFields);

            if (!string.IsNullOrEmpty(validReslut)) return Response.Error(validReslut);

            if (saveDataModel.MainData.Count == 0)
                return Response.Error("保存的数据为空，请检查model是否配置正确!");

            UserInfo userInfo = UserContext.Current.UserInfo;
            saveDataModel.SetDefaultVal(AppSetting.CreateMember, userInfo);

            PropertyInfo keyPro = type.GetKeyProperty();
            if (keyPro.PropertyType == typeof(Guid))
            {
                saveDataModel.MainData.Add(keyPro.Name, Guid.NewGuid());
            }
            else
            {
                saveDataModel.MainData.Remove(keyPro.Name);
            }
            //没有明细直接保存返回
            if (saveDataModel.DetailData == null || saveDataModel.DetailData.Count == 0)
            {
                T mainEntity = saveDataModel.MainData.DicToEntity<T>();
                if (base.AddOnExecuting != null)
                {
                    Response = base.AddOnExecuting(mainEntity, null);
                    if (!Response.Status) return Response;
                }
                Response = repository.DbContextBeginTransaction(() =>
                 {
                     repository.Add(mainEntity, true);
                     saveDataModel.MainData[keyPro.Name] = keyPro.GetValue(mainEntity);
                     Response.OK(ResponseType.SaveSuccess);
                     if (base.AddOnExecuted != null)
                     {
                         Response = base.AddOnExecuted(mainEntity, null);
                     }
                     return Response;
                 });
                if (Response.Status) Response.Data = new { data = saveDataModel.MainData };
                return Response;
            }

            Type detailType = typeof(T).GetCustomAttribute<EntityAttribute>().DetailTable[0];

            return typeof(ServiceBase<T, TRepository>)
                .GetMethod("Add", BindingFlags.Instance | BindingFlags.NonPublic)
                .MakeGenericMethod(new Type[] { detailType })
                .Invoke(this, new object[] { saveDataModel })
                as WebResponseContent;
        }

        public virtual WebResponseContent AddEntity(T entity, bool validationEntity = true)
        {
            return Add<T>(entity, null, validationEntity);
        }

        /// <summary>
        /// 保存主、明细数据
        /// </summary>
        /// <typeparam name="TDetail"></typeparam>
        /// <param name="entity"></param>
        /// <param name="list"></param>
        /// <param name="validationEntity">是否进行实体验证</param>
        /// <returns></returns>
        public WebResponseContent Add<TDetail>(T entity, List<TDetail> list = null, bool validationEntity = true) where TDetail : class
        {
            //设置用户默认值
            entity.SetCreateDefaultVal();
            if (validationEntity)
            {
                Response = entity.ValidationEntity();
                if (!Response.Status) return Response;
                if (list != null && list.Count > 0)
                {
                    Response = list.ValidationEntity();
                    if (!Response.Status) return Response;
                }
            }
            if (this.AddOnExecuting != null)
            {
                Response = AddOnExecuting(entity, list);
                if (!Response.Status) return Response;
            }
            Response = repository.DbContextBeginTransaction(() =>
            {
                repository.Add(entity);
                repository.DbContext.SaveChanges();
                //保存明细
                if (list != null && list.Count > 0)
                {
                    //获取保存后的主键值
                    PropertyInfo mainKey = typeof(T).GetKeyProperty();
                    PropertyInfo detailMainKey = typeof(TDetail).GetProperties()
                        .Where(q => q.Name.ToLower() == mainKey.Name.ToLower()).FirstOrDefault();
                    object keyValue = mainKey.GetValue(entity);
                    list.ForEach(x =>
                    {
                        //设置用户默认值
                        x.SetCreateDefaultVal();
                        detailMainKey.SetValue(x, keyValue);
                        repository.DbContext.Entry<TDetail>(x).State = EntityState.Added;
                    });
                    repository.DbContext.SaveChanges();
                }
                Response.OK(ResponseType.SaveSuccess);
                if (AddOnExecuted != null)
                    Response = AddOnExecuted(entity, list);
                return Response;
            });
            if (Response.Status && string.IsNullOrEmpty(Response.Message))
                Response.OK(ResponseType.SaveSuccess);
            return Response;
        }

        public void AddDetailToDBSet<TDetail>() where TDetail : class
        {
            List<PropertyInfo> listChilds = TProperties.Where(x => x.PropertyType.Name == "List`1").ToList();
            // repository.DbContext.Set<TDetail>().AddRange();
        }

        private WebResponseContent Add<TDetail>(SaveModel saveDataModel) where TDetail : class
        {
            T mainEntity = saveDataModel.MainData.DicToEntity<T>();
            //验证明细
            string reslut = typeof(TDetail).ValidateDicInEntity(saveDataModel.DetailData, true, false, new string[] { TProperties.GetKeyName() });
            if (reslut != string.Empty)
                return Response.Error(reslut);

            List<TDetail> list = saveDataModel.DetailData.DicToList<TDetail>();
            Response = Add<TDetail>(mainEntity, list, false);

            //保存失败
            if (!Response.Status)
            {
                Logger.Error(LoggerType.Add, saveDataModel.Serialize() + Response.Message);
                return Response;
            }

            PropertyInfo propertyKey = typeof(T).GetKeyProperty();
            saveDataModel.MainData[propertyKey.Name] = propertyKey.GetValue(mainEntity);
            Response.Data = new { data = saveDataModel.MainData, list };
            return Response.Set(ResponseType.SaveSuccess);
        }

        #region 编辑

        /// <summary>
        /// 获取编辑明细主键
        /// </summary>
        /// <typeparam name="DetailT"></typeparam>
        /// <typeparam name="Tkey"></typeparam>
        /// <param name="detailKeyName"></param>
        /// <param name="mainKeyName"></param>
        /// <param name="mainKeyValue"></param>
        /// <returns></returns>
        public List<Tkey> GetUpdateDetailSelectKeys<DetailT, Tkey>(string detailKeyName, string mainKeyName, string mainKeyValue) where DetailT : class
        {
            IQueryable<DetailT> queryable = repository.DbContext.Set<DetailT>();
            Expression<Func<DetailT, Tkey>> selectExpression = detailKeyName.GetExpression<DetailT, Tkey>();
            Expression<Func<DetailT, bool>> whereExpression = mainKeyName.CreateExpression<DetailT>(mainKeyValue, LinqExpressionType.Equal);
            List<Tkey> detailKeys = queryable.Where(whereExpression).Select(selectExpression).ToList();
            return detailKeys;
        }

        /// <summary>
        /// 将数据转换成对象后最终保存
        /// </summary>
        /// <typeparam name="DetailT"></typeparam>
        /// <param name="saveModel"></param>
        /// <param name="mainKeyProperty"></param>
        /// <param name="detailKeyInfo"></param>
        /// <param name="keyDefaultVal"></param>
        /// <returns></returns>
        public WebResponseContent UpdateToEntity<DetailT>(SaveModel saveModel, PropertyInfo mainKeyProperty, PropertyInfo detailKeyInfo, object keyDefaultVal) where DetailT : class
        {
            T mainEnity = saveModel.MainData.DicToEntity<T>();
            List<DetailT> detailList = saveModel.DetailData.DicToList<DetailT>();
            //删除的主键

            //查出所有明细表数据的ID
            System.Collections.IList detailKeys = this.GetType().GetMethod("GetUpdateDetailSelectKeys")
                    .MakeGenericMethod(new Type[] { typeof(DetailT), detailKeyInfo.PropertyType })
                    .Invoke(this, new object[] {
                        detailKeyInfo.Name, mainKeyProperty.Name,
                        saveModel.MainData[mainKeyProperty.Name].ToString()
                    }) as System.Collections.IList;

            //新增对象
            List<DetailT> addList = new List<DetailT>();
            //   List<object> containsKeys = new List<object>();
            //编辑对象
            List<DetailT> editList = new List<DetailT>();
            //删除的主键
            List<object> delKeys = new List<object>();
            mainKeyProperty = typeof(DetailT).GetProperties().Where(x => x.Name == mainKeyProperty.Name).FirstOrDefault();
            //获取新增与修改的对象
            foreach (DetailT item in detailList)
            {
                object value = detailKeyInfo.GetValue(item);
                if (keyDefaultVal.Equals(value))//主键为默认值的,新增数据
                {
                    //设置新增的主表的值
                    mainKeyProperty.SetValue(item,
                        saveModel.MainData[mainKeyProperty.Name]
                        .ChangeType(mainKeyProperty.PropertyType));

                    if (detailKeyInfo.PropertyType == typeof(Guid))
                    {
                        detailKeyInfo.SetValue(item, Guid.NewGuid());
                    }
                    addList.Add(item);
                }
                else if (detailKeys.Contains(value))
                {
                    //containsKeys.Add(value);
                    editList.Add(item);
                }
            }

            //获取需要删除的对象的主键
            if (saveModel.DelKeys != null && saveModel.DelKeys.Count > 0)
            {
                delKeys = saveModel.DelKeys
                    .Where(x => detailKeys.Contains(x.ChangeType(detailKeyInfo.PropertyType)))
                    .Select(q => q.ChangeType(detailKeyInfo.PropertyType)).ToList();
            }

            if (UpdateOnExecuting != null)
            {
                Response = UpdateOnExecuting(mainEnity, addList, editList, delKeys);
                if (!Response.Status)
                    return Response;
            }
            mainEnity.SetModifyDefaultVal();
            //主表修改
            //不修改!CreateFields.Contains创建人信息
            repository.Update(mainEnity, typeof(T).GetEditField()
                .Where(c => saveModel.MainData.Keys.Contains(c) && !CreateFields.Contains(c))
                .ToArray());
            foreach (var item in saveModel.DetailData)
            {
                item.SetModifyDefaultVal();
            }
            //明细修改
            editList.ForEach(x =>
                {
                    //获取编辑的字段
                    string[] updateField = saveModel.DetailData
                            .Where(c => c[detailKeyInfo.Name].ChangeType(detailKeyInfo.PropertyType)
                            .Equal(detailKeyInfo.GetValue(x)))
                            .FirstOrDefault()
                            .Keys.Where(k => k != detailKeyInfo.Name)
                            .Where(r => !CreateFields.Contains(r))
                            .ToArray();
                    //設置默認值
                    x.SetModifyDefaultVal();
                    //添加修改字段
                    repository.Update<DetailT>(x, updateField);
                });

            //明细新增
            addList.ForEach(x =>
            {
                x.SetCreateDefaultVal();
                repository.DbContext.Entry<DetailT>(x).State = EntityState.Added;
            });
            //明细删除
            delKeys.ForEach(x =>
            {
                DetailT delT = Activator.CreateInstance<DetailT>();
                detailKeyInfo.SetValue(delT, x);
                repository.DbContext.Entry<DetailT>(delT).State = EntityState.Deleted;
            });

            if (UpdateOnExecuted == null)
            {
                repository.DbContext.SaveChanges();
                Response.OK(ResponseType.SaveSuccess);
            }
            else
            {
                Response = repository.DbContextBeginTransaction(() =>
                {
                    repository.DbContext.SaveChanges();
                    Response = UpdateOnExecuted(mainEnity, addList, editList, delKeys);
                    return Response;
                });
            }
            if (Response.Status)
            {
                addList.AddRange(editList);
                Response.Data = new { data = mainEnity, list = addList };
                if (string.IsNullOrEmpty(Response.Message))
                    Response.OK(ResponseType.SaveSuccess);
            }
            return Response;
        }

        /// <summary>
        /// 获取配置的创建人ID创建时间创建人,修改人ID修改时间、修改人与数据相同的字段
        /// </summary>
        private static string[] _userIgnoreFields { get; set; }

        private static string[] UserIgnoreFields
        {
            get
            {
                if (_userIgnoreFields != null) return _userIgnoreFields;
                List<string> fields = new List<string>();
                fields.AddRange(CreateFields);
                fields.AddRange(ModifyFields);
                _userIgnoreFields = fields.ToArray();
                return _userIgnoreFields;
            }
        }
        private static string[] _createFields { get; set; }
        private static string[] CreateFields
        {
            get
            {
                if (_createFields != null) return _createFields;
                _createFields = AppSetting.CreateMember.GetType().GetProperties()
                    .Select(x => x.GetValue(AppSetting.CreateMember)?.ToString())
                    .Where(w => !string.IsNullOrEmpty(w)).ToArray();
                return _createFields;
            }
        }

        private static string[] _modifyFields { get; set; }
        private static string[] ModifyFields
        {
            get
            {
                if (_modifyFields != null) return _modifyFields;
                _modifyFields = AppSetting.ModifyMember.GetType().GetProperties()
                    .Select(x => x.GetValue(AppSetting.ModifyMember)?.ToString())
                    .Where(w => !string.IsNullOrEmpty(w)).ToArray();
                return _modifyFields;
            }
        }

        /// <summary>
        /// 编辑
        /// 1、明细表必须把主表的主键字段也设置为可编辑
        /// 2、修改、增加只会操作设置为编辑列的数据
        /// </summary>
        /// <param name="saveModel"></param>
        /// <returns></returns>
        public virtual WebResponseContent Update(SaveModel saveModel)
        {
            if (UpdateOnExecute != null)
            {
                Response = UpdateOnExecute(saveModel);
                if (!Response.Status) return Response;
            }
            if (saveModel == null)
                return Response.Error(ResponseType.ParametersLack);

            Type type = typeof(T);

            //设置修改时间,修改人的默认值
            UserInfo userInfo = UserContext.Current.UserInfo;
            saveModel.SetDefaultVal(AppSetting.ModifyMember, userInfo);


            //判断提交的数据与实体格式是否一致
            string result = type.ValidateDicInEntity(saveModel.MainData, true, false, UserIgnoreFields);
            if (result != string.Empty)
                return Response.Error(result);

            PropertyInfo mainKeyProperty = type.GetKeyProperty();
            //验证明细
            Type detailType = null;
            if (saveModel.DetailData != null || saveModel.DelKeys != null)
            {
                saveModel.DetailData = saveModel.DetailData == null
                    ? new List<Dictionary<string, object>>()
                    : saveModel.DetailData.Where(x => x.Count > 0).ToList();

                detailType = typeof(T).GetCustomAttribute<EntityAttribute>().DetailTable[0];

                result = detailType.ValidateDicInEntity(saveModel.DetailData, true, false, new string[] { mainKeyProperty.Name });
                if (result != string.Empty) return Response.Error(result);
            }

            //获取主建类型的默认值用于判断后面数据是否正确,int long默认值为0,guid :0000-000....
            object keyDefaultVal = mainKeyProperty.PropertyType.Assembly.CreateInstance(mainKeyProperty.PropertyType.FullName);//.ToString();
            //判断是否包含主键
            if (mainKeyProperty == null
                || !saveModel.MainData.ContainsKey(mainKeyProperty.Name)
                || saveModel.MainData[mainKeyProperty.Name] == null
                )
            {
                return Response.Error(ResponseType.NoKey);
            }

            object mainKeyVal = saveModel.MainData[mainKeyProperty.Name];
            //判断主键类型是否正确
            (bool, string, object) validation = mainKeyProperty.ValidationValueForDbType(mainKeyVal).FirstOrDefault();
            if (!validation.Item1)
                return Response.Error(ResponseType.KeyError);

            object valueType = mainKeyVal.ToString().ChangeType(mainKeyProperty.PropertyType);
            //判断主键值是不是当前类型的默认值
            if (valueType == null ||
                (!valueType.GetType().Equals(mainKeyProperty.PropertyType)
                || valueType.ToString() == keyDefaultVal.ToString()
                ))
                return Response.Error(ResponseType.KeyError);

            if (saveModel.MainData.Count <= 1) return Response.Error("系统没有配置好编辑的数据，请检查model!");

            Expression<Func<T, bool>> expression = mainKeyProperty.Name.CreateExpression<T>(mainKeyVal.ToString(), LinqExpressionType.Equal);
            if (!repository.Exists(expression)) return Response.Error("保存的数据不存在!");
            //没有明细的直接保存主表数据
            if (detailType == null)
            {
                saveModel.SetDefaultVal(AppSetting.ModifyMember, userInfo);
                T mainEntity = saveModel.MainData.DicToEntity<T>();
                if (UpdateOnExecuting != null)
                {
                    Response = UpdateOnExecuting(mainEntity, null, null, null);
                    if (!Response.Status) return Response;
                }
                //不修改!CreateFields.Contains创建人信息
                repository.Update(mainEntity, type.GetEditField().Where(c => saveModel.MainData.Keys.Contains(c) && !CreateFields.Contains(c)).ToArray());
                if (base.UpdateOnExecuted == null)
                {
                    repository.SaveChanges();
                    Response.OK(ResponseType.SaveSuccess);
                }
                else
                {
                    Response = repository.DbContextBeginTransaction(() =>
                    {
                        repository.SaveChanges();
                        Response = UpdateOnExecuted(mainEntity, null, null, null);
                        return Response;
                    });
                }
                if (Response.Status) Response.Data = new { data = mainEntity };
                if (Response.Status && string.IsNullOrEmpty(Response.Message))
                    Response.OK(ResponseType.SaveSuccess);
                return Response;
            }

            saveModel.DetailData = saveModel.DetailData.Where(x => x.Count > 0).ToList();

            //明细操作
            PropertyInfo detailKeyInfo = detailType.GetKeyProperty();
            //主键类型
            //  string detailKeyType = mainKeyProperty.GetTypeCustomValue<ColumnAttribute>(c => new { c.TypeName });
            //判断明细是否包含了主表的主键

            string deatilDefaultVal = detailKeyInfo.PropertyType.Assembly.CreateInstance(detailKeyInfo.PropertyType.FullName).ToString();
            foreach (Dictionary<string, object> dic in saveModel.DetailData)
            {
                //不包含主键的默认添加主键默认值，用于后面判断是否为新增数据
                if (!dic.ContainsKey(detailKeyInfo.Name))
                {
                    dic.Add(detailKeyInfo.Name, keyDefaultVal);
                    if (dic.ContainsKey(mainKeyProperty.Name))
                    {
                        dic[mainKeyProperty.Name] = keyDefaultVal;
                    }
                    else
                    {
                        dic.Add(mainKeyProperty.Name, keyDefaultVal);
                    }
                    continue;
                }
                if (dic[detailKeyInfo.Name] == null)
                    return Response.Error(ResponseType.NoKey);

                //主键值是否正确
                string detailKeyVal = dic[detailKeyInfo.Name].ToString();
                if (!mainKeyProperty.ValidationValueForDbType(detailKeyVal).FirstOrDefault().Item1
                    || deatilDefaultVal == detailKeyVal)
                    return Response.Error(ResponseType.KeyError);

                //判断主表的值是否正确
                if (detailKeyVal != keyDefaultVal.ToString() && (!dic.ContainsKey(mainKeyProperty.Name) || dic[mainKeyProperty.Name] == null || dic[mainKeyProperty.Name].ToString() == keyDefaultVal.ToString()))
                {
                    return Response.Error(mainKeyProperty.Name + "是必填项!");
                }
            }

            if (saveModel.DetailData.Exists(c => c.Count <= 2))
                return Response.Error("系统没有配置好明细编辑的数据，请检查model!");
            return this.GetType().GetMethod("UpdateToEntity")
                .MakeGenericMethod(new Type[] { detailType })
                .Invoke(this, new object[] { saveModel, mainKeyProperty, detailKeyInfo, keyDefaultVal })
                as WebResponseContent;
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="keys"></param>
        /// <param name="delList">是否删除明细数据(默认会删除明细)</param>
        /// <returns></returns>
        public virtual WebResponseContent Del(object[] keys, bool delList = true)
        {
            Type entityType = typeof(T);
            var keyProperty = entityType.GetKeyProperty();
            if (keyProperty == null || keys.Length == 0) return Response.Error(ResponseType.NoKeyDel);

            IEnumerable<(bool, string, object)> validation = keyProperty.ValidationValueForDbType(keys);
            if (validation.Any(x => !x.Item1))
            {
                return Response.Error(validation.Where(x => !x.Item1).Select(s => s.Item2 + "</br>").Serialize());
            }
            string tKey = keyProperty.Name;
            if (string.IsNullOrEmpty(tKey))
                return Response.Error("没有主键不能删除");

            if (DelOnExecuting != null)
            {
                Response = DelOnExecuting(keys);
                if (!Response.Status) return Response;
            }

            FieldType fieldType = entityType.GetFieldType();
            string joinKeys = (fieldType == FieldType.Int || fieldType == FieldType.BigInt)
                 ? string.Join(",", keys)
                 : $"'{string.Join("','", keys)}'";

            string sql = $"DELETE FROM {entityType.Name } where {tKey} in ({joinKeys});";
            if (delList)
            {
                Type detailType = entityType.GetCustomAttribute<EntityAttribute>().DetailTable?[0];
                if (detailType != null)
                    sql = sql + $"DELETE FROM {detailType.Name} where {tKey} in ({joinKeys});";
            }
            //repository.DapperContext.ExcuteNonQuery(sql, CommandType.Text, null, true);

            //可能在删除后还要做一些其它数据库新增或删除操作，这样就可能需要与删除保持在同一个事务中处理
            //采用此方法 repository.DbContextBeginTransaction(()=>{//do delete......and other});
            //做的其他操作，在DelOnExecuted中加入委托实现
            repository.DbContextBeginTransaction(() =>
            {
                repository.ExecuteSqlCommand(sql);
                if (DelOnExecuted != null)
                {
                    Response = DelOnExecuted(keys);
                }
                return Response;
            });
            if (Response.Status && string.IsNullOrEmpty(Response.Message)) Response.OK(ResponseType.DelSuccess);
            return Response;
        }

        private static string[] auditFields = new string[] { "auditid", "auditstatus", "auditor", "auditdate", "auditreason" };

        /// <summary>
        /// 审核默认对应数据库字段为AuditId审核人ID ,AuditStatus审核状态,Auditor审核人,Auditdate审核时间,Auditreason审核原因
        /// </summary>
        /// <param name="keys"></param>
        /// <param name="auditStatus"></param>
        /// <param name="auditReason"></param>
        /// <returns></returns>
        public virtual WebResponseContent Audit(object[] keys, int? auditStatus, string auditReason)
        {
            if (keys == null || keys.Length == 0)
                return Response.Error("未获取到参数!");
            if (auditStatus != 1 && auditStatus != 2)
                return Response.Error("请提求正确的审核结果!");

            //获取主键
            PropertyInfo property = TProperties.GetKeyProperty();
            if (property == null)
                return Response.Error("没有配置好主键!");

            UserInfo userInfo = UserContext.Current.UserInfo;

            //表如果有审核相关字段，设置默认审核

            PropertyInfo[] updateFileds = TProperties.Where(x => auditFields.Contains(x.Name.ToLower())).ToArray();
            List<T> auditList = new List<T>();
            foreach (var value in keys)
            {
                object convertVal = value.ToString().ChangeType(property.PropertyType);
                if (convertVal == null) continue;

                T entity = Activator.CreateInstance<T>();
                property.SetValue(entity, convertVal);
                foreach (var item in updateFileds)
                {
                    switch (item.Name.ToLower())
                    {
                        case "auditid":
                            item.SetValue(entity, userInfo.User_Id);
                            break;
                        case "auditstatus":
                            item.SetValue(entity, auditStatus);
                            break;
                        case "auditor":
                            item.SetValue(entity, userInfo.UserTrueName);
                            break;
                        case "auditdate":
                            item.SetValue(entity, DateTime.Now);
                            break;
                        case "auditreason":
                            item.SetValue(entity, auditReason);
                            break;
                    }
                }
                auditList.Add(entity);
            }
            if (base.AuditOnExecuting != null)
            {
                Response = AuditOnExecuting(auditList);
                if (!Response.Status) return Response;
            }
            repository.UpdateRange(auditList, updateFileds.Select(x => x.Name).ToArray(), true);
            if (base.AuditOnExecuted != null)
            {
                Response = AuditOnExecuted(auditList);
                if (!Response.Status) return Response;
            }
            return Response.OK(ResponseType.AuditSuccess);
        }

        public virtual (string, T, bool) ApiValidate(string bizContent, Expression<Func<T, object>> expression = null)
        {
            return ApiValidateInput<T>(bizContent, expression);
        }

        /// <summary>
        /// 对指定类与api的参数进行验证
        /// </summary>
        /// <typeparam name="TInput"></typeparam>
        /// <param name="bizContent"></param>
        /// <param name="input"></param>
        /// <param name="expression">对指属性验证</param>
        /// <returns>(string,TInput, bool) string:返回验证消息,TInput：bizContent序列化后的对象,bool:验证是否通过</returns>
        public virtual (string, TInput, bool) ApiValidateInput<TInput>(string bizContent, Expression<Func<TInput, object>> expression)
        {
            return ApiValidateInput(bizContent, expression, null);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="TInput"></typeparam>
        /// <param name="bizContent"></param>
        /// <param name="expression">对指属性验证格式如：x=>new { x.UserName,x.Value }</param>
        /// <param name="validateExpression">对指定的字段只做合法性判断比如长度是是否超长</param>
        /// <returns>(string,TInput, bool) string:返回验证消息,TInput：bizContent序列化后的对象,bool:验证是否通过</returns>
        public virtual (string, TInput, bool) ApiValidateInput<TInput>(string bizContent, Expression<Func<TInput, object>> expression, Expression<Func<TInput, object>> validateExpression)
        {
            try
            {
                TInput input = JsonConvert.DeserializeObject<TInput>(bizContent);
                if (!(input is System.Collections.IList))
                {
                    Response = input.ValidationEntity(expression, validateExpression);
                    return (Response.Message, input, Response.Status);
                }
                System.Collections.IList list = input as System.Collections.IList;
                for (int i = 0; i < list.Count; i++)
                {
                    Response = list[i].ValidationEntity(expression?.GetExpressionProperty(),
                        validateExpression?.GetExpressionProperty());
                    if (!Response.Status)
                        return (Response.Message, default(TInput), false);
                }
                return ("", input, true);
            }
            catch (Exception ex)
            {
                Response.Status = false;
                Response.Message = ApiMessage.ParameterError;
                Logger.Error(LoggerType.HandleError, bizContent, null, ex.Message);
            }
            return (Response.Message, default(TInput), Response.Status);
        }

        /// <summary>
        /// 将数据源映射到新的数据中,目前只支持List<TSource>映射到List<TResult>或TSource映射到TResult
        /// 目前只支持Dictionary或实体类型
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="source"></param>
        /// <param name="resultExpression">只映射返回对象的指定字段</param>
        /// <param name="sourceExpression">只映射数据源对象的指定字段</param>
        /// 过滤条件表达式调用方式：List表达式x => new { x[0].MenuName, x[0].Menu_Id}，表示指定映射MenuName,Menu_Id字段
        ///  List<Sys_Menu> list = new List<Sys_Menu>();
        ///  list.MapToObject<List<Sys_Menu>, List<Sys_Menu>>(x => new { x[0].MenuName, x[0].Menu_Id}, null);
        ///  
        ///过滤条件表达式调用方式：实体表达式x => new { x.MenuName, x.Menu_Id}，表示指定映射MenuName,Menu_Id字段
        ///  Sys_Menu sysMenu = new Sys_Menu();
        ///  sysMenu.MapToObject<Sys_Menu, Sys_Menu>(x => new { x.MenuName, x.Menu_Id}, null);
        /// <returns></returns>
        public virtual TResult MapToEntity<TSource, TResult>(TSource source, Expression<Func<TResult, object>> resultExpression,
            Expression<Func<TSource, object>> sourceExpression = null) where TResult : class
        {
            return source.MapToObject<TSource, TResult>(resultExpression, sourceExpression);
        }

        /// <summary>
        /// 将一个实体的赋到另一个实体上,应用场景：
        /// 两个实体，a a1= new a();b b1= new b();  a1.P=b1.P; a1.Name=b1.Name;
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="source"></param>
        /// <param name="result"></param>
        /// <param name="expression">指定对需要的字段赋值,格式x=>new {x.Name,x.P},返回的结果只会对Name与P赋值</param>
        public virtual void MapValueToEntity<TSource, TResult>(TSource source, TResult result, Expression<Func<TResult, object>> expression = null) where TResult : class
        {
            source.MapValueToEntity<TSource, TResult>(result, expression);
        }
    }
}
