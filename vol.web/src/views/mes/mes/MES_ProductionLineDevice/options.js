// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'DeviceID',
        footer: "Foots",
        cnName: '产线设备',
        name: 'MES_ProductionLineDevice',
        newTabEdit: false,
        url: "/MES_ProductionLineDevice/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"DeviceName":"","DeviceModel":"","Manufacturer":"","PurchaseDate":"","WarrantyDate":"","Status":"","LocationOnLine":"","Remarks":""};
    const editFormOptions = [[{"title":"设备名称","required":true,"field":"DeviceName"},
                               {"title":"设备型号","field":"DeviceModel"},
                               {"title":"制造商","field":"Manufacturer"},
                               {"title":"购买日期","field":"PurchaseDate","type":"date"},
                               {"title":"保修日期","field":"WarrantyDate","type":"date"},
                               {"title":"设备状态","field":"Status"},
                               {"title":"线上位置","field":"LocationOnLine"},
                               {"title":"备注信息","field":"Remarks"}]];
    const searchFormFields = {};
    const searchFormOptions = [];
    const columns = [{field:'DeviceID',title:'设备ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ProductionLineID',title:'产线ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'DeviceName',title:'设备名称',type:'string',width:90,require:true,align:'left'},
                       {field:'DeviceModel',title:'设备型号',type:'string',width:90,align:'left'},
                       {field:'Manufacturer',title:'制造商',type:'string',width:90,align:'left'},
                       {field:'PurchaseDate',title:'购买日期',type:'date',width:90,align:'left'},
                       {field:'WarrantyDate',title:'保修日期',type:'date',width:90,align:'left'},
                       {field:'Status',title:'设备状态',type:'string',width:90,align:'left'},
                       {field:'LocationOnLine',title:'线上位置',type:'string',width:90,hidden:true,align:'left'},
                       {field:'Remarks',title:'备注信息',type:'string',width:90,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:120,align:'left'},
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