import { fileURLToPath } from 'node:url'
import commonjs from 'vite-plugin-commonjs'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueJsx from '@vitejs/plugin-vue-jsx'
import { visualizer } from 'rollup-plugin-visualizer'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    commonjs(),
    // commonjs({
    //   // 这里可以配置插件的选项，例如指定需要转换的模块等
    //   include: 'node_modules/**', // 包含node_modules下的所有模块
    // }),
    vue(),
    vueJsx(),
    visualizer({
      filename: 'report_form_rollup-plugin-visualizer.html'
    }),
    //引用后提示：
    // requireTransform({
    //   fileRegex: /.js$|.ts$/
    // })
  ],
  define: {
  },
  optimizeDeps: {
    exclude: ['vue']
  },
  build: {
    commonjsOptions: {
      transformMixedEsModules: true
    },
    rollupOptions: {
      output: {
        //每个node_modules模块分成一个js文件
        manualChunks(id) {
          if (id.includes('node_modules')) {
            return id.toString().split('node_modules/')[1].split('/')[0].toString()
          }
        },
        // 用于从入口点创建的块的打包输出格式[name]表示文件名,[hash]表示该文件内容hash值
        // entryFileNames: 'assets/js/[name].[hash].js', // 用于命名代码拆分时创建的共享块的输出命名
        // chunkFileNames: 'assets/js/[name].[hash].js', // 用于输出静态资源的命名，[ext]表示文件扩展名
        // assetFileNames: 'assets/[ext]/[name].[hash].[ext]'
        entryFileNames: 'assets/js/[hash].js', // 用于命名代码拆分时创建的共享块的输出命名
        chunkFileNames: 'assets/js/[hash].js', // 用于输出静态资源的命名，[ext]表示文件扩展名
        assetFileNames: 'assets/[ext]/[hash].[ext]'
      }
    },
    // outDir: 'dist', // 输出目录，默认为 'dist'
    // rollupOptions: {
    //   input: {
    //     main: 'src/main.js', // 你的入口文件
    //   }
    // },
    sourcemap: false //生成源映射文件
  },
  publicDir: 'public', // 这里指定了 public 文件夹的位置
  css: {
    //查看CSS属于哪个css文件
    devSourcemap: false
  },
  server: {
    port: 9990
    // proxy: {
    //   '/api': {
    //     target: 'http://xxxx.com',
    //     changeOrigin: true,
    //     rewrite: (path) => path.replace(/^\/api/, '')
    //   }
    // }
  },
  resolve: {
    extensions: ['.mjs', '.js', '.ts', '.jsx', '.tsx', '.json', '.vue', '.mjs'],
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
