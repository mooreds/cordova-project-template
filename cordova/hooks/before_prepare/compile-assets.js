#!/usr/bin/env node

// this plugin runs grunt to compile our assets.  See Gruntfile.coffee for the default tasks

var fs = require('fs');
var path = require('path');
var childProcess = require('child_process');

var rootdir = process.argv[2];

var gruntfile = path.join(rootdir,"node_modules",".bin","grunt");
childProcess.exec(gruntfile + " --force", function (error, stdout, stderr) {
   if (error) {
     console.log(error.stack);
     console.log('Error code: '+error.code);
     console.log('Signal received: '+error.signal);
   }
   console.log('Child Process STDOUT: '+stdout);
   console.log('Child Process STDERR: '+stderr);
 });


