const { environment } = require('@rails/webpacker')
const webpack = require('webpack'); //to access built-in plugins

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default'],
  })
)
module.exports = environment
