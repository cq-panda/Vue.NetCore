// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'ProductionLineID',
        footer: "Foots",
        cnName: '产线管理',
        name: 'MES_ProductionLine',
        newTabEdit: false,
        url: "/MES_ProductionLine/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"LineName":"","LineType":"","ResponsiblePerson":"","Location":"","StartDate":"","EndDate":"","Remarks":""};
    const editFormOptions = [[{"title":"产线名称","required":true,"field":"LineName"},
                               {"title":"产线类型","field":"LineType"},
                               {"title":"负责人","field":"ResponsiblePerson"}],
                              [{"title":"产线位置","field":"Location"},
                               {"title":"启用日期","field":"StartDate","type":"date"},
                               {"title":"停用日期","field":"EndDate","type":"date"}],
                              [{"title":"备注信息","field":"Remarks","colSize":12,"type":"textarea"}]];
    const searchFormFields = {"LineName":"","LineType":"","Capacity":"","Status":"","ResponsiblePerson":""};
    const searchFormOptions = [[{"title":"产线名称","field":"LineName","type":"like"},{"title":"产线类型","field":"LineType"},{"title":"产能信息","field":"Capacity"},{"title":"产线状态","field":"Status"},{"title":"负责人","field":"ResponsiblePerson"}]];
    const columns = [{field:'ProductionLineID',title:'产线ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'LineName',title:'产线名称',type:'string',link:true,width:90,require:true,align:'left'},
                       {field:'LineType',title:'产线类型',type:'string',width:90,align:'left'},
                       {field:'Capacity',title:'产能信息',type:'string',width:90,hidden:true,align:'left'},
                       {field:'Status',title:'产线状态',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ResponsiblePerson',title:'负责人',type:'string',width:90,align:'left'},
                       {field:'Location',title:'产线位置',type:'string',width:90,align:'left'},
                       {field:'StartDate',title:'启用日期',type:'date',width:90,align:'left'},
                       {field:'EndDate',title:'停用日期',type:'date',width:90,align:'left'},
                       {field:'Remarks',title:'备注信息',type:'string',width:90,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,align:'left'}];
    const detail =  {
                    cnName: '产线设备',
                    table: 'MES_ProductionLineDevice',
                    columns: [{field:'DeviceID',title:'设备ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ProductionLineID',title:'产线ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'DeviceName',title:'设备名称',type:'string',width:90,edit:{type:''},require:true,align:'left'},
                       {field:'DeviceModel',title:'设备型号',type:'string',width:90,edit:{type:''},align:'left'},
                       {field:'Manufacturer',title:'制造商',type:'string',width:90,edit:{type:''},align:'left'},
                       {field:'PurchaseDate',title:'购买日期',type:'date',width:90,edit:{type:'date'},align:'left'},
                       {field:'WarrantyDate',title:'保修日期',type:'date',width:90,edit:{type:'date'},align:'left'},
                       {field:'Status',title:'设备状态',type:'string',width:90,edit:{type:''},align:'left'},
                       {field:'LocationOnLine',title:'线上位置',type:'string',width:90,hidden:true,edit:{type:''},align:'left'},
                       {field:'Remarks',title:'备注信息',type:'string',width:90,edit:{type:''},align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:120,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,align:'left'}],
                    sortName: 'CreateDate',
                    key: 'DeviceID'
                                            };
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