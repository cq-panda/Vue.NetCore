using System;
using System.Collections.Generic;
using System.Linq;
using VOL.Core.Configuration;
using VOL.Core.Configuration.ConfigModel;

namespace VOL.Core.Configuration
{

    public class TableExportConfig : IConfig
    {
        public List<TableList> Tables { get; set; }

        /// <summary>
        /// 用户页(修改时间)
        /// </summary>
        public DateTime? ModifyDate { get; set; }


        /// <summary>
        /// 数据同步，只会同步目标中有的结构
        /// </summary>
        /// <param name="source">数据源</param>
        /// <param name="targent">目标集合</param>
        public List<TableList> SynchronizeData(List<TableList> source, List<TableList> targent)
        {
            if (source == null || targent != null)
            {
                //循环目标的表结
                foreach (var targentTable in targent)
                {
                    //循环目标的列结构
                    foreach (var targentcColumn in targentTable.TableColumns)
                    {
                        //查询数据源对应数据对应结构是否存在
                        var sourceTable = source.FirstOrDefault(w => w.TableId == targentTable.TableId);
                        if (sourceTable == null) continue;
                        if (sourceTable.TableColumns == null) continue;
                        var sourceColumn = sourceTable.TableColumns.FirstOrDefault(f => f.ColumnId == targentcColumn.ColumnId);
                        if (sourceColumn == null) continue;
                        targentcColumn.ColumnName = sourceColumn.ColumnName;
                        targentcColumn.IsExport = sourceColumn.IsExport;
                    }
                }
            }
            return targent;
        }
    }
}

public class TableList
{
    public int TableId { get; set; }

    public string TableName { get; set; }

    public List<TableColumn> TableColumns { get; set; }
}

public class TableColumn
{
    public int ColumnId { get; set; }
    public string ColumnName { get; set; }

    public Boolean IsExport { get; set; } = false;
}
