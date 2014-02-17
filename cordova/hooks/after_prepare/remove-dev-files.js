#!/usr/bin/env node

// this plugin removes derived files from the platform directories.
var fs = require('fs');
var path = require('path');

var rootdir = process.argv[2];

var platforms = process.env.CORDOVA_PLATFORMS.split(",");
var subdirs = ["app","bower_components", "spec","less"];

platforms.forEach(function(platform) {
  subdirs.forEach(function(subdir) {
    var p = path.join(rootdir,"platforms",platform,"www",subdir);
    // console.log("path: "+p);
    deleteFolderRecursive(p);
  });
});


// from http://stackoverflow.com/questions/12627586/is-node-js-rmdir-recursive-will-it-work-on-non-empty-directories
deleteFolderRecursive = function(path) {
    var files = [];
    if( fs.existsSync(path) ) {
        files = fs.readdirSync(path);
        files.forEach(function(file,index){
            var curPath = path + "/" + file;
            if(fs.statSync(curPath).isDirectory()) { // recurse
                deleteFolderRecursive(curPath);
            } else { // delete file
                fs.unlinkSync(curPath);
            }
        });
        fs.rmdirSync(path);
    }
};
