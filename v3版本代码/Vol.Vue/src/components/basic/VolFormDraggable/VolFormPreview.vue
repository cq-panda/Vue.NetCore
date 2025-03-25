<template>
  <div style="padding: 15px 20px 15px 5px">
    <div class="pre-text">{{ text }}</div>
    <vol-form ref="form"
              :labelWidth="80"
              :load-key="false"
              :formFields="options.fields"
              :formRules="options.formOptions">
    </vol-form>
    <div class="tables">
      <div class="table-item"
           v-for="(item, index) in options.tables"
           :key="index">
        <div class="table-header">
          <div class="header-text">
            {{ item.name }}
          </div>
          <div class="header-btns">
            <el-button type="primary"
                       size="mini"
                       :key="bindex"
                       plain
                       @click="tableBtnClick(item, bindex, index)"
                       :icon="btnItem.icon"
                       v-for="(btnItem, bindex) in item.buttons">
              {{ btnItem.name }}
            </el-button>
          </div>
        </div>
        <vol-table :url="item.url"
                   :load-key="false"
                   :index="true"
                   :ref="'table' + index"
                   :tableData="item.tableData"
                   :columns="item.columns"
                   :max-height="250"
                   :pagination-hide="item.pagination"
                   :column-index="true"
                   :ck="true"></vol-table>
      </div>
    </div>

    <div class="tables"
         style="padding-bottom: 10px">
      <el-tabs v-model="tabsModel"
               v-show="options.tabs.length"
               @tab-click="() => {}">
        <el-tab-pane style="padding: 0"
                     class="table-item"
                     v-for="(item, index) in options.tabs"
                     :label="item.name"
                     :name="index"
                     :key="index">
          <div class="table-header">
            <div class="header-text">
              {{ item.name }}
            </div>
            <div class="header-btns">
              <el-button type="primary"
                         size="mini"
                         :key="bindex"
                         :icon="btnItem.icon"
                         plain
                         @click="tabsTableBtnClick(item, bindex, index)"
                         v-for="(btnItem, bindex) in item.buttons">
                {{ btnItem.name }}
              </el-button>
            </div>
          </div>
          <vol-table :url="item.url"
                     :load-key="false"
                     :index="true"
                     :ref="'tabsTable' + index"
                     :tableData="item.tableData"
                     :columns="item.columns"
                     :max-height="250"
                     :pagination-hide="item.pagination"
                     :column-index="true"
                     :ck="true"></vol-table>
        </el-tab-pane>
      </el-tabs>
    </div>

    <div class="form-btns">
      <el-button type="primary"
                 @click="submit"
                 icon="el-icon-check"
                 size="mini">提交</el-button>
      <el-button type="primary"
                 @click="reset"
                 plain
                 icon="el-icon-refresh-right"
                 size="mini">重置</el-button>
      <el-button type="primary"
                 @click="download"
                 plain
                 icon="el-icon-refresh-right"
                 size="mini">下载代码</el-button>
    </div>
  </div>
</template>

<script>
import VolTable from "./../VolTable";
import VolBox from "./../VolBox";
import VolForm from "./../VolForm";
import downloadForm from './DownloadForm'
// import templateCode from './templateCode'
export default {
  props: {
    options: {
      type: Object,
      default: () => {
        return { fields: {}, formOptions: [], tables: [], tabs: [] };
      },
    },
  },
  data () {
    return {
      text: "",
      tabsModel: 0,
    };
  },
  created () { },
  methods: {
    tableBtnClick (item, btnIndex, index) {
      if (item.buttons[btnIndex].value == "add") {
        this.$refs["table" + index][0].addRow({});
        return;
      }
      if (item.buttons[btnIndex].value == "del") {
        this.$refs["table" + index][0].delRow();
        return;
      }
    },
    tabsTableBtnClick (item, btnIndex, index) {
      if (item.buttons[btnIndex].value == "add") {
        this.$refs["tabsTable" + index][0].addRow({});
        return;
      }
      if (item.buttons[btnIndex].value == "del") {
        this.$refs["tabsTable" + index][0].delRow();
        return;
      }
    },
    submit () {

    },
    reset () {
      this.$refs.form.reset();
      this.$Message.success("表单已重置")
    },
    download () {
      downloadForm.call(this);
      //       let code = templateCode;
      //       let _formOptions = this.options.formOptions.map(m => {
      //         let _op = m.map((m1, i) => {
      //           let _obj;
      //           //.data[0].hasOwnProperty("key")
      //           if (m1.data && m1.data.length && !m1.dataKey) {
      //             let m2 = JSON.parse(JSON.stringify(m1));
      //             m2.data = m2.data.map(c => {
      //               return { key: c.label || c.key, value: c.label }
      //             })
      //             _obj = JSON.stringify(m2)
      //           } else {
      //             _obj = JSON.stringify(m1)
      //           }
      //           return (i === 0 ? '' : '\n\t\t\t\t') + _obj
      //         }).join(',');
      //         //return JSON.stringify(m, null, '')
      //         return _op;
      //       })
      //       code = code.replace('{#fields}', JSON.stringify(this.options.fields))
      //         .replace('{#formOptions}', '[' + _formOptions.join('],\n\t\t\t\t[') + ']');
      //       code = code.replace('}],', '\t\t\t\t\t}],')
      //         .replace("[{#tableOptions}]", JSON.stringify(this.options.tables, null, '\t'))
      //         .replace("[{#tabsOptions}]", JSON.stringify(this.options.tabs, null, '\t'))
      //       // fields: {#fields}, 
      //       //     formOptions: [{#formOptions}],
      //       //     tables: [{#tables}],
      //       //     tabs: [{#tabs}] 
      //       var tabsText = this.options.tabs.length ? ` <div class="tables"
      //        style="padding-bottom: 10px">
      //     <el-tabs v-model="tabsModel"
      //              @tab-click="() => {}">
      //       <el-tab-pane style="padding: 0"
      //                    class="table-item"
      //                    v-for="(item, index) in tabs"
      //                    :label="item.name"
      //                    :name="index+''"
      //                    :key="index">
      //         <div class="table-header">
      //           <div class="header-text">
      //             {{ item.name }}
      //           </div>
      //           <div class="header-btns">
      //             <el-button type="primary"
      //                        size="mini"
      //                        :key="bindex"
      //                        :icon="btnItem.icon"
      //                        plain
      //                        @click="tabsTableBtnClick(item, bindex, index)"
      //                        v-for="(btnItem, bindex) in item.buttons">
      //               {{ btnItem.name }}
      //             </el-button>
      //           </div>
      //         </div>
      //         <vol-table :url="item.url"
      //                    :load-key="false"
      //                    :index="true"
      //                    :ref="'tabsTable' + index"
      //                    :tableData="item.tableData"
      //                    :columns="item.columns"
      //                    :max-height="250"
      //                    :pagination-hide="item.pagination"
      //                    :column-index="true"
      //                    :ck="true"></vol-table>
      //       </el-tab-pane>
      //     </el-tabs>
      //   </div>`: ''
      //       code = code.replace('{#tabs}', tabsText);
      //       if (this.options.tables.length || this.options.tabs.length) {
      //         code = code.replace("{import_VolTable}", "import VolTable from '@/components/basic/VolTable'")
      //         code = code.replace(",{component_table}", ",'vol-table': VolTable")
      //       } else {
      //         code = code.replace("{import_VolTable}", '')
      //         code = code.replace("{component_table}", '')
      //       }

      //       if (this.options.tables.length) {

      //         code = code.replace('{table_ms}', `
      //         tableBtnClick (item, btnIndex, index) {
      //             if (item.buttons[btnIndex].value == "add") {
      //                 this.$refs["table" + index][0].addRow({});
      //                 return;
      //             }
      //             if (item.buttons[btnIndex].value == "del") {
      //                 this.$refs["table" + index][0].delRow();
      //                 return;
      //             }
      //         },
      //         tabsTableBtnClick (item, btnIndex, index) {
      //             if (item.buttons[btnIndex].value == "add") {
      //                 this.$refs["tabsTable" + index][0].addRow({});
      //                 return;
      //             }
      //             if (item.buttons[btnIndex].value == "del") {
      //                 this.$refs["tabsTable" + index][0].delRow();
      //                 return;
      //             }
      //         },`)
      //         code = code.replace('{#tables}',
      //           `
      //         <!--table配置 -->
      //         <div class="tables">
      //             <div class="table-item"
      //                 v-for="(item, index) in tables"
      //                 :key="index">
      //             <div class="table-header">
      //                 <div class="header-text">
      //                 {{ item.name }}
      //                 </div>
      //                 <div class="header-btns">
      //                 <el-button type="primary"
      //                             size="mini"
      //                             :key="bindex"
      //                             plain
      //                             @click="tableBtnClick(item, bindex, index)"
      //                             :icon="btnItem.icon"
      //                             v-for="(btnItem, bindex) in item.buttons">
      //                     {{ btnItem.name }}
      //                 </el-button>
      //                 </div>
      //             </div>
      //             <vol-table :url="item.url"
      //                         :load-key="false"
      //                         :index="true"
      //                         :ref="'table' + index"
      //                         :tableData="item.tableData"
      //                         :columns="item.columns"
      //                         :max-height="250"
      //                         :pagination-hide="item.pagination"
      //                         :column-index="true"
      //                         :ck="true"></vol-table>
      //             </div>
      //         </div>`);

      //       } else {

      //         code = code.replace('{table_ms}', '')
      //         code = code.replace('{#tables}', '');
      //       }
      //       const blob = new Blob([code], { type: "text/plain;charset=utf-8" })
      //       if ('download' in document.createElement('a')) { // 非IE下载
      //         const elink = document.createElement('a')
      //         elink.download = `code${new Date().valueOf()}.vue`;
      //         elink.style.display = 'none'
      //         elink.href = URL.createObjectURL(blob)
      //         document.body.appendChild(elink)
      //         elink.click()
      //         URL.revokeObjectURL(elink.href) // 释放URL 对象
      //         document.body.removeChild(elink)
      //       } else {
      //         navigator.msSaveBlob(blob, fileName)
      //       }
    }
  },
  components: {
    "vol-table": VolTable,
    "vol-box": VolBox,
    "vol-form": VolForm,
  },
};

VolForm;
</script>
<style lang="less" scoped>
.form-btns {
  text-align: center;
}
.tables {
  padding-left: 15px;
  .table-item {
    padding: 10px;
  }
  .table-header {
    display: flex;
    margin-bottom: 8px;
  }
  .header-text {
    position: relative;
    bottom: -9px;
    flex: 1;
    font-weight: bold;
  }
  .header-btns {
    text-align: right;
  }
}
</style>