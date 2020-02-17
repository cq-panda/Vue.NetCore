<template>
  <div class="upload-container">
    <div style="padding: 10px 20px;
    border: 1px solid #d6d1d1;
    border-radius: 5px;">
      <VolHeader style="margin-bottom: 25px;" text="表单与文件上传下载" icon="ios-cloud-download">
        <div slot="content">可自定义上传、图片预览与点击下载文件</div>
        <!-- <div>还没想好</div> -->
      </VolHeader>
      <VolForm
        ref="myform"
        :label-width="180"
        :load-key="true"
        :form-fileds="formFileds"
        :form-rules="formRules"
      ></VolForm>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolUpload from "@/components/basic/VolUpload.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
export default {
  components: {
    VolUpload,
    VolForm,
    VolHeader
  },
  data() {
    //表单验证时根据remove判断是否有图片
    return {
      formFileds: {
        OrderNo: "BJ2019000001",
        OrderDate: new Date(),
        City: "北京市",
        Price: 277.6,
        ProductCode: "2019FX001",
        ProductName: "无线充电宝",
        file1: "",
        file2: "",
        file3: [
          //对已有文件显示，并可重新上传
          {
            name: "x1.jpg",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg"
          },
          {
            name: "x2.jpg",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg"
          },
          {
            name: "x3.jpg",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg"
          },
          {
            name: "xx.jpg",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/xx.jpg"
          },
          {
            name: "tj01.jpg",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj01.jpg"
          }
        ],
        file4: "",
        file5: [
          {
            name: "测试现有文件可下载1.xlsx",
            path:
              "https://files-1256993465.cos.ap-chengdu.myqcloud.com/测试现有文件可下载1.xlsx"
          },
          {
            name: "测试现有文件可下载2.xlsx",
            path:
              "https://files-1256993465.cos.ap-chengdu.myqcloud.com/测试现有文件可下载2.xlsx"
          }
        ],
        //只读图片
        //也可以直接用逗号拼接 "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg,https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg",
        file6: [
          {
            name: "x2.jpg",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg"
          },
          {
            name: "x3.jpg",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg"
          }
        ], //只读可下载的文件，格式与上面只读图片相同
        file7: [
          {
            name: "(api后台文件)基础表单+编辑只读 (4).xlsx",
            path:
              "Upload/Tables/App_Appointment/201911241454458938/基础表单+编辑只读 (4).xlsx"
          },
          {
            name: "(远程第三方服务器文件)测试现有文件可下载1.xlsx",
            path:
              "https://files-1256993465.cos.ap-chengdu.myqcloud.com/测试现有文件可下载1.xlsx"
          },
          {
            name: "(远程第三方服务器文件)测试现有文件可下载2.xlsx",
            path:
              "xhttps://files-1256993465.cos.ap-chengdu.myqcloud.com/测试现有文件可下载2.xlsx"
          }
        ],
        file8: ""
      },
      formRules: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            title: "商品编号",
            required: true, //设置为必选项
            field: "ProductCode",
            type: "text"
          },
          {
            title: "商品名称",
            placeholder: "此处数据源为手动绑定",
            required: false,
            field: "ProductName",
            type: "text"
          }
        ],
        [
          {
            type: "decimal",
            title: "商品价格",
            required: true,
            placeholder: "你可以自己定义placeholder显示的文字",
            field: "Price"
          },
          {
            dataKey: "city",
            title: "收货城市",
            required: true,
            field: "City",
            data: [],
            type: "select"
          }
        ],
        [
          {
            title: "发货单号",
            field: "OrderNo",
            type: "text"
          },
          {
            title: "发货日期",
            field: "OrderDate",
            type: "datetime"
          }
        ],
        [
          {
            title: "图片只读",
            field: "file6",
            readonly: true,
            type: "img"
          },
          {
            title: "文件只读可下载",
            readonly: true,
            field: "file7",
            downLoad: true,
            maxSize: 0.5, //最大0.5M文件
            multiple: true, //启用多文件
            maxFile: 2, //最多两个文件
            type: "excel"
          }
        ],
        [
          {
            title: "自动上传不限制类型",
            field: "file1",
            required: true,
            maxSize: 1, //最大1M文件
            url: "/api/App_Appointment/Upload",
            type: "file"
          },
          {
            title: "自动上传最多两个excel文件",
            field: "file2",
            maxSize: 0.5, //最大0.5M文件
            multiple: true, //启用多文件
            maxFile: 2, //最多两个文件
            url: "/api/App_Appointment/Upload",
            type: "excel"
          }
        ],
        [
          {
            title: "手动上传图片",
            autoUpload: false,
            field: "file3",
            maxSize: 1, //最大1M文件
            colSize: 12,
            url: "/api/App_Appointment/Upload",
            type: "img"
          }
        ],
        [
          {
            title: "显示现有文件并可上传下载",
            autoUpload: false,
            field: "file5",
            maxSize: 1, //最大1M文件
            multiple: true, //启用多文件
            maxFile: 3, //最多3个文件
            downLoad: true,
            url: "/api/App_Appointment/Upload",
            type: "file",
            fileClick(index, file, files) {
              this.$Message.error(file.name);
              return true;
            }
          },
          {
            title: "手动上传多文件",

            field: "file4",
            maxSize: 1, //最大1M文件
            multiple: true, //启用多文件
            maxFile: 3, //最多两个文件
            url: "/api/App_Appointment/Upload",
            type: "img"
          }
        ]
      ]
    };
  }
};
</script>
<style scoped>
.upload-container {
  position: relative;
  max-width: 1200px;
  left: 0;
  right: 0;
  margin: auto;
  padding: 30px;
  max-width: 1100px;
}
</style>