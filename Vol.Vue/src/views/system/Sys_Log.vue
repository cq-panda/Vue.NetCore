<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/Sys_Log.js此处编写
 -->
<template>
    <div>
        <view-grid :columns="columns"
                   :detail="detail"
                   :editFormFileds="editFormFileds"
                   :editFormOptions="editFormOptions"
                   :searchFormFileds="searchFormFileds"
                   :searchFormOptions="searchFormOptions"
                   :table="table"
                   :extend="extend">
        </view-grid>
    </div>
</template>

<script>
    import extend from "@/extension/system/Sys_Log.js";
    import ViewGrid from "@/components/basic/ViewGrid.vue";
    var vueParam = {
        components: {
            ViewGrid
        },
        data() {
            return {
                table: {
                    key: 'Id',
                    footer: "Foots",
                    cnName: '系统日志',
                    name: 'Sys_Log',
                    url: "/Sys_Log/",
                    sortName: "Id"
                },
                extend: extend,
                editFormFileds: {},
                editFormOptions: [],
                searchFormFileds: {"BeginDate":"","Url":"","LogType":[],"Success":"","UserIP":"","ServiceIP":"","Role_Id":""},
                searchFormOptions: [[{"title":"请求地址","field":"Url","type":"text"},{"title":"用户IP","field":"UserIP","type":"text"},{"title":"服务器IP","field":"ServiceIP","type":"text"}],[{"title":"开始时间","field":"BeginDate","type":"datetime"},{"dataKey":"restatus","title":"响应状态","field":"Success","type":"dropList"},{"dataKey":"roles","title":"角色ID","field":"Role_Id","type":"select"}],[{"dataKey":"log","title":"日志类型","field":"LogType","colSize":12,"type":"checkbox"}]],
                columns: [{field:'Id',title:'Id',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'BeginDate',title:'开始时间',type:'datetime',width:150,align:'left',sortable:true},
                       {field:'Url',title:'请求地址',type:'string',width:300,align:'left'},
                       {field:'LogType',title:'日志类型',type:'string',bind:{ key:'log',data:[]},width:120,align:'left'},
                       {field:'Success',title:'响应状态',type:'int',bind:{ key:'restatus',data:[]},width:90,align:'left'},
                       {field:'ElapsedTime',title:'时长(毫秒)',type:'int',width:90,align:'left'},
                       {field:'RequestParameter',title:'请求参数',type:'string',width:150,align:'left'},
                       {field:'ResponseParameter',title:'响应参数',type:'string',width:100,align:'left'},
                       {field:'ExceptionInfo',title:'异常信息',type:'string',width:280,align:'left'},
                       {field:'UserIP',title:'用户IP',type:'string',width:90,align:'left'},
                       {field:'ServiceIP',title:'服务器IP',type:'string',width:90,align:'left'},
                       {field:'BrowserType',title:'浏览器类型',type:'string',width:90,align:'left'},
                       {field:'User_Id',title:'用户ID',type:'int',width:90,align:'left'},
                       {field:'UserName',title:'用户名称',type:'string',width:90,align:'left'},
                       {field:'Role_Id',title:'角色ID',type:'int',bind:{ key:'roles',data:[]},width:90,align:'left'},
                       {field:'EndDate',title:'结束时间',type:'datetime',width:150,align:'left',sortable:true}],
                detail: {
                    cnName:"#detailCnName",
                    columns: [],
                    sortName: "",
                    key:""
                }
            };
        }
    };
    export default vueParam;
</script>
