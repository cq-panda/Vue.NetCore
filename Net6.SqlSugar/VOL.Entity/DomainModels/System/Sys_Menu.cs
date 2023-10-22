/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using SqlSugar;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.Entity.SystemModels;

namespace VOL.Entity.DomainModels
{
    [Table("Sys_Menu")]
    [EntityAttribute(TableCnName = "菜单配置")]
    public class Sys_Menu : BaseEntity
    {
        /// <summary>
        ///ID
        /// </summary>
        [Key]
        [Display(Name = "ID")]
        [Column(TypeName = "int")]
        [Editable(true)]
        [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        [Required(AllowEmptyStrings = false)]
        public int Menu_Id { get; set; }

        /// <summary>
        ///父级ID
        /// </summary>
        [Display(Name = "父级ID")]
        [DisplayFormat(DataFormatString = "10,0")]
        [Column(TypeName = "int")]
        [Editable(true)]
        [Required(AllowEmptyStrings = false)]
        public int ParentId { get; set; }


        /// <summary>
        ///菜单名称
        /// </summary>
        [Display(Name = "菜单名称")]
        [MaxLength(50)]
        [Column(TypeName = "nvarchar(50)")]
        [Editable(true)]
        [Required(AllowEmptyStrings = false)]
        public string MenuName { get; set; }

        /// <summary>
        ///
        /// </summary>
        [Display(Name = "TableName")]
        [MaxLength(200)]
        [Column(TypeName = "nvarchar(200)")]
        [Editable(true)]
        public string TableName { get; set; }

        /// <summary>
        ///
        /// </summary>
        [Display(Name = "Url")]
        [MaxLength(10000)]
        [Column(TypeName = "nvarchar(10000)")]
        [Editable(true)]
        public string Url { get; set; }

        /// <summary>
        ///权限
        /// </summary>
        [Display(Name = "权限")]
        [MaxLength(10000)]
        [Column(TypeName = "nvarchar(10000)")]
        [Editable(true)]
        public string Auth { get; set; }


        /// <summary>
        ///
        /// </summary>
        [Display(Name = "Description")]
        [MaxLength(200)]
        [Column(TypeName = "nvarchar(200)")]
        [Editable(true)]
        public string Description { get; set; }


        /// <summary>
        ///图标
        /// </summary>
        [Display(Name = "图标")]
        [MaxLength(50)]
        [Column(TypeName = "nvarchar(50)")]
        [Editable(true)]
        public string Icon { get; set; }

        /// <summary>
        ///排序号
        /// </summary>
        [Display(Name = "排序号")]
        [DisplayFormat(DataFormatString = "10,0")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? OrderNo { get; set; }

        /// <summary>
        ///创建人
        /// </summary>
        [Display(Name = "创建人")]
        [MaxLength(50)]
        [Column(TypeName = "nvarchar(50)")]
        [Editable(true)]
        public string Creator { get; set; }

        /// <summary>
        ///创建时间
        /// </summary>
        [Display(Name = "创建时间")]
        [Column(TypeName = "datetime")]
        [Editable(true)]
        public DateTime? CreateDate { get; set; }

        /// <summary>
        ///
        /// </summary>
        [Display(Name = "Modifier")]
        [MaxLength(50)]
        [Column(TypeName = "nvarchar(50)")]
        [Editable(true)]
        public string Modifier { get; set; }

        /// <summary>
        ///
        /// </summary>
        [Display(Name = "ModifyDate")]
        [Column(TypeName = "datetime")]
        [Editable(true)]
        public DateTime? ModifyDate { get; set; }

        /// <summary>
        ///是否启用
        /// </summary>
        [Display(Name = "是否启用")]
        [Column(TypeName = "tinyint")]
        [Editable(true)]
        public byte? Enable { get; set; }


        /// <summary>
        /// 2022.03.26
        /// 菜单类型1:移动端，0:PC端
        /// </summary>
        /// </summary>
        [Display(Name = "是否启用")]
        [Column(TypeName = "int")]
        [Editable(true)]
        public int? MenuType { get; set; }


        [Navigate(NavigateType.OneToMany, nameof(Menu_Id), nameof(Menu_Id))]
        public List<Sys_Actions> Actions { get; set; }
    }
}
