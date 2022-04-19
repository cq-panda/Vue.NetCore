var code = `<template>
<div style="padding: 15px 20px 15px 5px">
  <div class="pre-text">{{ text }}</div>
  <vol-form ref="form"
            :labelWidth="80"
            :load-key="false"
            :formFields="fields"
            :formRules="formOptions">
  </vol-form>
 {#tables}
 {#tabs}

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
  </div>
</div>
</template>

<script>
{import_VolTable}
import VolForm from '@/components/basic/VolForm'
export default {
    components: {"vol-form": VolForm,{component_table}},
    data () {
        return {
            text: "",
            tabsModel: "0",
            fields: {#fields}, 
            formOptions: [{#formOptions}],
            tables: [{#tableOptions}],
            tabs: [{#tabsOptions}] 
        };
    },
    created () { 

    },
    methods: {{table_ms}
        submit () {
            this.$Message.success("submit")
            return;
            this.http.post("url",this.fields,true).then(result=>{

            })
        },
        reset () {
            this.$refs.form.reset();
            this.$Message.success("表单已重置")
        },
        download () {
            this.$Message.info("111")
        }
    }
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
</style>`

export default code