// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'CustomerID',
        footer: "Foots",
        cnName: '客户管理',
        name: 'MES_Customer',
        newTabEdit: false,
        url: "/MES_Customer/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"CustomerName":"","ContactPerson":"","ContactPhone":"","Email":"","Address":"","CustomerType":"","BusinessScope":"","Remarks":""};
    const editFormOptions = [[{"title":"客户名称","required":true,"field":"CustomerName"}],
                              [{"title":"联系人","field":"ContactPerson"}],
                              [{"title":"联系电话","field":"ContactPhone"}],
                              [{"title":"邮箱地址","field":"Email"}],
                              [{"title":"联系地址","field":"Address"}],
                              [{"title":"客户类型","field":"CustomerType"}],
                              [{"title":"业务范围","field":"BusinessScope"}],
                              [{"title":"备注信息","field":"Remarks","type":"textarea"}]];
    const searchFormFields = {"CustomerName":"","ContactPerson":"","ContactPhone":"","Email":"","Address":""};
    const searchFormOptions = [[{"title":"客户名称","field":"CustomerName","type":"like"},{"title":"联系人","field":"ContactPerson","type":"like"},{"title":"联系电话","field":"ContactPhone"},{"title":"邮箱地址","field":"Email"},{"title":"联系地址","field":"Address"}]];
    const columns = [{field:'CustomerID',title:'客户ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'CustomerName',title:'客户名称',type:'string',link:true,width:120,require:true,align:'left'},
                       {field:'ContactPerson',title:'联系人',type:'string',width:90,align:'left'},
                       {field:'ContactPhone',title:'联系电话',type:'string',width:90,align:'left'},
                       {field:'Email',title:'邮箱地址',type:'string',width:90,align:'left'},
                       {field:'Address',title:'联系地址',type:'string',width:90,align:'left'},
                       {field:'CustomerType',title:'客户类型',type:'string',width:90,align:'left'},
                       {field:'CreditRating',title:'信用评级',type:'string',width:90,hidden:true,align:'left'},
                       {field:'BusinessScope',title:'业务范围',type:'string',width:90,align:'left'},
                       {field:'Remarks',title:'备注信息',type:'string',width:90,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:130,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,align:'left'}];
    const detail ={columns:[]};
    const details = [];

    return {
        table,
        key,
        tableName,
        tableCNName,
        newTabEdit,
        editFormFields,
        editFormOptions,
        searchFormFields,
        searchFormOptions,
        columns,
        detail,
        details
    };
}