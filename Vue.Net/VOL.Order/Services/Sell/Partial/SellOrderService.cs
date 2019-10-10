/*
 *所有关于SellOrder类的业务代码应在此处编写
*/
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using VOL.Core.Configuration;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.Order.Repositories;

namespace VOL.Order.Services
{
    public partial class SellOrderService
    {
        public string GetServiceDate()
        {
            return DateTime.Now.ToString("yyyy-MM-dd HH:mm:sss");
        }
        //此SellOrderService.cs类由代码生成器生成，默认是没有任何代码，如果需要写业务代码，请在此类中实现
        //如果默认的增、删、改、查、导入、导出、审核满足不了业务，请参考下面的方法进行业务代码扩展(扩展代码是对ServiceFunFilter.cs的实现)

        //==============常用操作=======================
        //访问数据库
        //1、使用 repository. 使用原生EF  repository.DbContext
        //    repository.DbContext.Set<Sys_User>().Find() 
        //    SellOrderRepository.Instance.Find()        
        //    SellOrderListRepository.Instance.Find()
        //    DBServerProvider.SqlDapper
        //    DBServerProvider.DbContext
        //    以上方式都能访问数据库

        //2、使用EF事务 repository.DbContextBeginTransaction或 SellOrderRepository.Instance.DbContextBeginTransaction

        //3、Dapper 使用：repository.DapperContext , DBServerProvider.SqlDapper

        //4、获取Memory/Redis对象
        // base.CacheContext 
        // AutofacContainerModule.GetService<ICacheService>()
        // VOL.Core.Utilities.HttpContext.Current.RequestServices
        // VOL.Core.Utilities.HttpContext.Current.RequestServices.GetService(typeof(ICacheService))

        //5、使用HttpContext：VOL.Core.Utilities.HttpContext

        //获取用户信息/权限 
        //6、UserContext.Current/UserContext.Current.Permissions

        //7、获取配置信息appsettings.json
        // AppSetting   /    AppSetting.Configuration

        //8、查看权限验证规则 Vol.Core->Filters文件夹下权限控制类

        //9、其他封装了大量的常用扩展方法Vol.Core->Extensions文件夹下(如：字符串扩展、表达式扩展、实体验证(EntityProperties)扩展方法)

        //10、实体数据合法性校验(ServiceBase.cs有大量实体校验示例)
        //SellOrder order = new SellOrder();
        //校验指定字段x.TranNo, x.Auditor的类型、长度等合法性
        //order.ValidationEntity(x => new { x.TranNo, x.Auditor});

        //11、获取实体的配置信息，如：字段中文名称、最大长度、字段主键等信息
        // Type type = typeof(SellOrder);
        //获取主键字段
        // PropertyInfo key = type.GetKeyProperty();
        //获取主键字段名
        // type.GetKeyName();
        //判断某个字段是否有EditableAttribute属性
        //  key.ContainsCustomAttributes(typeof(EditableAttribute));
        
        //12、常用工具类Vol.Core->Utilities 

        //写入日志 : Logger.Info();

        //其中有一部分真实扩展代码实现:Partial->Sys_UserService.cs  , Partial->Sys_RoleService ,Partial->Sys_DictionaryService

        /// <summary>
        /// 查询业务代码编写
        /// </summary>
        /// <param name="pageData"></param>
        /// <returns></returns>
        public override object GetDetailPage(PageDataOptions pageData)
        {
           
            //此处是从前台提交的原生的查询条件，这里可以自己过滤
            QueryRelativeList = (List<SearchParameters> parameters) =>
            {
               
            };
            //查询前可以自已设定查询表达式的条件
            QueryRelativeExpression = (IQueryable<SellOrder> queryable) =>
            {
                queryable = queryable.Where(x => 1 == 1);
                return queryable;
            };
            //指定多个字段进行排序
            OrderByExpression = x => new Dictionary<object, QueryOrderBy>() {
                { x.CreateDate,QueryOrderBy.Desc },
                { x.SellNo,QueryOrderBy.Desc}
            };

            //查询完成后，在返回页面前可对查询的数据进行操作
            GetPageDataOnExecuted = (PageGridData<SellOrder> grid) =>
            {
                //可对查询的结果的数据操作
                List<SellOrder> sellOrders = grid.rows;
            };

            return base.GetDetailPage(pageData);
        }

        /// <summary>
        /// 新建
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            WebResponseContent responseContent= WebResponseContent.Instance;
            //此处saveModel是从前台提交的原生数据，可对数据进修改过滤
            AddOnExecute = (SaveModel saveModel) =>
            {
                //如果返回false,后面代码不会再执行
                return responseContent.OK();
            };
            // 在保存数据库前的操作，所有数据都验证通过了，这一步执行完就执行数据库保存
            AddOnExecuting = (SellOrder order, object list) =>
            {
                List<SellOrderList> orderLists = list as List<SellOrderList>;
                if (orderLists == null || orderLists.Count == 0)
                {//如果没有界面上没有填写明细，则中断执行
                    return responseContent.Error("必须填写明细数据");
                }
                if (orderLists.Exists(x => x.Qty <= 20))
                    return responseContent.Error("明细数量必须大于20");

                return responseContent.OK();
            };

            //此方法中已开启了事务，如果在此方法中做其他数据库操作，请不要再开启事务
            // 在保存数据库后的操作，此时已进行数据提交，但未提交事务，如果返回false，则会回滚提交
            AddOnExecuted = (SellOrder order, object list) =>
            {
                if (order.Qty < 10)
                {  //如果输入的销售数量<10，会回滚数据库
                    return responseContent.Error("销售数量必须大于1000");
                }
                return responseContent.OK("已新建成功,台AddOnExecuted方法返回的消息");
            };

            return base.Add(saveDataModel);
        }
        /// <summary>
        /// 编辑操作
        /// </summary>
        /// <param name="saveModel"></param>
        /// <returns></returns>
        public override WebResponseContent Update(SaveModel saveModel)
        {
            //此处saveModel是从前台提交的原生数据，可对数据进修改过滤
            UpdateOnExecute = (SaveModel model) =>
            {
                //如果返回false,后面代码不会再执行
                return new WebResponseContent().OK();
            };
            //编辑方法保存数据库前处理
            UpdateOnExecuting = (SellOrder order, object addList, object updateList, List<object> delKeys) =>
              {
                  if (order.TranNo == "2019000001810001")
                  {
                      return new WebResponseContent().Error("不能删除此[" + order.TranNo + "]单号");
                  }
                  //新增的明细
                  List<SellOrderList> add = addList as List<SellOrderList>;
                  //修改的明细
                  List<SellOrderList> update = updateList as List<SellOrderList>;
                  //删除的行的Id
                  var guids = delKeys?.Select(x => (Guid)x);
                  return new WebResponseContent().OK();
              };

            //编辑方法保存数据库后处理
            //此方法中已开启了事务，如果在此方法中做其他数据库操作，请不要再开启事务
            // 在保存数据库后的操作，此时已进行数据提交，但未提交事务，如果返回false，则会回滚提交
            UpdateOnExecuted = (SellOrder order, object addList, object updateList, List<object> delKeys) =>
              {
                  //新增的明细
                  List<SellOrderList> add = addList as List<SellOrderList>;
                  //修改的明细
                  List<SellOrderList> update = updateList as List<SellOrderList>;
                  //删除的行的主键
                  var guids = delKeys?.Select(x => (Guid)x);
                  return new WebResponseContent().OK();
              };

            return base.Update(saveModel);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="keys">删除的行的主键</param>
        /// <param name="delList">删除时是否将明细也删除</param>
        /// <returns></returns>
        public override WebResponseContent Del(object[] keys, bool delList = true)
        {
            //删除前处理
            //删除的行的主键
            DelOnExecuting = (object[] _keys) =>
            {
                return new WebResponseContent(true);
            };
            //删除后处理
            //删除的行的主键
            DelOnExecuted = (object[] _keys) =>
             {
                 return new WebResponseContent(true);
             };
            return base.Del(keys, delList);
        }
        public override WebResponseContent Audit(object[] keys, int? auditStatus, string auditReason)
        {
            //审核保存前处理
            AuditOnExecuting = (List<SellOrder> order) =>
            {
                return new WebResponseContent().OK();
            };

            AuditOnExecuted = (List<SellOrder> order) =>
            {
                return new WebResponseContent().OK();
            };
            return base.Audit(keys, auditStatus, auditReason);
        }
        /// <summary>
        /// 导出
        /// </summary>
        /// <param name="pageData"></param>
        /// <returns></returns>
        public override WebResponseContent Export(PageDataOptions pageData)
        {
            //设置最大导出的数量
            Limit = 1000;
            //查询要导出的数据后，在生成excel文件前处理
            //list导出的实体，ignore过滤不导出的字段
            ExportOnExecuting = (List<SellOrder> list, List<string> ignore) =>
            {
                return new WebResponseContent().OK();
            };
            return base.Export(pageData);
        }
        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="files"></param>
        /// <returns></returns>
        public override WebResponseContent Import(List<IFormFile> files)
        {
            //导入保存前处理
            ImportOnExecuting = (List<SellOrder> list) =>
            {
                return new WebResponseContent(true);
            };
            //导入后处理
            ImportOnExecuted = (List<SellOrder> list) =>
            {
                return new WebResponseContent().OK();
            };
            return base.Import(files);
        }
    }
}
