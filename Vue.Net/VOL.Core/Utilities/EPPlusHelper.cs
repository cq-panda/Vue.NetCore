using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using VOL.Core.DBManager;
using VOL.Core.Extensions;
using VOL.Core.Infrastructure;
using VOL.Entity.DomainModels;

namespace VOL.Core.Utilities
{
    public class EPPlusHelper
    {


        public static WebResponseContent ReadToDataTable<T>(string path, List<string> ignoreTemplate)
        {
            WebResponseContent responseContent = new WebResponseContent();

            FileInfo file = new FileInfo(path);
            if (!file.Exists)  return responseContent.Error("未找到上传的文件,请重新上传");

            List<T> entities = new List<T>();
            using (ExcelPackage package = new ExcelPackage(file))
            {
                if (package.Workbook.Worksheets.Count == 0 ||
                    package.Workbook.Worksheets.FirstOrDefault().Dimension.End.Row <= 1)
                    return responseContent.Error("未导入数据");
                List<CellOptions> cellOptions = GetExportColumnInfo(typeof(T).GetEntityTableName(), false, false);
                //设置忽略的列
                if (ignoreTemplate != null)
                {
                    cellOptions = cellOptions
                        .Where(x => !ignoreTemplate.Select(s => s.ToLower()).Contains(x.ColumnName.ToLower()))
                        .ToList();
                }

                ExcelWorksheet sheetFirst = package.Workbook.Worksheets.FirstOrDefault();

                for (int j = sheetFirst.Dimension.Start.Column, k = sheetFirst.Dimension.End.Column; j <= k; j++)
                {
                    string columnCNName = sheetFirst.Cells[1, j].Value?.ToString()?.Trim();
                    if (!string.IsNullOrEmpty(columnCNName))
                    {
                        CellOptions options = cellOptions.Where(x => x.ColumnCNName == columnCNName).FirstOrDefault();
                        if (options == null)
                        {
                            return responseContent.Error("导入文件列[" + columnCNName + "]不是模板中的列");
                        }
                        if (options.Index > 0)
                        {
                            return responseContent.Error("导入文件列[" + columnCNName + "]不能重复");
                        }
                        options.Index = j;
                    }
                }
                if (cellOptions.Exists(x => x.Index == 0))
                {
                    return responseContent.Error("导入文件列必须与导入模板相同");
                }

                PropertyInfo[] propertyInfos = typeof(T).GetProperties()
                       .Where(x => cellOptions.Select(s => s.ColumnName).Contains(x.Name))
                       .ToArray();
                ExcelWorksheet sheet = package.Workbook.Worksheets.FirstOrDefault();
                for (int m = sheet.Dimension.Start.Row + 1, n = sheet.Dimension.End.Row; m <= n; m++)
                {
                    T entity = Activator.CreateInstance<T>();
                    for (int j = sheet.Dimension.Start.Column, k = sheet.Dimension.End.Column; j <= k; j++)
                    {
                        string value = sheet.Cells[m, j].Value?.ToString();

                        CellOptions options = cellOptions.Where(x => x.Index == j).FirstOrDefault();
                        PropertyInfo property = propertyInfos.Where(x => x.Name == options.ColumnName).FirstOrDefault();

                        if (options.Requierd && string.IsNullOrEmpty(value))
                        {
                            return responseContent.Error($"第{m}行[{options.ColumnCNName}]验证未通过,不能为空。");
                        }

                        //验证字典数据
                        if (!string.IsNullOrEmpty(options.DropNo))
                        {
                            string key = options.KeyValues.Where(x => x.Value == value)
                                  .Select(s => s.Key)
                                  .FirstOrDefault();
                            if (key == null)//&& options.Requierd
                            {
                                //小于20个字典项，直接提示所有可选value
                                string values = options.KeyValues.Count < 20 ? (string.Join(',', options.KeyValues.Select(s => s.Value))) : "";
                                return responseContent.Error($"第{m}行[{options.ColumnCNName}]验证未通过,必须是字典数据中[{values}]的值。");
                            }
                            //将值设置为数据字典的Key,如果导入为是/否字典项，存在表中应该对为1/0
                            value = key;
                        }

                        //验证导入与实体数据类型是否相同
                        (bool, string, object) result = property.ValidationProperty(value, options.Requierd);

                        if (!result.Item1)
                        {
                            return responseContent.Error($"第{m}行[{options.ColumnCNName}]验证未通过,{result.Item2}");
                        }

                        property.SetValue(entity, value.ChangeType(property.PropertyType));
                    }
                    entity.SetCreateDefaultVal();
                    entities.Add(entity);
                }
            }
            return responseContent.OK(null, entities);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="table"></param>
        /// <param name="columnCNName">key为字段名, ValueTuple<string, int>为字段中文名及列宽度</param>
        /// <param name="dicNos"> List<ValueTuple<string, string, string>>item1列名,item2 字典value,item3字典name </param>
        /// <returns>返回文件保存的路径</returns>
        public static string Export(DataTable table, List<CellOptions> cellOptions, string savePath, string fileName)
        {
            if (!Directory.Exists(savePath)) Directory.CreateDirectory(savePath);

            //获取所有有值的数据源
            var dicNoKeys = cellOptions
                 .Where(x => !string.IsNullOrEmpty(x.DropNo) && x.KeyValues != null && x.KeyValues.Keys.Count > 0)
                 .Select(x => new { x.DropNo, x.ColumnName }).Distinct().ToList();



            using (ExcelPackage package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("sheet1");
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    using (ExcelRange range = worksheet.Cells[1, i + 1])
                    {
                        worksheet.Cells[1, i + 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
                        worksheet.Cells[1, i + 1].Style.Fill.BackgroundColor.SetColor(Color.Gray);  //背景色
                        worksheet.Cells[1, i + 1].Style.Font.Color.SetColor(Color.White);
                    }
                    CellOptions options = cellOptions.Where(x => x.ColumnName == table.Columns[i].ColumnName).FirstOrDefault();
                    if (options != null)
                    {
                        worksheet.Column(i + 1).Width = options.ColumnWidth / 6.00;
                        worksheet.Cells[1, i + 1].Value = options.ColumnCNName;
                    }
                    else
                    {
                        worksheet.Column(i + 1).Width = 15;
                        worksheet.Cells[1, i + 1].Value = table.Columns[i].ColumnName;
                    }
                }

                for (int i = 0; i < table.Rows.Count; i++)
                {
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        string cellValue = (table.Rows[i][j] ?? "").ToString();
                        if (dicNoKeys.Exists(x => x.ColumnName == table.Columns[j].ColumnName))
                        {
                            cellOptions.Where(x => x.ColumnName == table.Columns[j].ColumnName)
                                .Select(s => s.KeyValues)
                                .FirstOrDefault()
                                .TryGetValue(cellValue, out string result);
                            cellValue = result ?? cellValue;
                        }
                        worksheet.Cells[i + 2, j + 1].Value = cellValue;
                    }
                }
                package.SaveAs(new FileInfo(savePath + fileName));
            }
            return savePath + fileName;
        }


        /// <summary>
        /// 下载导出模板
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cellOptions"></param>
        /// <param name="ignoreNames"></param>
        /// <param name="savePath"></param>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static string ExportTemplate<T>(List<string> ignoreNames, string savePath, string fileName)
        {
            return Export<T>(null, ignoreNames, savePath, fileName, true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <param name="cellOptions">对应代码生成器的配置</param>
        /// <param name="ignore">忽略不导出的字段</param>
        /// <param name="savePath"></param>
        /// <param name="fileName"></param>
        /// <param name="template"></param>
        /// <returns></returns>
        public static string Export<T>(List<T> list, Expression<Func<T, object>> ignore, string savePath, string fileName, bool template = false)
        {
            return Export(list, ignore?.GetExpressionProperty(), savePath, fileName, template);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        ///<param name="ignoreNames">忽略不导出的字段</param>
        /// <param name="columnCNName">导出的所有列名， ValueTuple<string, int>为列中文名字，及表格宽度</param>
        /// <param name="dicNos">为字典编号，字典name/value</param>
        /// <param name="savePath">保存路径</param>
        /// <param name="fileName">保存的文件名</param>
        ///  <param name="template">是否为下载模板</param>
        /// <returns></returns>
        public static string Export<T>(List<T> list, IEnumerable<string> ignoreNames, string savePath, string fileName, bool template = false)
        {
            if (!Directory.Exists(savePath)) Directory.CreateDirectory(savePath);

            //获取代码生成器对应的配置信息
            List<CellOptions> cellOptions = GetExportColumnInfo(typeof(T).GetEntityTableName(), template);

            string fullPath = savePath + fileName;
            //获取所有有值的数据源
            var dicNoKeys = cellOptions
                 .Where(x => !string.IsNullOrEmpty(x.DropNo) && x.KeyValues != null && x.KeyValues.Keys.Count > 0)
                 .Select(x => new { x.DropNo, x.ColumnName }).Distinct().ToList();

            //List<string> ignoreColumn = typeof(T).GetProperties().Where(x => !cellOptions.Select(s => s.ColumnName).Contains(x.Name)).Select(s => s.Name).ToList();

            List<PropertyInfo> propertyInfo = (
                ignoreNames == null
               ? typeof(T).GetProperties()
               .ToList()
               : typeof(T).GetProperties()
               .Where(x => !ignoreNames.Select(g => g.ToLower()).Contains(x.Name.ToLower())))
               .Where(x => cellOptions.Select(s => s.ColumnName) //获取代码生成器配置的列
               .Contains(x.Name)).ToList();


            string[] dateArr = null;
            if (!template)
            {
                dateArr = propertyInfo.Where(x => x.PropertyType == typeof(DateTime)
                || x.PropertyType == typeof(DateTime?))
                .Select(s => s.Name).ToArray();
            }

            using (ExcelPackage package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("sheet1");
                for (int i = 0; i < propertyInfo.Count; i++)
                {
                    string columnName = propertyInfo[i].Name;
                    using (ExcelRange range = worksheet.Cells[1, i + 1])
                    {
                        worksheet.Cells[1, i + 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
                        //默认灰色背景，白色字体
                        Color backgroundColor = Color.Gray;
                        //字体颜色
                        Color fontColor = Color.White;
                        //下载模板并且是必填项，将表格设置为黄色
                        if (template)
                        {
                            fontColor = Color.Black;
                            if (cellOptions.Exists(x => x.ColumnName == columnName && x.Requierd))
                            {
                                backgroundColor = Color.Yellow;  //黄色必填
                            }
                            else
                            {
                                backgroundColor = Color.White;
                            }
                        }
                        worksheet.Cells[1, i + 1].Style.Fill.BackgroundColor.SetColor(backgroundColor);  //背景色
                        worksheet.Cells[1, i + 1].Style.Font.Color.SetColor(fontColor);//字体颜色
                    }
                    CellOptions options = cellOptions.Where(x => x.ColumnName == columnName).FirstOrDefault();
                    if (options != null)
                    {
                        worksheet.Column(i + 1).Width = options.ColumnWidth / 6.00;
                        worksheet.Cells[1, i + 1].Value = options.ColumnCNName;
                    }
                    else
                    {
                        worksheet.Column(i + 1).Width = 15;
                        worksheet.Cells[1, i + 1].Value = columnName;
                    }
                }
                //下载模板直接返回
                if (template)
                {
                    package.SaveAs(new FileInfo(fullPath));
                    return fullPath;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    for (int j = 0; j < propertyInfo.Count; j++)
                    {
                        string cellValue = null;
                        if (dateArr != null && dateArr.Contains(propertyInfo[j].Name))
                        {
                            object value = propertyInfo[j].GetValue(list[i]);
                            cellValue = value == null ? "" : ((DateTime)value).ToString("yyyy-MM-dd HH:mm:sss").Replace(" 00:00:00", "");
                        }
                        else
                        {
                            cellValue = (propertyInfo[j].GetValue(list[i]) ?? "").ToString();
                        }
                        if (dicNoKeys.Exists(x => x.ColumnName == propertyInfo[j].Name))
                        {
                            cellOptions.Where(x => x.ColumnName == propertyInfo[j].Name)
                              .Select(s => s.KeyValues)
                              .FirstOrDefault()
                              .TryGetValue(cellValue, out string result);
                            cellValue = result ?? cellValue;
                        }
                        worksheet.Cells[i + 2, j + 1].Value = cellValue;
                    }
                }

                package.SaveAs(new FileInfo(fullPath));
            }
            return fullPath;
        }


        /// <summary>
        /// 获取导出的列的数据信息
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="temlate">是否为下载模板</param>
        /// filterKeyValue是否过滤Key相同的数据
        /// <returns></returns>
        private static List<CellOptions> GetExportColumnInfo(string tableName, bool temlate = false, bool filterKeyValue = true)
        {
            //&& x.IsDisplay == 1&&x.IsReadDataset==0只导出代码生器中设置为显示并且不是只读的列，可根据具体业务设置导出列
            List<CellOptions> cellOptions = DBServerProvider.DbContext.Set<Sys_TableColumn>()
              .Where(x => x.TableName == tableName && x.IsDisplay == 1 && x.IsReadDataset == 0).Select(c => new CellOptions()
              {
                  ColumnName = c.ColumnName,
                  ColumnCNName = c.ColumnCnName,
                  DropNo = c.DropNo,
                  Requierd = c.IsNull > 0 ? false : true,
                  ColumnWidth = c.ColumnWidth ?? 90
              }).ToList();

            if (temlate) return cellOptions;

            var dicNos = cellOptions.Where(x => !string.IsNullOrEmpty(x.DropNo)).Select(c => c.DropNo);

            if (dicNos.Count() == 0) return cellOptions;

            List<Sys_Dictionary> dictionaries = DictionaryManager.GetDictionaries(dicNos);
            //获取绑定字典数据源下拉框的值
            foreach (string dicNo in dicNos.Distinct())
            {
                Dictionary<string, string> keyValues = null;
                var query = dictionaries
                   .Where(x => x.DicNo == dicNo && x.Sys_DictionaryList != null)
                   .Select(s => s.Sys_DictionaryList);
                //   .FirstOrDefault()
                //.Where(w => (filterKeyValue && w.DicName != w.DicValue)|| !filterKeyValue) //key==value相同的则不处理
                //   .ToDictionary(r => r.DicValue, r => r.DicName);
                if (filterKeyValue)
                {
                    keyValues = query.FirstOrDefault()?
                     .Where(w => w.DicName != w.DicValue)? //key==value相同的则不处理
                      .ToDictionary(r => r.DicValue, r => r.DicName);
                }
                else
                {
                    keyValues = query.FirstOrDefault()?.ToDictionary(r => r.DicValue, r => r.DicName);
                }

                foreach (CellOptions options in cellOptions.Where(x => x.DropNo == dicNo))
                {
                    options.KeyValues = keyValues;
                }
            }
            return cellOptions;
        }
    }

    public class CellOptions
    {
        public string ColumnName { get; set; }//导出表的列
        public string ColumnCNName { get; set; }//导出列的中文名
        public string DropNo { get; set; }//字典编号
        public int ColumnWidth { get; set; }//导出列的宽度,代码生成维护的宽度
        public bool Requierd { get; set; } //是否必填
        public int Index { get; set; }//列所在模板的序号(导入用)
                                      //对应字典项维护的Key,Value
        public Dictionary<string, string> KeyValues { get; set; }
        //public string Value { get; set; } //对应字典项维护的Value
        //public string Name { get; set; } //对应字典项显示的名称
    }
}
