define(function(require, exports, module) {
  exports.ENV = 'development';
  exports.SERVER = 'http://localhost:3000';
  exports.API_ROOT = exports.SERVER + 'api/v1/';
  exports.PUSHER_KEY = null;
  exports.PUSHER_SECRET = null;

  exports.geolocation = {
    MAXIMUM_AGE: 10000,
    TIME_OUT: 15000,
    ENABLE_HIGH_ACCURACY: true
  };

  window.Caliper = {
    config: {
      apiKey: null,
      debug: true
    }
  };
});
