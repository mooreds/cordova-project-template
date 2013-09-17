define(function(require, exports, module){
  var config = require('config');
  var $ = require('jquery');
  var App = require('./nerds');

  window.nerds = new App();
});
