path = require('path')

# Connect Server
#
# Replacement for `cordova serve [platform]` that supports logging and better caching.
serveCordova = (connect, platform) ->
  return (req, res, next) ->
    if /\/(plugins\/|cordova\.js|cordova_plugins\.js)/.test(req.url)
      connect.static( path.resolve("./platforms/#{platform}/www"))(req, res, next)
    else
      next()

serveiOS = (connect) ->
  return [
    connect.logger('dev')
    serveCordova(connect, 'ios')
    mountFolder(connect, './www')
  ]

serveAndroid = (connect) ->
  return [
    connect.logger('dev')
    serveCordova(connect, 'android')
    mountFolder(connect, './www')
  ]  

mountFolder = (connect, dir) ->
  connect.static(path.resolve(dir))

config =
  connect:
    options:
      hostname: '0.0.0.0'
    ios:
      options:
        port: 5000
        middleware: serveiOS
    android:
      options:
        port: 6000
        middleware: serveAndroid

  less:
    compile:
      options:
        paths: ['www/less']
      files:
        'www/css/main.css': 'www/less/main.less'

  cssmin:
    compress:
      files:
        'www/css/nerds.css': ['www/css/nerds.css']
      options:
        keepSpecialComments: 0

  imagemin:
    dist:
      options:
        optimizationLevel: 5
      files:
        "www/img/dist/background.png": "www/img/background.png"

  requirejs:
    compile:
      options:
        mainConfigFile: 'www/app/require-config.js'
        name: 'require-config'
        out: 'www/js/app.js'
        optimize: 'uglify2'
        wrap: false
        preserveLicenseComments: false
        almond: true

  jshint:
    options:
      jshintrc: ".jshintrc"
    files: [ 'www/app/**/*.js' ]

  htmlbuild:
    dist:
      src: 'www/html/index.html'
      dest: 'www/'
      options:
        beautify: true
        sections:
          developer: 'www/html/views/developer.html'


  mocha_phantomjs:
    options:
      reporter: 'dot'
    nerds: ['www/spec/index.html']

  watch:
    mocha:
      files: ['www/app/**/*.js', 'www/spec/**/*.js']
      tasks: ['mocha_phantomjs']
    less:
      files: ['www/less/**/*.less']
      tasks: ['less']
      options:
        spawn: true
    htmlbuild:
      files: ['www/html/**/*.html']
      tasks: ['htmlbuild']

module.exports = (grunt) ->

  grunt.initConfig( config )

  grunt.loadNpmTasks('grunt-requirejs')
  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-imagemin')
  grunt.loadNpmTasks('grunt-mocha-phantomjs')
  grunt.loadNpmTasks('grunt-html-build')

  grunt.registerTask('css', [
    'less'
    'imagemin'
    'cssmin'
  ])

  grunt.registerTask('default', [
    'jshint'
    'requirejs'
    'mocha_phantomjs'
    'css'
    'htmlbuild'
  ])

  grunt.registerTask('circleci', [
    'jshint'
    'mocha_phantomjs'
  ])

  grunt.registerTask('server', [
    'connect:ios:keepalive'
  ])
