<template>
  <div class="kindeditor">
    <div>
      <VolBox
        icon="ios-chatbubbles"
        :model.sync="uploadModel"
        title="图片上传"
        :height="180"
        :width="520"
        :padding="15"
      >
        <VolUpload
          style="text-align: center; border: 1px dotted #FF9800;padding: 20px;"
          :autoUpload="false"
          :multiple="true"
          :url="UploadImgUrl"
          :max-file="uploadCount"
          :img="true"
          :upload-after="uploadAfter"
          :upload-before="uploadBefore"
        ></VolUpload>
      </VolBox>
    </div>
    <!-- <Button type="info" @click="appendContent()">插入内容</Button> -->
    <textarea :height="height" :width="width" :id="id" name="content" v-model="outContent"></textarea>
  </div>
</template>

<script>
import "@/../static/kindeditor/themes/default/default.css";
import "@/../static/kindeditor/kindeditor-all-min.js";
// import "@/../static/kindeditor/kindeditor-all.js";
import "@/../static/kindeditor/lang/zh-CN.js";
let $this;
export default {
  components: {
    VolBox: () => import("@/components/basic/VolBox.vue"),
    VolUpload: () => import("@/components/basic/VolUpload.vue")
  },
  name: "kindeditor",
  data() {
    return {
      uploadModel: false,
      id: "vue-kind" + ~~(Math.random() * 1000),
      editor: null,
      outContent: this.content
    };
  },
  props: {
    UploadImgUrl: {
      //上传图片的url
      type: String,
      default: ""
    },
    upload:{ //上传方法
      type:Function,
      default:(file)=>{

      }
    },
    uploadCount: {
      //最多可以上传(图片)的数量
      type: Number,
      default: 3
    },
    content: {
      type: String,
      default: ""
    },
    // id: {
    //   type: String,
    //   required: true
    // },
    width: {
      type: String,
      default: "100%"
    },
    height: {
      type: String,
      default: "500px"
    },
    minWidth: {
      type: Number,
      default: 650
    },
    minHeight: {
      type: Number,
      default: 100
    },
    items: {
      type: Array,
      default: function() {
        return [
          "source",
          "|",
          "undo",
          "redo",
          "|",
          "preview",
          "print",
          "template",
          "code",
          "cut",
          "copy",
          "paste",
          "plainpaste",
          "wordpaste",
          "|",
          "justifyleft",
          "justifycenter",
          "justifyright",
          "justifyfull",
          "insertorderedlist",
          "insertunorderedlist",
          "indent",
          "outdent",
          "subscript",
          "superscript",
          "clearhtml",
          "quickformat",
          "selectall",
          "|",
          "fullscreen",
          "/",
          "formatblock",
          "fontname",
          "fontsize",
          "|",
          "forecolor",
          "hilitecolor",
          "bold",
          "italic",
          "underline",
          "strikethrough",
          "lineheight",
          "removeformat",
          "|",
          //   "image",
          //   "multiimage",
          "flash",
          "media",
          "insertfile",
          "table",
          "hr",
          "emoticons",
          "baidumap",
          "pagebreak",
          "anchor",
          "link",
          "unlink",
          "|",
          "vue-img"
          //  "about"
        ];
      }
    },
    noDisableItems: {
      type: Array,
      default: function() {
        return ["source", "fullscreen"];
      }
    },
    filterMode: {
      type: Boolean,
      default: true
    },
    htmlTags: {
      type: Object,
      default: function() {
        return {
          font: ["color", "size", "face", ".background-color"],
          span: ["style"],
          div: ["class", "align", "style"],
          table: [
            "class",
            "border",
            "cellspacing",
            "cellpadding",
            "width",
            "height",
            "align",
            "style"
          ],
          "td,th": [
            "class",
            "align",
            "valign",
            "width",
            "height",
            "colspan",
            "rowspan",
            "bgcolor",
            "style"
          ],
          a: ["class", "href", "target", "name", "style"],
          embed: [
            "src",
            "width",
            "height",
            "type",
            "loop",
            "autostart",
            "quality",
            "style",
            "align",
            "allowscriptaccess",
            "/"
          ],
          img: [
            "src",
            "width",
            "height",
            "border",
            "alt",
            "title",
            "align",
            "style",
            "/"
          ],
          hr: ["class", "/"],
          br: ["/"],
          "p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6": ["align", "style"],
          "tbody,tr,strong,b,sub,sup,em,i,u,strike": []
        };
      }
    },
    wellFormatMode: {
      type: Boolean,
      default: true
    },
    resizeType: {
      type: Number,
      default: 2
    },
    themeType: {
      type: String,
      default: "default"
    },
    langType: {
      type: String,
      default: "zh-CN"
    },
    designMode: {
      type: Boolean,
      default: true
    },
    fullscreenMode: {
      type: Boolean,
      default: false
    },
    basePath: {
      type: String
    },
    themesPath: {
      type: String
    },
    pluginsPath: {
      type: String,
      default: ""
    },
    langPath: {
      type: String
    },
    minChangeSize: {
      type: Number,
      default: 5
    },
    loadStyleMode: {
      type: Boolean,
      default: true
    },
    urlType: {
      type: String,
      default: ""
    },
    newlineTag: {
      type: String,
      default: "p"
    },
    pasteType: {
      type: Number,
      default: 2
    },
    dialogAlignType: {
      type: String,
      default: "page"
    },
    shadowMode: {
      type: Boolean,
      default: true
    },
    zIndex: {
      type: Number,
      default: 811213
    },
    useContextmenu: {
      type: Boolean,
      default: true
    },
    syncType: {
      type: String,
      default: "form"
    },
    indentChar: {
      type: String,
      default: "\t"
    },
    cssPath: {
      type: [String, Array]
    },
    cssData: {
      type: String
    },
    bodyClass: {
      type: String,
      default: "ke-content"
    },
    colorTable: {
      type: Array
    },
    afterCreate: {
      type: Function
    },
    afterChange: {
      type: Function
    },
    afterTab: {
      type: Function
    },
    afterFocus: {
      type: Function
    },
    afterBlur: {
      type: Function
    },
    afterUpload: {
      type: Function
    },
    uploadJson: {
      type: String
    },
    fileManagerJson: {
      type: Function
    },
    allowPreviewEmoticons: {
      type: Boolean,
      default: true
    },
    allowImageUpload: {
      type: Boolean,
      default: true
    },
    allowFlashUpload: {
      type: Boolean,
      default: true
    },
    allowMediaUpload: {
      type: Boolean,
      default: true
    },
    allowFileUpload: {
      type: Boolean,
      default: true
    },
    allowFileManager: {
      type: Boolean,
      default: false
    },
    fontSizeTable: {
      type: Array,
      default: function() {
        return ["9px", "10px", "12px", "14px", "16px", "18px", "24px", "32px"];
      }
    },
    imageTabIndex: {
      type: Number,
      default: 0
    },
    formatUploadUrl: {
      type: Boolean,
      default: true
    },
    fullscreenShortcut: {
      type: Boolean,
      default: false
    },
    extraFileUploadParams: {
      type: Array,
      default: function() {
        return [];
      }
    },
    filePostName: {
      type: String,
      default: "imgFile"
    },
    fillDescAfterUploadImage: {
      type: Boolean,
      default: false
    },
    afterSelectFile: {
      type: Function
    },
    pagebreakHtml: {
      type: String,
      default: "<hr style=”page-break-after: always;” class=”ke-pagebreak” />"
    },
    allowImageRemote: {
      type: Boolean,
      default: true
    },
    autoHeightMode: {
      type: Boolean,
      default: false
    },
    fixToolBar: {
      type: Boolean,
      default: false
    },
    tabIndex: {
      type: Number
    }
  },
  watch: {
    content(val) {
      this.editor && val !== this.outContent && this.editor.html(val);
    },
    outContent(val) {
      this.$emit("update:content", val);
      this.$emit("on-content-change", val);
    }
  },
  methods: {
    uploadBefore(files) {
      //上传前,建议上传至第三方进行存储
      return true;
    },
    uploadAfter(result, files) {
      if (!result.status) {
        return;
      }
      let urls = files.map(x => {
        return (
          `<img class="editor-img" src="` +
          (this.http.ipAddress + result.data + x.name) +
          `"/>`
        );
      });
      this.editor.insertHtml(urls.join(","));
      this.uploadModel = false;
    },
    getContent() {
      return this.outContent;
    },
    setContent(content) {
      //设置内容
      this.outContent = content || "";
      this.editor.html(this.outContent);
    },
    appendContent(htmlContent) {
      //kindEditor中当前光标的位置插入内容
      var startOffset = this.editor.cmd.range.startOffset;
      this.editor.insertHtml(htmlContent);
    }
  },
  mounted() {
    $this = this;
    KindEditor.plugin("vue-img", function(K) {
      var editor = this,
        name = "vue-img";
      // 点击图标时执行
      editor.clickToolbar(name, function() {
        $this.uploadModel = true;
      });
    });
    KindEditor.lang({
      "vue-img": "上传图片"
    });
    var _this = this;
    _this.editor = window.KindEditor.create("#" + this.id, {
      width: _this.width,
      height: _this.height,
      minWidth: _this.minWidth,
      minHeight: _this.minHeight,
      items: _this.items,
      noDisableItems: _this.noDisableItems,
      filterMode: _this.filterMode,
      htmlTags: _this.htmlTags,
      wellFormatMode: _this.wellFormatMode,
      resizeType: _this.resizeType,
      themeType: _this.themeType,
      langType: _this.langType,
      designMode: _this.designMode,
      fullscreenMode: _this.fullscreenMode,
      basePath: _this.basePath,
      themesPath: _this.cssPath,
      pluginsPath: _this.pluginsPath,
      langPath: _this.langPath,
      minChangeSize: _this.minChangeSize,
      loadStyleMode: _this.loadStyleMode,
      urlType: _this.urlType,
      newlineTag: _this.newlineTag,
      pasteType: _this.pasteType,
      dialogAlignType: _this.dialogAlignType,
      shadowMode: _this.shadowMode,
      zIndex: _this.zIndex,
      useContextmenu: _this.useContextmenu,
      syncType: _this.syncType,
      indentChar: _this.indentChar,
      cssPath: _this.cssPath,
      cssData: _this.cssData,
      bodyClass: _this.bodyClass,
      colorTable: _this.colorTable,
      afterCreate: _this.afterCreate,
      afterChange: function() {
        _this.afterChange;
        _this.outContent = this.html();
      },
      afterTab: _this.afterTab,
      afterFocus: _this.afterFocus,
      afterBlur: _this.afterBlur,
      afterUpload: _this.afterUpload,
      uploadJson: _this.uploadJson,
      fileManagerJson: _this.fileManagerJson,
      allowPreviewEmoticons: _this.allowPreviewEmoticons,
      allowImageUpload: _this.allowImageUpload,
      allowFlashUpload: _this.allowFlashUpload,
      allowMediaUpload: _this.allowMediaUpload,
      allowFileUpload: _this.allowFileUpload,
      allowFileManager: _this.allowFileManager,
      fontSizeTable: _this.fontSizeTable,
      imageTabIndex: _this.imageTabIndex,
      formatUploadUrl: _this.formatUploadUrl,
      fullscreenShortcut: _this.fullscreenShortcut,
      extraFileUploadParams: _this.extraFileUploadParams,
      filePostName: _this.filePostName,
      fillDescAfterUploadImage: _this.fillDescAfterUploadImage,
      afterSelectFile: _this.afterSelectFile,
      pagebreakHtml: _this.pagebreakHtml,
      allowImageRemote: _this.allowImageRemote,
      autoHeightMode: _this.autoHeightMode,
      fixToolBar: _this.fixToolBar,
      tabIndex: _this.tabIndex
    });
  }
};
</script>

<style>
.ke-icon-vue-img {
  background-image: url(/../static/kindeditor/themes/default/default.png);
  background-position: 0px -496px;
  width: 16px;
  height: 16px;
}
</style>
