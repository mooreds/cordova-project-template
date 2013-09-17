define([
  // 'spec/app-spec',
],
function(){
  if( window.mochaPhantomJS ){
    window.mochaPhantomJS.run();
  } else {
    window.mocha.run();
  }
});
