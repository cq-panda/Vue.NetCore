<template>
  <div class="upload">
    <UploadExcel></UploadExcel>
    <UploadImg></UploadImg>
  </div>
</template>


<script>
    import UploadExcel from "@/components/basic/UploadExcel.vue";
       import UploadImg from "@/components/basic/UploadImg.vue";
export default {
  components:{
    UploadExcel,UploadImg
  }
}
</script>


