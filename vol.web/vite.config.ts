import { fileURLToPath } from "node:url";
import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
//import { visualizer } from 'rollup-plugin-visualizer'
import vueJsx from "@vitejs/plugin-vue-jsx";
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    {
      name: "remove-pure-annotations",
      transform(code) {
        return code.replace(/\/\*#__PURE__\*\//g, "");
      },
    },
    vue(),
    vueJsx(),
  ],
  define: {
    __VUE_PROD_HYDRATION_MISMATCH_DETAILS__: "true",
  },
  optimizeDeps: {
    exclude: ["vue"],
  },
  build: {
    //minify: false,
    //minify: "terser", 
    commonjsOptions: {
      transformMixedEsModules: true,
    },
    chunkSizeWarningLimit: 1000, // 提高警告阈值
    rollupOptions: {
      onwarn(warning, warn) {
        if (warning.code === "EMPTY_BUNDLE"||warning.code === 'EVAL'||warning.message.includes('larger than')) {
          return;
        }
        warn(warning);
      },
      // external: ["vue-plugin-hiprint"],
      output: {
         // 保留formatter变量名
        //minifyInternalExports: false,
        //每个node_modules模块分成一个js文件
        manualChunks(id) {
          if (id.includes("node_modules")) {
            return id
              .toString()
              .split("node_modules/")[1]
              .split("/")[0]
              .toString();
          }
        },
        entryFileNames: "assets/js/[hash].js", 
        chunkFileNames: "assets/js/[hash].js", 
        assetFileNames: "assets/[ext]/[hash].[ext]",
      },
    },
    // outDir: 'dist', // 输出目录，默认为 'dist'
    // rollupOptions: {
    //   input: {
    //     main: 'src/main.js', // 你的入口文件
    //   }
    // },
    sourcemap: false, //生成源映射文件
  },
  publicDir: "public", // 这里指定了 public 文件夹的位置
  css: {
    //查看CSS属于哪个css文件
    devSourcemap: false,
  },
  server: {
    port: 9990,
    //配置代理
    // proxy: {//http.js里设置为空axios.defaults.baseURL = "";
    //   '/api': {
    //     target:'http://api.volcore.xyz/',
    //     changeOrigin: true,
    //     timeout:1000*60*10
    //     //rewrite: (path) => path.replace(/^\/api/, '')
    //   }
    // }
  },
  resolve: {
    extensions: [".mjs", ".js", ".ts", ".jsx", ".tsx", ".json", ".vue", ".mjs"],
    alias: {
      "@": fileURLToPath(new URL("./src", import.meta.url)),
    },
  },
});
