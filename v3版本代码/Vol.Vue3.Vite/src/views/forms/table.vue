<template>
  <div class="container">
    
   <div style=" padding-right:20px;">
     <h2 style="font-weight:500;font-weight: 500;
    padding: 10px 20px;">表单数据</h2>
         <VolForm
      ref="myform"
      :loadKey="true"
      :formFields="formFields"
      :formRules="formOptions"
    ></VolForm>
   </div>
    <!-- 查询配置 -->
       <Alert type="success" style="    margin: 0 20px;" show-icon>
      table从api加载数据
      <div slot="desc">
       <p> 根据组件api文档中voltable配置table显示与数据加载，更多功能参数配置见组件api->voltable</p>
       <p>如果需要更详情的table编辑信息及其他操作见：组件api->VolTable组件</p>
      </div>
    </Alert>
    <div style="padding: 0px 20px">
      <VolHeader
        icon="md-apps"
        text="从api加载数据"
        style="margin-bottom: 10px; border: 0px; margin-top: 15px"
      >
        <div slot="content"></div>
        <slot>
          <div style="text-align: right">
            <Input
              style="width: 200px; margin-right: 10px"
              v-model.number="searchFields.UserName"
              placeholder="申请人"
            />
            <DatePicker
              style="width: 200px"
              type="datetime"
              placeholder="申请时间"
              v-model="searchFields.CreateDate1"
            ></DatePicker>
            -
            <DatePicker
              style="width: 200px"
              type="datetime"
              placeholder="申请时间"
              v-model="searchFields.CreateDate2"
            ></DatePicker>
            <Button type="info" ghost @click="load" style="margin-left: 20px"
              >查询</Button
            >
            <Button type="info" ghost @click="del">删除行</Button>
            <Button type="info" ghost @click="getRows">获取选中的行</Button>
          </div>
        </slot>
      </VolHeader>

      <!-- table数据 -->
      <!-- :max-height="450" -->
      <vol-table
        ref="table"
        :loadKey="true"
        :columns="columns"
        :pagination-hide="false"
        :height="200"
        :url="url"
        :index="true"
        @loadBefore="loadTableBefore"
        @loadAfter="loadTableAfter"
      ></vol-table>
    </div>
  </div>
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: { VolTable, VolHeader, VolForm },
  created() {},
  data() {
    return {
      //查询条件字段
      searchFields: {
        CreateDate1: "",
        CreateDate2: "",
        UserName: "",
      },
      viewModel: false, //点击单元格时弹出框
      url: "api/App_Expert/getPageData", //后从加载数据的url
      formFields: { price: null, age: null, variety: null,city:['北京','天坛'] },
      formOptions: [
        [
          {
            type: "decimal",
            title: "价格",
            required: true,
            placeholder: "你可以自己定义placeholder显示的文字", //显示自定义的信息
            field: "price",
          },
          {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            //data是须的参数，可以默认一个[]
            title: "年龄",
            required: false, //设置为必选项
            field: "age",
            placeholder: "可触发事件的下拉框",
            type: "select",
            onChange(value, param) {
              //设置选择数据时触发的事件
              this.$message("当前选中的值为[" + value + "]");
            },
          },
          {
            title: "分类",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [
              { key: "1", value: "1" },
              { key: "2", value: "2" },
            ],
            required: true,
            field: "Variety",
            dataKey: "pz",
            data: [],
            type: "select",
          },

          {
            dataKey: "city",
            title: "级联",
            required: true,
            field: "city",
            data: [
              {
                value: "北京",
                label: "北京",
                children: [
                  { value: "天坛", label: "天坛" },
                  { value: "王府井", label: "王府井" },
                ],
              },
            ],
            type: "cascader",
          },
        ],
      ],
      columns: [
        //表配置
        {
          field: "ExpertId", //数据库表字段,必须和数据库一样，并且大小写一样
          title: "主键ID", //表头显示的名称
          type: "int", //数据类型
          isKey: true, //是否为主键字段
          hidden: true, //是否显示
          align: "left", //文字显示位置
        },
        {
          field: "HeadImageUrl",
          title: "头像",
          type: "img",
          width: 160,
        },
        {
          field: "UserName",
          title: "申请人帐号",
          width: 120,
          sort: true,
        },
        {
          field: "UserTrueName",
          title: "申请人",
          sort: true,
          width: 120,
        },
        {
          field: "Enable",
          title: "是否启用",
          sort: true,
          bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
          width: 80,
        },
        {
          field: "ReallyName",
          title: "真实姓名",
          sort: true,
          width: 120,
          click: (row, column) => {
            //单元格点击事亻
            let msg =
              "此处可以自己自定格式显示内容,此单元格原始值是:【" +
              row.ReallyName +
              "】";
            this.$message.error(msg);
          },
          formatter: () => {
            //对单元格的数据格式化处理
            return "<a>点我</a>";
          },
        },
        {
          field: "CreateDate",
          title: "申请时间",
          sort: true,
          width: 150,
        },
      ],
    };
  },
  methods: {
    //点击查询时生成查询条件
    loadTableBefore(param, callBack) {
      //此处是从后台加数据前的处理，自己在此处自定义查询条件,查询数据格式自己定义或参考代码生成器查询页面请求的数据格式
      console.log("加载数据前" + param);
      //生成查询条件
      param.wheres = [
        //设置为like模糊查询
        {
          name: "UserName",
          value: this.searchFields.UserName,
          displayType: "like",
        },
        //设置日期查询>=、<=
        {
          name: "CreateDate",
          value: this.searchFields.CreateDate1,
          displayType: "thanorequal",
        },
        {
          name: "CreateDate",
          value: this.searchFields.CreateDate2,
          displayType: "lessorequal",
        },
      ];
      callBack(true); //此处必须进行回调，返回处理结果，如果是false，则不会执行后台查询
    },
    loadTableAfter(data, callBack) {
      //此处是从后台加数据后，你可以在渲染表格前，预先处理返回的数据
      console.log("加载数据后" + data);
      callBack(true); //同上
    },
    load() {
      //此处可以自定义查询条件,如果不调用的框架的查询，格式需要自己定义，
      //如果查询的是框架getPageData方法,需要指定格式,如:
      // let where={wheres:[{"name":"UserTrueName","value":"教兽",displayType:"text"}]};
      let where = {};
      this.$refs.table.load(where);
    },
    del() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行");
      }
      this.$refs.table.delRow();
      //此处可以接着写删除后台的代码
    },
    getRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行1");
      }
      let text = "当前选中的行数据：" + JSON.stringify(rows);

      this.$Message.info(text);
    },
  },
};
</script>