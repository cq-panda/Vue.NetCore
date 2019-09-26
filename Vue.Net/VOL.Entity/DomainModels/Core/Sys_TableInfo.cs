using VOL.Entity.SystemModels;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace VOL.Entity.DomainModels
{
    [EntityAttribute(DetailTable = new Type[] { typeof(Sys_TableColumn) })]
    public class Sys_TableInfo : BaseEntity
    {
        [Key]
        [Column(TypeName = "int")]
        public int Table_Id { get; set; }
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? ParentId { get; set; }

        [Editable(true)]
        public string TableName { get; set; }
        [Editable(true)]
        public string TableTrueName { get; set; }
        [Editable(true)]
        public string ColumnCNName { get; set; }


        public string Namespace { get; set; }

        [Editable(true)]
        public string FolderName { get; set; }

        [Editable(true)]
        public string DataTableType { get; set; }

        [Editable(true)]
        public string EditorType { get; set; }
        [Editable(true)]
        [Column(TypeName = "int")]
        public int? OrderNo { get; set; }
        [Editable(true)]
        public string UploadField { get; set; }
        [Editable(true)]
        public int? UploadMaxCount { get; set; }
        [Editable(true)]
        public string RichText { get; set; }
        [Editable(true)]
        public string ExpressField { get; set; }
        [Editable(true)]
        public string DBServer { get; set; }
        [Editable(true)]
        public string SortName { get; set; }
        [Editable(true)]
        public string DetailCnName { get; set; }


        [Editable(true)]
        public string DetailName { get; set; }

        [Editable(true)]
        [Column(TypeName = "int")]
        public int? Enable { get; set; }


        [Editable(true)]
        public string CnName { get; set; }

        public List<Sys_TableColumn> TableColumns { get; set; }

    }
}
