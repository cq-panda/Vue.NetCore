using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using VOL.Core.Enums;
using VOL.Core.Utilities;
using VOL.Core.WorkFlow;
using VOL.Entity.DomainModels;

namespace VOL.Core.Filters
{
    public abstract class ServiceFunFilter<T> where T : class
    {

        /// <summary>
        /// 2020.08.15是否开启多租户功能
        /// 使用方法见文档或SellOrderService.cs
        /// </summary>
        protected bool IsMultiTenancy { get; set; }

        /// <summary>
        /// 查询界面table 统计、求和、平均值等
        /// 实现方式
        ///SummaryExpress = (IQueryable<App_TransactionAvgPrice> queryable) =>
        //                {
        //                return queryable.GroupBy(x => 1).Select(x => new
        //                {
        //                    AvgPrice = x.Average(o => o.AvgPrice),
        //                    Enable = x.Sum(o => o.Enable)
        //            }).FirstOrDefault();
        //};
        /// </summary>
        //   protected Func<IGrouping<T, T>, object> SummaryExpress = null;
        protected Func<IQueryable<T>, object> SummaryExpress = null;

        /// <summary>
        /// 明细table 统计、求和、平均值等
        /// </summary>
        /// <typeparam name="Detail"></typeparam>
        /// <param name="queryeable"></param>
        /// <returns></returns>
        protected abstract object GetDetailSummary<Detail>(IQueryable<Detail> queryeable);

        /// <summary>
        /// 是否开启用户数据权限,true=用户只能操作自己(及下级角色)创建的数据,如:查询、删除、修改等操作
        /// 注意：需要在代码生成器界面选择【是】及生成Model才会生效)
        /// </summary>
        protected bool LimitCurrentUserPermission { get; set; } = false;

        ///默认导出最大表数量：0不限制 
        protected int Limit { get; set; } = 0;

        /// <summary>
        /// 默认上传文件大小限制3M
        /// </summary>
        protected int LimitUpFileSizee { get; set; } = 3;


        /// <summary>
        /// 2020.08.15添加自定义原生查询sql,这个对于不想写表达式关联或者复杂查询非常有用
        /// 例：QuerySql=$"select * from tb1 as a where  a.name='xxxx' x.id in (select b.id from tb2 b)";
        ///  select * 这里可以自定义，但select 必须返回表所有的列，不能少
        /// </summary>
        protected string QuerySql = null;

        /// <summary>
        /// 查询前,对现在有的查询字符串条件增加或删除
        /// </summary>
        protected Action<List<SearchParameters>> QueryRelativeList { get; set; }

        //查询前,在现有的查询条件上通过表达式修改查询条件
        protected Func<IQueryable<T>, IQueryable<T>> QueryRelativeExpression { get; set; }


        /// <summary>
        /// 指定查询的列，格式:Expression<Func<T, object>> exp = x => new { x.字段1, x.字段2 }(暂时未启用)
        /// </summary>
        protected Expression<Func<T, object>> Columns { get; set; }

        /// <summary>
        /// 设置查询排序参数及方式,参数格式为：
        ///  Expression<Func<T, Dictionary<object, bool>>> orderBy = x => new Dictionary<object, QueryOrderBy>() 
        ///            {{ x.ID, QueryOrderBy.Asc },{ x.DestWarehouseName, QueryOrderBy.Desc } };
        /// 返回的是new Dictionary<object, bool>(){{}}key为排序字段，QueryOrderBy为排序方式
        /// </summary>
        protected Expression<Func<T, Dictionary<object, QueryOrderBy>>> OrderByExpression;

        /// <summary>
        /// 设置查询的表名(已弃用)
        /// </summary>
        protected string TableName { get; set; }

        /// <summary>
        /// 页面查询或导出，从数据库查询出来的结果
        /// </summary>
        protected Action<PageGridData<T>> GetPageDataOnExecuted;

        /// <summary>
        /// 调用新建处理前(SaveModel为传入的原生数据)
        /// </summary>
        protected Func<SaveModel, WebResponseContent> AddOnExecute;

        /// <summary>
        /// 调用新建保存数据库前处理(已将提交的原生数据转换成了对象)
        ///  Func<T, object,ResponseData>  T为主表数据，object为明细数据(如果需要使用明细对象,请用 object as List<T>转换) 
        /// </summary>
        protected Func<T, object, WebResponseContent> AddOnExecuting;

        /// <summary>
        /// 调用新建保存数据库后处理。
        /// **实现当前方法时，内部默认已经开启事务，如果实现的方法操作的是同一数据库,则不需要在AddOnExecuted中事务
        ///  Func<T, object,ResponseData>  T为主表数据，object为明细数据(如果需要使用明细对象,请用 object as List<T>转换) 
        ///  此处已开启了DbContext事务(重点),如果还有其他业务处事，直接在这里写EF代码,不需要再开启事务
        /// 如果执行的是手写sql请用repository.DbContext.Database.ExecuteSqlCommand()或 repository.DbContext.Set<T>().FromSql执行具体sql语句
        /// </summary>
        protected Func<T, object, WebResponseContent> AddOnExecuted;

        /// <summary>
        /// 进入审批流程方法之前
        /// </summary>
        protected Func<T, bool> AddWorkFlowExecuting;

        /// <summary>
        /// 写入审批流程数据之后
        /// list:审批的人id
        /// </summary>
        protected Action<T,List<int>> AddWorkFlowExecuted;

        /// <summary>
        /// 调用更新方法前处理(SaveModel为传入的原生数据)
        /// </summary>
        protected Func<SaveModel, WebResponseContent> UpdateOnExecute;

        /// <summary>
        ///  调用更新方法保存数据库前处理
        ///  (已将提交的原生数据转换成了对象,将明细新增、修改、删除的数据分别用object1/2/3标识出来 )
        ///  T=更新的主表对象
        ///  object1=为新增明细的对象，使用时将object as List<T>转换一下
        ///  object2=为更新明细的对象
        ///  List<object>=为删除的细的对象Key
        /// </summary>
        protected Func<T, object, object, List<object>, WebResponseContent> UpdateOnExecuting;

        /// <summary>
        ///  调用更新方法保存数据库后处理
        ///   **实现当前方法时，内部默认已经开启事务，如果实现的方法操作的是同一数据库,则不需要在UpdateOnExecuted中事务
        ///  (已将提交的原生数据转换成了对象,将明细新增、修改、删除的数据分别用object1/2/3标识出来 )
        ///  T=更新的主表对象
        ///  object1=为新增明细的对象，使用时将object as List<T>转换一下
        ///  object2=为更新明细的对象
        ///  List<object>=为删除的细的对象Key
        /// 此处已开启了DbContext事务(重点),如果还有其他业务处事，直接在这里写EF代码,不需要再开启事务
        /// 如果执行的是手写sql请用repository.DbContext.Database.ExecuteSqlCommand()或 repository.DbContext.Set<T>().FromSql执行具体sql语句
        /// </summary>
        protected Func<T, object, object, List<object>, WebResponseContent> UpdateOnExecuted;

        /// <summary>
        /// 删除前处理,object[]准备删除的主键
        /// </summary>
        protected Func<object[], WebResponseContent> DelOnExecuting;

        /// <summary>
        /// 删除后处理,object[]已删除的主键,此处已开启了DbContext事务(重点),如果还有其他业务处事，直接在这里写EF代码,不需要再开启事务
        /// 如果执行的是手写sql请用repository.DbContext.Database.ExecuteSqlCommand()或 repository.DbContext.Set<T>().FromSql执行具体sql语句
        /// </summary>
        protected Func<object[], WebResponseContent> DelOnExecuted;

        /// <summary>
        /// 审核前处理
        /// </summary>
        protected Func<List<T>, WebResponseContent> AuditOnExecuting;
        /// <summary>
        /// 审核后处理
        /// </summary>
        protected Func<List<T>, WebResponseContent> AuditOnExecuted;


        /// <summary>
        /// 审批流程审核前
        /// T:当前审核的数据
        /// AuditStatus:审核状态
        /// bool:当前数据是否为最后一个人审核
        /// </summary>
        protected Func<T, AuditStatus, bool, WebResponseContent> AuditWorkFlowExecuting;

        /// <summary>
        /// 审批流程审核后
        /// T:当前审核的数据
        /// AuditStatus:审核状态
        /// list:下一个节点的审批人id
        /// bool:当前数据是否为最后一个人审核
        /// </summary>
        protected Func<T, AuditStatus,List<int>, bool, WebResponseContent> AuditWorkFlowExecuted;

        /// <summary>
        ///导出前处理,DataTable导出的表数据
        ///List<T>导出的数据, List<string>忽略不需要导出的字段
        ///此方法不建议使用,由下面ExportColumns委托替代2020.05.07
        /// </summary>
        protected Func<List<T>, List<string>, WebResponseContent> ExportOnExecuting;

        /// <summary>
        /// 2020.05.07
        /// 导出表数据(界面上导出操作),指定要导出的列，格式:Expression<Func<T, object>> exp = x => new { x.字段1, x.字段2 }
        /// </summary>
        protected Expression<Func<T, object>> ExportColumns { get; set; }


        /// <summary>
        /// 2020.05.07
        /// 导出下载模板，指定要导出的模板列，格式:Expression<Func<T, object>> exp = x => new { x.字段1, x.字段2 }
        /// </summary>
        protected Expression<Func<T, object>> DownLoadTemplateColumns { get; set; }

        /// <summary>
        /// 导入保存后
        /// </summary>
        protected Func<List<T>, WebResponseContent> ImportOnExecuted;

        /// <summary>
        /// 导入保存前
        /// </summary>
        protected Func<List<T>, WebResponseContent> ImportOnExecuting;

        /// <summary>
        /// 2022.06.20增加原生excel读取方法(导入时可以自定义读取excel内容)
        /// string=当前读取的excel单元格的值
        /// ExcelWorksheet=excel对象
        /// ExcelRange当前excel单元格对象
        /// int=当前读取的第几数
        /// int=当前读取的第几列
        /// string=返回的值
        /// </summary>
        protected Func<string, ExcelWorksheet, ExcelRange, int, int, string> ImportOnReadCellValue;


        /// <summary>
        /// 自定义上传文件夹(2022.10.07)
        /// </summary>
        protected string UploadFolder = null;

    }
}
