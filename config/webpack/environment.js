const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// Add the ProvidePlugin configuration
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery'
}));

module.exports = environment;
