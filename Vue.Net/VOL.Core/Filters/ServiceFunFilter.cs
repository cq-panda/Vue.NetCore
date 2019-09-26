using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using VOL.Core.Enums;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.Filters
{
    public abstract class ServiceFunFilter<T> where T : class
    {
        ///默认导出最大数量5K数据
        protected int Limit { get; set; } = 5000;

        /// <summary>
        /// 查询前,对现在有的查询字符串条件增加或删除
        /// </summary>
        protected Action<List<SearchParameters>> QueryRelativeList { get; set; }

        //查询前,在现有的查询条件上通过表达式修改查询条件
        protected Func<IQueryable<T>, IQueryable<T>> QueryRelativeExpression { get; set; }

        /// <summary>
        /// 指定查询的列，格式:Expression<Func<T, object>> exp = x => new { x.字段1, x.字段2 }
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
        ///导出前处理,DataTable导出的表数据
        ///List<T>导出的数据, List<string>忽略不需要导出的字段
        /// </summary>
        protected Func<List<T>, List<string>, WebResponseContent> ExportOnExecuting;

        /// <summary>
        /// 导入保存前
        /// </summary>
        protected Func<List<T>, WebResponseContent> ImportOnExecuted;

        /// <summary>
        /// 导入保存后
        /// </summary>
        protected Func<List<T>, WebResponseContent> ImportOnExecuting;
    }
}
