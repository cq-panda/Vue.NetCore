import templateCode from './templateCode'
export default function () {
    let code = templateCode;
    let _formOptions = this.options.formOptions.map(m => {
        let _op = m.map((m1, i) => {
            let _obj;
            //.data[0].hasOwnProperty("key")
            if (m1.data && m1.data.length && !m1.dataKey) {
                let m2 = JSON.parse(JSON.stringify(m1));
                m2.data = m2.data.map(c => {
                    return { key: c.label || c.key, value: c.label }
                })
                _obj = JSON.stringify(m2)
            } else {
                _obj = JSON.stringify(m1)
            }
            return (i === 0 ? '' : '\n\t\t\t\t') + _obj
        }).join(',');
        //return JSON.stringify(m, null, '')
        return _op;
    })
    code = code.replace('{#fields}', JSON.stringify(this.options.fields))
        .replace('{#formOptions}', '[' + _formOptions.join('],\n\t\t\t\t[') + ']');
    code = code.replace('}],', '\t\t\t\t\t}],')
        .replace("[{#tableOptions}]", JSON.stringify(this.options.tables, null, '\t'))
        .replace("[{#tabsOptions}]", JSON.stringify(this.options.tabs, null, '\t'))
    // fields: {#fields}, 
    //     formOptions: [{#formOptions}],
    //     tables: [{#tables}],
    //     tabs: [{#tabs}] 
    var tabsText = this.options.tabs.length ? ` <div class="tables"
     style="padding-bottom: 10px">
  <el-tabs v-model="tabsModel"
           @tab-click="() => {}">
    <el-tab-pane style="padding: 0"
                 class="table-item"
                 v-for="(item, index) in tabs"
                 :label="item.name"
                 :name="index+''"
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
</div>`: ''
    code = code.replace('{#tabs}', tabsText);
    if (this.options.tables.length || this.options.tabs.length) {
        code = code.replace("{import_VolTable}", "import VolTable from '@/components/basic/VolTable'")
        code = code.replace(",{component_table}", ",'vol-table': VolTable")
    } else {
        code = code.replace("{import_VolTable}", '')
        code = code.replace("{component_table}", '')
    }

    if (this.options.tables.length) {

        code = code.replace('{table_ms}', `
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
      },`)
        code = code.replace('{#tables}',
            `
      <!--table配置 -->
      <div class="tables">
          <div class="table-item"
              v-for="(item, index) in tables"
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
      </div>`);

    } else {

        code = code.replace('{table_ms}', '')
        code = code.replace('{#tables}', '');
    }
    const blob = new Blob([code], { type: "text/plain;charset=utf-8" })
    if ('download' in document.createElement('a')) { // 非IE下载
        const elink = document.createElement('a')
        elink.download = `code${new Date().valueOf()}.vue`;
        elink.style.display = 'none'
        elink.href = URL.createObjectURL(blob)
        document.body.appendChild(elink)
        elink.click()
        URL.revokeObjectURL(elink.href) // 释放URL 对象
        document.body.removeChild(elink)
    } else {
        navigator.msSaveBlob(blob, fileName)
    }
}