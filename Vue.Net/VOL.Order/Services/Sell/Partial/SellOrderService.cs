/*
 *所有关于SellOrder类的业务代码应在此处编写
*/
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using VOL.Core.BaseProvider;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.UserManager;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.Order.IRepositories;
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

        WebResponseContent webResponse = new WebResponseContent();
        private IHttpContextAccessor _httpContextAccessor;
        private ISellOrderRepository _repository;
        [ActivatorUtilitiesConstructor]
        public SellOrderService(IHttpContextAccessor httpContextAccessor, ISellOrderRepository repository)
            : base(repository)
        {
            _httpContextAccessor = httpContextAccessor;
            _repository = repository;
            base.Init(_repository);
            //2020.08.15
            //开启多租户功能,开启后会对查询、导出、删除、编辑功能同时生效
            //如果只需要对某个功能生效，如编辑，则在重写编辑方法中设置 IsMultiTenancy = true;
            IsMultiTenancy = true;
        }
        //查询
        public override PageGridData<SellOrder> GetPageData(PageDataOptions options)
        {
            //options.Value可以从前台查询的方法提交一些其他参数放到value里面
            //前端提交方式，见文档：组件api->viewgrid组件里面的searchBefore方法
            object extraValue = options.Value;

            //此处是从前台提交的原生的查询条件，这里可以自己过滤
            QueryRelativeList = (List<SearchParameters> parameters) =>
            {

            };

            //2020.08.15
            //设置原生查询的sql语句，这里必须返回select * 表所有字段
            //（先内部过滤数据,内部调用EF方法FromSqlRaw,自己写的sql注意sql注入的问题），不会影响界面上提交的查询
            /*  
             *  string date = DateTime.Now.AddYears(-10).ToString("yyyy-MM-dd");
                QuerySql = $@"select * from SellOrder  
                                       where createdate>'{date}'
                                           and  Order_Id in (select Order_Id from SellOrderList)
                                           and CreateID={UserContext.Current.UserId}";
            */

            //2020.08.15
            //此处与上面QuerySql只需要实现其中一个就可以了
            //查询前可以自已设定查询表达式的条件
            QueryRelativeExpression = (IQueryable<SellOrder> queryable) =>
            {
                //当前用户只能操作自己(与下级角色)创建的数据,如:查询、删除、修改等操作
                //IQueryable<int> userQuery = RoleContext.GetCurrentAllChildUser();
                //queryable = queryable.Where(x => x.CreateID == UserContext.Current.UserId || userQuery.Contains(x.CreateID ?? 0));
                return queryable;
            };

            //指定多个字段进行排序
            OrderByExpression = x => new Dictionary<object, QueryOrderBy>() {
                { x.CreateDate,QueryOrderBy.Desc },
                { x.SellNo,QueryOrderBy.Asc}
            };

            //int a = 1;
            ////指定多个字段按条件进行排序（需要2021.07.04更新LambdaExtensions类后才能使用）
            //OrderByExpression = x => new Dictionary<object, QueryOrderBy>() {
            //    { x.CreateDate,QueryOrderBy.Desc },
            //    { x.SellNo,a==1?QueryOrderBy.Desc:QueryOrderBy.Asc}
            //};


            //查询完成后，在返回页面前可对查询的数据进行操作
            GetPageDataOnExecuted = (PageGridData<SellOrder> grid) =>
            {
                //可对查询的结果的数据操作
                List<SellOrder> sellOrders = grid.rows;
            };
            //查询table界面显示求和
            SummaryExpress = (IQueryable<SellOrder> queryable) =>
            {
                return queryable.GroupBy(x => 1).Select(x => new
                {
                    //AvgPrice注意大小写和数据库字段大小写一样
                    Qty = x.Sum(o => o.Qty).ToString("f2")
                })
                .FirstOrDefault();
            };

            return base.GetPageData(options);
        }
        /// <summary>
        /// 设置弹出框明细表的合计信息
        /// </summary>
        /// <typeparam name="detail"></typeparam>
        /// <param name="queryeable"></param>
        /// <returns></returns>
        protected override object GetDetailSummary<detail>(IQueryable<detail> queryeable)
        {
            return (queryeable as IQueryable<SellOrderList>).GroupBy(x => 1).Select(x => new
            {
                //Weight/Qty注意大小写和数据库字段大小写一样
                Weight = x.Sum(o => o.Weight),
                Qty = x.Sum(o => o.Qty)
            }).FirstOrDefault();
        }

        /// <summary>
        /// 查询业务代码编写(从表(明细表查询))
        /// </summary>
        /// <param name="pageData"></param>
        /// <returns></returns>
        public override object GetDetailPage(PageDataOptions pageData)
        {
            //自定义查询胆细表

            ////明细表自定义查询方式一：EF
            //var query = SellOrderListRepository.Instance.IQueryablePage<SellOrderList>(
            //     pageData.Page,
            //     pageData.Rows,
            //     out int count,
            //     x => x.Order_Id == pageData.Value.GetGuid(),
            //      orderBy: x => new Dictionary<object, QueryOrderBy>() { { x.CreateDate, QueryOrderBy.Desc } }
            //    );
            //PageGridData<SellOrderList> detailGrid = new PageGridData<SellOrderList>();
            //detailGrid.rows = query.ToList();
            //detailGrid.total = count;

            ////明细表自定义查询方式二：dapper
            //string sql = "select count(1) from SellOrderList where Order_Id=@orderId";
            //detailGrid.total = repository.DapperContext.ExecuteScalar(sql, new { orderId = pageData.Value }).GetInt();

            //sql = @$"select * from (
            //              select *,ROW_NUMBER()over(order by createdate desc) as rowId 
            //           from SellOrderList where Order_Id=@orderId
            //        ) as s where s.rowId between {((pageData.Page - 1) * pageData.Rows + 1)} and {pageData.Page * pageData.Rows} ";
            //detailGrid.rows = repository.DapperContext.QueryList<SellOrderList>(sql, new { orderId = pageData.Value });

            //return detailGrid;

            return base.GetDetailPage(pageData);
        }

        /// <summary>
        /// 新建
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            //此处saveModel是从前台提交的原生数据，可对数据进修改过滤
            AddOnExecute = (SaveModel saveModel) =>
            {
                //如果返回false,后面代码不会再执行
                return webResponse.OK();
            };
            // 在保存数据库前的操作，所有数据都验证通过了，这一步执行完就执行数据库保存
            AddOnExecuting = (SellOrder order, object list) =>
            {
                //如果设置code=-1会强制返回，不再继续后面的操作,2021.07.04更新LambdaExtensions文件后才可以使用此属性
                //webResponse.Code = "-1";
                // webResponse.Message = "测试强制返回";
                //return webResponse.OK();

                List<SellOrderList> orderLists = list as List<SellOrderList>;
                if (orderLists == null || orderLists.Count == 0)
                {//如果没有界面上没有填写明细，则中断执行
                    return webResponse.Error("必须填写明细数据");
                }
                if (orderLists.Exists(x => x.Qty <= 20))
                    return webResponse.Error("明细数量必须大于20");

                return webResponse.OK();
            };

            //此方法中已开启了事务，如果在此方法中做其他数据库操作，请不要再开启事务
            // 在保存数据库后的操作，此时已进行数据提交，但未提交事务，如果返回false，则会回滚提交
            AddOnExecuted = (SellOrder order, object list) =>
            {
                if (order.Qty < 10)
                {  //如果输入的销售数量<10，会回滚数据库
                    return webResponse.Error("销售数量必须大于1000");
                }
                return webResponse.OK("已新建成功,台AddOnExecuted方法返回的消息");
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
                ////这里的设置配合下面order.Remark = "888"代码位置使用
                // saveModel.MainData.TryAdd("Remark", "1231");

                //如果不想前端提交某些可以编辑的字段的值,直接移除字段
                // saveModel.MainData.Remove("字段");

                //如果返回false,后面代码不会再执行
                return webResponse.OK();

            };



            //编辑方法保存数据库前处理
            UpdateOnExecuting = (SellOrder order, object addList, object updateList, List<object> delKeys) =>
              {
                  if (order.TranNo == "2019000001810001")
                  {
                      //如果设置code=-1会强制返回，不再继续后面的操作,2021.07.04更新LambdaExtensions文件后才可以使用此属性
                      //webResponse.Code = "-1";
                      // webResponse.Message = "测试强制返回";
                      //return webResponse.OK();
                      return webResponse.Error("不能更新此[" + order.TranNo + "]单号");
                  }

                  ////如果要手动设置某些字段的值,值不是前端提交的（代码生成器里面编辑行必须设置为0并生成model）,如Remark字段:
                  ////注意必须设置上面saveModel.MainData.TryAdd("Remark", "1231")
                  //order.Remark = "888";


                  //新增的明细表
                  List<SellOrderList> add = addList as List<SellOrderList>;
                  //修改的明细表
                  List<SellOrderList> update = updateList as List<SellOrderList>;
                  //删除明细表Id
                  var guids = delKeys?.Select(x => (Guid)x);

                  return webResponse.OK();
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
                  return webResponse.OK();
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
                return webResponse.OK();
            };
            //删除后处理
            //删除的行的主键
            DelOnExecuted = (object[] _keys) =>
             {
                 return webResponse.OK();
             };
            return base.Del(keys, delList);
        }
        public override WebResponseContent Audit(object[] keys, int? auditStatus, string auditReason)
        {
            //审核保存前处理
            AuditOnExecuting = (List<SellOrder> order) =>
            {
                return webResponse.OK();
            };

            AuditOnExecuted = (List<SellOrder> order) =>
            {
                return webResponse.OK();
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
            //指定导出的字段(2020.05.07)
            ExportColumns = x => new { x.SellNo, x.TranNo, x.CreateDate };

            //查询要导出的数据后，在生成excel文件前处理
            //list导出的实体，ignore过滤不导出的字段
            ExportOnExecuting = (List<SellOrder> list, List<string> ignore) =>
            {
                return webResponse.OK();
            };

            return base.Export(pageData);
        }

        /// <summary>
        /// 下载模板(导入时弹出框中的下载模板)(2020.05.07)
        /// </summary>
        /// <returns></returns>
        public override WebResponseContent DownLoadTemplate()
        {
            //指定导出模板的字段,如果不设置DownLoadTemplateColumns，默认导出查所有页面上能看到的列(2020.05.07)
            DownLoadTemplateColumns = x => new { x.SellNo, x.TranNo, x.Remark, x.CreateDate };
            return base.DownLoadTemplate();
        }

        /// <summary>
        /// 导入
        /// </summary>
        /// <param name="files"></param>
        /// <returns></returns>
        public override WebResponseContent Import(List<IFormFile> files)
        {
            //(2020.05.07)
            //设置导入的字段(如果指定了上面导出模板的字段，这里配置应该与上面DownLoadTemplate方法里配置一样)
            //如果不设置导入的字段DownLoadTemplateColumns,默认显示所有界面上所有可以看到的字段
            DownLoadTemplateColumns = x => new { x.SellNo, x.TranNo, x.Remark, x.CreateDate };

            //导入保存前处理(可以对list设置新的值)
            ImportOnExecuting = (List<SellOrder> list) =>
            {
                return webResponse.OK();
            };

            //导入后处理(已经写入到数据库了)
            ImportOnExecuted = (List<SellOrder> list) =>
            {
                return webResponse.OK();
            };
            return base.Import(files);
        }

    }
}
