using VOL.Entity.SystemModels;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using SqlSugar;

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
        [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        [Display(Name = "")]
        [Column(TypeName = "int")]
        [Editable(true)]
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
        [Column("ColumnCNName")]
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

   

    }
}
