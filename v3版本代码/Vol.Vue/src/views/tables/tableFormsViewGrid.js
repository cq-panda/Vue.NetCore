var viewGridOptions = {  //此处的权限是使用的当前页面的权限，而不是App_Transaction表的权限
            table: {
                key: 'Id',
                footer: "Foots",
                cnName: 'table基础配置',
                name: 'App_Transaction',
                url: "/App_Transaction/",
                sortName: "Id"
            },
            extend: { 
                text:"此组件配置与代码生成器生成的配置相同,自带基础操作,可任意扩展",
                buttons: { //扩展按钮
                   view: [//ViewGrid查询界面按钮
                   {
                     name: "扩展按钮!",
                     icon: 'md-create',
                     value: 'Edit',
                     class: '',
                     type: 'error',
                     index: 1,//显示的位置
                     onClick: function () { //扩展按钮执行事件
                       this.$Message.error("扩展按钮")
                    }
                  }]
                },
                methods: {//事件扩展
                    onInit(){
                        this.tableMaxHeight=500;
                    },
                    searchAfter(result) { //查询ViewGird表数据后param查询参数,result回返查询的结果
                     console.log({ title: this.table.cnName + ',查询结果', desc: '返回的对象：' + JSON.stringify(result) });
                        return true;
                    }
                }
            },
            editFormFileds: {"Name":"","TransactionType":"","CowType":"",PhoneNo:"",Describe:""},
            editFormOptions: [[{"title":"姓名","required":true,"field":"Name"}],
                          [{"dataKey":"cq","title":"是否买入","field":"TransactionType","type":"select"}],
                          [{"dataKey":"nav","title":"购买类型","field":"CowType","type":"select"}],
                          [{"type":"phone","title":"电话","field":"PhoneNo","required":true}],
                          [{"type":"textarea","title":"描述","field":"Describe","required":true}]],
            searchFormFileds: {"CowType":"","Creator":"","CreateDate":""},
            searchFormOptions: [[{"dataKey":"nav","title":"购买类型","field":"CowType","type":"dropList"},{"title":"提交人","field":"Creator"},{"title":"提交时间","field":"CreateDate","type":"datetime"}]],
            columns: [{field:'Id',title:'主键ID',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                   {field:'Name',title:'姓名',type:'string',width:120,require:true,align:'left',sortable:true},
                   {field:'PhoneNo',title:'电话',type:'string',link:true,width:150,require:true,align:'left'},
                   {field:'Quantity',title:'数量',type:'int',width:90,require:true,align:'left'},
                   {field:'TransactionType',title:'是否买入',type:'int',bind:{ key:'cq',data:[]},width:120,align:'left'},
                   {field:'CowType',title:'购买类型',type:'string',bind:{ key:'nav',data:[]},width:90,align:'left'},
                   {field:'Describe',title:'描述',type:'string',width:190,require:true,align:'left'},
                   {field:'Enable',title:'是否启用',type:'byte',width:90,hidden:true,align:'left'},
                   {field:'CreateID',title:'创建人Id',type:'int',width:90,hidden:true,align:'left'},
                   {field:'Creator',title:'提交人',type:'string',width:130,align:'left'},
                   {field:'CreateDate',title:'提交时间',type:'datetime',width:150,align:'left',sortable:true},
                   {field:'Modifier',title:'修改人',type:'string',width:130,hidden:true,align:'left'},
                   {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,hidden:true,align:'left',sortable:true}],
            detail: {
                cnName:"",
                columns: [],
                sortName: "",
                key:""
            }
};
export default viewGridOptions;