using VOL.Core.BaseProvider;
using VOL.Entity.DomainModels;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Utilities;

namespace VOL.Builder.IServices
{
    public partial interface ISys_TableInfoService
    {
        Task<(string, string)> GetTableTree();

        string CreateEntityModel(Sys_TableInfo tableInfo);

        WebResponseContent SaveEidt(Sys_TableInfo sysTableInfo);

        string CreateServices(string tableName, string nameSpace, string foldername, bool webController, bool apiController);


        string CreateVuePage(Sys_TableInfo sysTableInfo, string vuePath);

        object LoadTable(int parentId, string tableName, string columnCNName, string nameSpace, string foldername, int table_Id, bool isTreeLoad);
        Task<WebResponseContent> SyncTable(string tableName);
        Task<WebResponseContent> DelTree(int table_Id);
    }
}
