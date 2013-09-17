require.config({

  deps: ['main'],

  paths: {
    backbone: '../components/backbone/backbone',
    underscore: '../components/lodash/lodash',
    jquery: '../components/jquery/jquery',
    moment: '../components/moment/moment',

    tpl: '../components/requirejs-tpl/tpl',
    i18n: '../components/requirejs-i18n/i18n',
    text: '../components/requirejs-text/text',
  },

  shim: {
    backbone: {
      deps: ['jquery', 'underscore'],
      exports: 'Backbone'
    }
  }

});
