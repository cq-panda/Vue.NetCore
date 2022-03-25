// const webpack = require("webpack");

module.exports = {
  productionSourceMap: false,
  lintOnSave: false,
  devServer: {
    port: 9990,
    overlay: {
      warning: false,
      errors: false
    }
  },
  css: {
    //查看CSS属于哪个css文件
    sourceMap: true
  },
  //https://cli.vuejs.org/zh/guide/html-and-static-assets.html#html
  chainWebpack: (config) => {
    // 移除 prefetch 插件
    config.plugins.delete('prefetch');
    //自下定义title
    config.plugin('html').tap((args) => {
      args[0].title = 'vol3.0版本';
      return args;
    });

    // 或者
    // 修改它的选项：
    // config.plugin('prefetch').tap(options => {
    //   options[0].fileBlacklist = options[0].fileBlacklist || []
    //   options[0].fileBlacklist.push(/myasyncRoute(.)+?\.js$/)
    //   return options
    // })
  }
  // configureWebpack: {
  //     plugins: [
  //         new webpack.optimize.MinChunkSizePlugin({
  //             minChunkSize: 100000 // 通过合并小于 minChunkSize 大小的 chunk，将 chunk 体积保持在指定大小限制以上
  //         })
  //     ]
  // }
};
