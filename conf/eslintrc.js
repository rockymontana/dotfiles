module.exports = {
  extends: [
    'plugin:vue/essential',
  ],
  plugins: [
      'vue',
      'vuefix'
  ],
  rules: {
    'vuefix/vuefix': [2, { 'auto': true }]
  }
}