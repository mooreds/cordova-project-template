#!/usr/bin/env node

// this plugin copies a git ignore file to all platform directories so that git doesn't try to version control derived artifacts.

var fs = require('fs');
var path = require('path');

var rootdir = process.argv[2];

var platforms = fs.readdirSync(path.join(rootdir,"platforms"));
var srcfile = path.join(rootdir,"hooks","after_platform_add",".gitignore");
 platforms.forEach(function(dir) {
    var destfile = path.join(rootdir,"platforms",dir,".gitignore");
    fs.createReadStream(srcfile).pipe(fs.createWriteStream(destfile));
 });
