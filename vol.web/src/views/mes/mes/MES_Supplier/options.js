// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'SupplierID',
        footer: "Foots",
        cnName: '供应商',
        name: 'MES_Supplier',
        newTabEdit: false,
        url: "/MES_Supplier/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"SupplierName":"","ContactPerson":"","ContactPhone":"","Email":"","Address":"","Remarks":""};
    const editFormOptions = [[{"title":"供应商名","required":true,"field":"SupplierName"}],
                              [{"title":"联系人","field":"ContactPerson"}],
                              [{"title":"联系电话","field":"ContactPhone"}],
                              [{"title":"邮箱地址","field":"Email"}],
                              [{"title":"联系地址","field":"Address"}],
                              [{"title":"备注信息","field":"Remarks","type":"textarea"}]];
    const searchFormFields = {"SupplierName":"","ContactPerson":"","ContactPhone":"","Email":"","Address":""};
    const searchFormOptions = [[{"title":"供应商名","field":"SupplierName","type":"like"},{"title":"联系人","field":"ContactPerson","type":"like"},{"title":"联系电话","field":"ContactPhone"},{"title":"邮箱地址","field":"Email"},{"title":"联系地址","field":"Address"}]];
    const columns = [{field:'SupplierID',title:'供应商ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'SupplierName',title:'供应商名',type:'string',link:true,width:120,require:true,align:'left'},
                       {field:'ContactPerson',title:'联系人',type:'string',width:90,align:'left'},
                       {field:'ContactPhone',title:'联系电话',type:'string',width:90,align:'left'},
                       {field:'Email',title:'邮箱地址',type:'string',width:90,align:'left'},
                       {field:'Address',title:'联系地址',type:'string',width:90,align:'left'},
                       {field:'SupplierType',title:'供应商类型',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ProductRange',title:'供应范围',type:'string',width:90,hidden:true,align:'left'},
                       {field:'QualityRating',title:'质量评级',type:'string',width:90,hidden:true,align:'left'},
                       {field:'Remarks',title:'备注信息',type:'string',width:140,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:140,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:140,hidden:true,align:'left'}];
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