/*
 *所有关于App_ReportPrice类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*App_ReportPriceService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Extensions;
using VOL.Core.Utilities;
using System.Threading.Tasks;
using VOL.AppManager.Repositories;
using System.Collections.Generic;
using VOL.Core.Enums;
using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace VOL.AppManager.Services
{
    public partial class App_ReportPriceService
    {

        //参照App_ReportPrice.js与App_ReportPriceModelBody.vue文件
        //App_ReportPrice.js为代码生成的扩展文件
        //App_ReportPriceModelBody.vue为自己创建的扩展文件，里面可以写任意代码



        /// <summary>
        /// 获取table1的数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        public async Task<object> GetTable1Data(PageDataOptions loadData)
        {
            //App_ReportPriceModelBody.vue中loadTableBefore方法查询前给loadData.Value写入的值
            object value = loadData.Value;
            //获取查询到的总和数
            int total = await App_NewsRepository.Instance.FindAsIQueryable(x => 1 == 1).CountAsync();

            var data = await App_NewsRepository.Instance
                //这里可以自己查询条件，从 loadData.Value找前台自定义传的查询条件
                .FindAsIQueryable(x => 1 == 1)
                //分页
                .TakeOrderByPage(1, 10, x => new Dictionary<object, QueryOrderBy>() { { x.CreateDate, QueryOrderBy.Desc } })
                .Select(s => new { s.Id, s.Title, s.ImageUrl, s.Enable, s.CreateDate, s.DailyRecommend })
                .ToListAsync();
            object gridData = new { rows = data, total };
            return gridData;
        }

        /// <summary>
        /// 获取table2的数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        public async Task<object> GetTable2Data(PageDataOptions loadData)
        {
            //App_ReportPriceModelBody.vue中loadTableBefore方法查询前给loadData.Value写入的值
            //获取查询到的总和数
            int total = await repository.DbContext.Set<App_Appointment>().Where(x => 1 == 1).CountAsync();
            //从 loadData.Value取查询条件，分页等信息
            //这里可以自己查询条件，从 loadData.Value找前台自定义传的查询条件
            var data = await repository.DbContext.Set<App_Appointment>().Where(x => 1 == 1)
                //分页
                .TakeOrderByPage(1, 10, x => new Dictionary<object, QueryOrderBy>() { { x.CreateDate, QueryOrderBy.Desc } })
                .Select(s => new { s.Id, s.Name, s.PhoneNo, s.Describe, s.CreateDate })
                .ToListAsync();
            object gridData = new { rows = data, total };
            return gridData;
        }

        WebResponseContent _webResponse = new WebResponseContent();

        /// <summary>
        /// 验证提交的从表参数
        /// saveModel.Extra在App_ReportPrice.js中addBefore/updateBefore新建与编辑时提交到的后台
        /// </summary>
        /// <param name="saveModel"></param>
        /// <returns></returns>
        private WebResponseContent ValidateExtra(SaveModel saveModel)
        {
            if (saveModel == null || saveModel.Extra == null) return _webResponse.Error("请提交参数");
            try
            {
                TableExtra tableExtra = saveModel.Extra.ToString().DeserializeObject<TableExtra>();
                if (tableExtra == null
                    || tableExtra.Table1List == null
                    || tableExtra.Table1List.Count == 0
                    || tableExtra.Table1List == null
                    || tableExtra.Table2List.Count == 0)
                {
                    return _webResponse.Error("请提交从表1与从表2的参数");
                }
                //校验 从表1字段:Title,CreateDate必填 
                _webResponse = tableExtra.Table1List.ValidationEntityList(x => new { x.Title, x.CreateDate });
                if (!_webResponse.Status)
                {
                    _webResponse.Message = "从表1：" + _webResponse.Message;
                    return _webResponse;
                }
                //校验 从表2字段:Describe, Name,PhoneNo 必填 
                _webResponse = tableExtra.Table2List.ValidationEntityList(x => new { x.Describe, x.Name, x.PhoneNo });
                if (!_webResponse.Status)
                {
                    _webResponse.Message = "从表2：" + _webResponse.Message;
                    return _webResponse;
                }
                //校验成功返回
                return _webResponse.OK(null, tableExtra);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return _webResponse.Error("参数不正确");
            }
        }


        /// <summary>
        /// 自定义保存从表数据逻辑
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            //校验从表配置
            ValidateExtra(saveDataModel);
            if (!_webResponse.Status)
            {
                return _webResponse;
            }
            //取出校验完成后的从表1.2的数据
            TableExtra tableExtra = _webResponse.Data as TableExtra;


            //保存到数据库前
            AddOnExecuting = (App_ReportPrice price, object obj) =>
            {
                return WebResponseContent.Instance.OK();
            };
            //App_ReportPrice 此处已经提交了数据库，处于事务中
            AddOnExecuted = (App_ReportPrice price, object obj) =>
            {
                //在此操作tableExtra从表信息
                return WebResponseContent.Instance.OK();
            };
            return base.Add(saveDataModel);
        }

        /// <summary>
        /// 自定义更新从表操作
        /// </summary>
        /// <param name="saveModel"></param>
        /// <returns></returns>
        public override WebResponseContent Update(SaveModel saveModel)
        {
            //校验从表配置
            ValidateExtra(saveModel);
            if (!_webResponse.Status)
            {
                return _webResponse;
            }
            //取出校验完成后的从表1.2的数据
            TableExtra tableExtra = _webResponse.Data as TableExtra;


            //保存到数据库前
            UpdateOnExecuting = (App_ReportPrice price, object obj, object obj2, List<object> list) =>
           {
               return WebResponseContent.Instance.OK();
           };

            //App_ReportPrice 此处已经提交了数据库，处于事务中
            UpdateOnExecuted = (App_ReportPrice price, object obj, object obj2, List<object> list) =>
            {
                //在此操作tableExtra从表信息
                return WebResponseContent.Instance.OK();
            };
            return base.Update(saveModel);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="keys"></param>
        /// <param name="delList"></param>
        /// <returns></returns>
        public override WebResponseContent Del(object[] keys, bool delList = true)
        {
            return base.Del(keys, true);
        }
    }

    public class TableExtra
    {
        /// <summary>
        /// 从表1
        /// </summary>
        public List<Table1> Table1List { get; set; }

        /// <summary>
        /// 从表2
        /// </summary>
        public List<Table2> Table2List { get; set; }
    }
    /// <summary>
    /// 从表1
    /// </summary>
    public class Table1
    {
        [Display(Name = "ID")]
        [Column(TypeName = "int")]
        public int? Id { get; set; }

        [Display(Name = "标题")]
        [MaxLength(50)]
        [Column(TypeName = "nvarchar(50)")]
        public string Title { get; set; }

        [Display(Name = "封面图片")]
        [MaxLength(500)]
        [Column(TypeName = "nvarchar(500)")]
        public string ImageUrl { get; set; }

        [Display(Name = "内容推荐")]
        [Column(TypeName = "int")]
        public int? DailyRecommend { get; set; }

        [Display(Name = "是否启用")]
        //   [Column(TypeName = "int")]
        public string Enable { get; set; }

        [Display(Name = "发布时间")]
        [Column(TypeName = "datetime")]
        public DateTime? CreateDate { get; set; }
    }


    /// <summary>
    /// 从表1
    /// </summary>
    public class Table2
    {
        [Display(Name = "Id")]
        [MaxLength(36)]
        [Column(TypeName = "uniqueidentifier")]
        public Guid? Id { get; set; }

        [Display(Name = "姓名")]
        [MaxLength(50)]
        [Column(TypeName = "nvarchar(50)")]
        public string Name { get; set; }


        [Display(Name = "描述")]
        [MaxLength(250)]
        [Column(TypeName = "nvarchar(250)")]
        public string Describe { get; set; }

        [Display(Name = "电话")]
        [MaxLength(15)]
        [Column(TypeName = "nvarchar(15)")]
        public string PhoneNo { get; set; }

        [Display(Name = "创建时间")]
        [Column(TypeName = "datetime")]
        [Editable(true)]
        public DateTime? CreateDate { get; set; }
    }
}
