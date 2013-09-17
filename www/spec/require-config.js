require.config({
  deps: ['spec/main'],

  baseUrl: '../app',

  paths: {
    // app config
    backbone: '../bower_components/backbone/backbone',
    underscore: '../bower_components/lodash/lodash',
    jquery: '../bower_components/jquery/jquery',
    moment: '../bower_components/moment/moment',

    tpl: '../bower_components/requirejs-tpl/tpl',
    text: '../bower_components/requirejs-text/text',
    i18n: '../bower_components/requirejs-i18n/i18n',

    // test config
    spec: '../spec',
    chai: '../bower_components/chai/chai'
  },

  shim: {
    backbone: {
      deps: ['jquery', 'underscore'],
      exports: 'Backbone'
    }
  }
});
