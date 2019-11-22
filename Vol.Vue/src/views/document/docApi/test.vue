
<template>
  <div>
    <docGird></docGird>
  </div>
</template>

 <script>
import docGird from "../docApi/doc_viewGrid/doc_viewGird.vue";
import ViewGrid from "@/components/basic/ViewGrid.vue";
var vueParam = {
  components: {
    docGird
  },
  data() {
    return {};
  }
};
export default vueParam;
 </script>
