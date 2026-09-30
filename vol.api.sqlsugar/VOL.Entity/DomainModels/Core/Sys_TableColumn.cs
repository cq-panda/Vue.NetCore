using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using VOL.Entity.SystemModels;

namespace VOL.Entity.DomainModels
{
    [Table("Sys_TableColumn")]
    public class Sys_TableColumn : BaseEntity
    {
        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int Table_Id { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Key]
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        [SugarColumn(IsPrimaryKey = true,IsIdentity =true)]
        public int ColumnId { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        public string ColumnName { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        [SugarColumn(ColumnName= "ColumnCNName")]
        public string ColumnCnName { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        public string ColumnType { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        public string TableName { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? Maxlength { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? IsNull { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? IsDisplay { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? IsKey { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        public string Columnformat { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        public string Script { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        public string DropNo { get; set; }

        [Editable(true)]
        public int? IsImage { get; set; }
        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? Sortable { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? ColumnWidth { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        public int? SearchRowNo { get; set; }
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? SearchColNo { get; set; }
        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        public string SearchType { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? EditRowNo { get; set; }

        [Editable(true)]
        public int? EditColNo { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [Display(Name = "")]
        [Editable(true)]
        public string EditType { get; set; }

        [Editable(true)]
        [Column(TypeName = "int")]
        public int? ColSize { get; set; }


        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? IsReadDataset { get; set; }
        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? Enable { get; set; }

        [Editable(true)]
        [Column(TypeName = "int")]
        public int? ApiInPut { get; set; }
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? ApiIsNull { get; set; }
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? ApiOutPut { get; set; }
        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        public int? CreateID { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        public string Creator { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        public DateTime? CreateDate { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        public int? ModifyID { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        public string Modifier { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        public DateTime? ModifyDate { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? OrderNo { get; set; }

        /// <summary>
        ///
        /// <summary>
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? IsColumnData { get; set; }

        /// <summary>
        /// 占位文本
        /// </summary>
        [Display(Name = "占位文本")]
        [Editable(true)]
        public string Placeholder { get; set; }

        /// <summary>
        /// 新建默认值
        /// </summary>
        [Display(Name = "新建默认值")]
        [Editable(true)]
        public string AddDefaultValue { get; set; }

        /// <summary>
        /// 文件上传参数
        /// </summary>
        [Display(Name = "文件上传参数")]
        [Editable(true)]
        public string UploadOption { get; set; }

        /// <summary>
        /// 日期查询范围
        /// </summary>
        [Display(Name = "日期查询范围")]
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? SearchDateRange { get; set; }

        /// <summary>
        /// 查询默认值
        /// </summary>
        [Display(Name = "查询默认值")]
        [Editable(true)]
        public string SearchDefaultValue { get; set; }

        /// <summary>
        /// 编辑表单自定义校验
        /// </summary>
        [Display(Name = "编辑表单自定义校验")]
        [Editable(true)]
        public string CustomValidate { get; set; }

        /// <summary>
        /// 字段唯一值
        /// </summary>
        [Display(Name = "字段唯一值")]
        [Editable(true)]
        public int? IsUnique { get; set; }

        /// <summary>
        /// 合计类型
        /// </summary>
        [Display(Name = "合计类型")]
        [Editable(true)]
        public string SummaryType { get; set; }

        /// <summary>
        /// 表头筛选
        /// </summary>
        [Display(Name = "表头筛选")]
        [Editable(true)]
        public int? HeaderFilter { get; set; }

        /// <summary>
        /// 表格对齐方式
        /// </summary>
        [Display(Name = "表格对齐方式")]
        [Editable(true)]
        public string TextAlign { get; set; }

        /// <summary>
        /// 表格超出提示
        /// </summary>
        [Display(Name = "表格超出提示")]
        [Editable(true)]
        public int? ShowOverflowTooltip { get; set; }

        /// <summary>
        /// 固定列
        /// </summary>
        [Display(Name = "固定列")]
        [Editable(true)]
        public string FixedColumn { get; set; }

        /// <summary>
        /// 列计算公式
        /// </summary>
        [Display(Name = "列计算公式")]
        [Editable(true)]
        public string CalcColumn { get; set; }

        /// <summary>
        /// Text1
        /// </summary>
        [Display(Name = "Text1")]
        [Editable(true)]
        public string Text1 { get; set; }

        /// <summary>
        /// Text2
        /// </summary>
        [Display(Name = "Text2")]
        [Editable(true)]
        public string Text2 { get; set; }
    }
}