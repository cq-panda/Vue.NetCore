<template>
  <div v-if="$global.lang">
    <el-dropdown trigger="hover">
      <el-button
        link
        class="el-dropdown-link"
        style="outline: none"
        :style="{ color: color }"
      >
        {{ getText }}
        <i class="el-icon-arrow-down"></i>
      </el-button>
      <template #dropdown>
        <el-dropdown-menu>
          <el-dropdown-item
            :disabled="lang == item.value"
            v-for="(item, index) in list"
            :key="index"
            ><div @click="onClick(item.value)">
              {{ item.text }}
            </div></el-dropdown-item
          >
        </el-dropdown-menu>
      </template>
    </el-dropdown>
  </div>
  <!-- </div> -->
</template>
<script>
import { currentLang } from "./index.js";
export default {
  props: {
    direction: {
      type: String,
      default: "horizontal",
    },
    color: {
      type: String,
      default: "white",
    },
  },
  computed: {
    getText() {
      let data = this.list.find((c) => {
        return c.value == this.lang;
      });
      if (data) {
        return data.text;
      }
      return "简体中文";
    },
  },
  data() {
    return {
      lang: {},
      list: [
        { name: "简体中文", text: "简体中文", value: "zh-cn" },
        { name: "繁体中文", text: "繁體中文", value: "zh-tw" },
        { name: "英语", text: "English", value: "en" },
        { name: "法语", text: "Français", value: "fr" },
        { name: "西班牙语", text: "Español", value: "es" },
        // { name: "阿拉伯语", text: " الصينية التقليدية", value: "ar" },
        // { name: "俄语", text: " русский язык", value: "ru" },
      ],
    };
  },
  created() {
    this.lang = currentLang();
  },
  methods: {
    onClick(key) {
      this.lang = key;
      localStorage.setItem(lang_storage_key, key);
      location.reload();
    },
  },
};
</script>
<style scoped>
.el-dropdown-link {
  color: white;
  font-size: 14px !important;
  line-height: 60px;
  height: 60px;
  /* padding: 10px 0; */
}
</style>
