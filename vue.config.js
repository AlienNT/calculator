const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,

  publicPath: process.env.NODE_ENV === 'production' ? '/calculator/' : '/',
  css: {
    loaderOptions: {
      scss: {
        additionalData: `@import "~@/assets/css/variables.scss";`
      },
    }
  }

})
