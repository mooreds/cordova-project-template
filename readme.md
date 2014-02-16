# Cordova Project Template

This project includes some extra tooling to for making Cordova project using [Backbone](http://backbonejs.org), [Grunt](http://gruntjs.com), [Require.js](http://requirejs.com), [Bower](http://bower.io) and [CircleCi](https://circleci.com/).

Always consult the [cordova documentation](http://cordova.apache.org/docs/en/3.0.0/) and use up to date versions :)

This project focuses on mac users who want to develop for ios and android. 

## Usage

Install [apache cordova](http://cordova.apache.org/) with `npm install -g cordova`.

Generate a project using `cordova create`. See a list of other commands with `cordova help`

Copy all top-level files (Makefile, .gitignore, .circle.yml, .bowerrc, Grunfile.coffee, etc) into the project root, making changes as desired.

Copy hooks from the `cordova` directory into the project's `.cordova` folder (or the `hooks` directory under the project root if you are using cordova 3.3.1-0.3.1 or above). The hooks will automatically add .gitignore files to platforms when they're added, run grunt tasks automatically before `cordova prepare` and remove excess build files after `cordova prepare`.

Copy `www` directory for a boilerplate Backbone app and test suite set up with Require.js, along with HTML and Less compilation and image minification provided by Grunt.  You will want to remove the default www/index.html file.

## Documentation for Makefile, Grunt server and Building for Devices

### Install

Install dependencies and setup default config files with:

    $ make install

### Building for a Device

Use the cordova cli to generate a build for a native platform

    $ npm install -g cordova
    $ cordova build [ios, android]
    $ cordova emulate [ios, android]

### Running a development server

Serve local files to the application wrapper to speed up development.

1. Make sure the platform is setup to point at your ip address.
2. Start the platform server with Cordova

    $ grunt server

3. Build to a device with the CLI or launch through Xcode / eclipse.

### Grunt Tasks

Grunt is used for compiling and minifying JavaScript and Less,
compressing images and inlining small images as data-uri's.

Make sure grunt-cli is installed globally:

    $ npm install -g grunt-cli

There is a watch task for compiling CSS assets, you can run it with
`grunt watch`.

### Release Builds

#### iOS

1. Ensure that you have the latest XCode and iOS simulator installed.
2. Change any environment settings.
	- /www/app/config.js
	- /platforms/ios/GeeksWhoDrink/config.xml --> `<content src="index.html" />`
3. `grunt` to compile assets
4. `cordova build ios`	
5. Obtain the group account code signing certificate and private key from another developer.  Install these in your keychain.  The credentials are in passpack.
6. Invite any desired users on TestFlight and have them register their devices.
7. Login to Apple Member Center using group account credentials
	- If not already done...
		- Add new app id - eg) GeeksWhoDrink and com.quickleft.geekswhodrink
		- Add new provisioning profile(s) - geekswhodrink-dev (for development) and geekswhodrink-adhoc (for distribution, including TestFlight)
	- Assign any device ids to the provisioning profiles as desired.  Note that you may need to copy them from within TestFlight.
8. Open XCode & Organizer and ensure that your provisioning profiles are listed.
9. In the build configuration | code signing block, choose the Group Account iPhone distribution certificate for under geekswhodrink-adhoc.
10. Test your build by selecting a simulator in the device dropdown and choosing `run`.
11. Create an archive using `Product | Archive`
12. In the Organizer, click distribute, which will generate an IPA.  During this process, be sure to once again select the Group Account certificate and choose ad-hoc deployment.
13. The .ipa may then be uploaded to TestFlight.  After upload notify users as desired and test on actual device.
	

#### Android

1. `brew install android`
2. Run `android` and ensure that you have the latest versions installed, including the SDK
3. Add JAVA_HOME to your PATH eg) .zshrc --> `export JAVA_HOME=$(/usr/libexec/java_home)`
4. Change any environment settings.
	- /www/app/config.js
	- /platforms/android/res/xml/config.xml --> `<content src="index.html" />`
5. `grunt` to compile assets
6. `cordova build android`	
7. Obtain the `gwd-release-key.keystore` file from another developer so that you can sign release builds and place it in the `platforms/android` directory.  The creds are in passpack.
8. `cd platforms/android` and run `ant release` (or `ant debug` for a test build) -  this will create .apk in the `bin` directory.
10. Builds may optionally be deployed on Android AVD's for verification and testing.
11. Release builds may then be uploaded to TestFlight.  After upload, assign user device permissions and notify users as desired and test on actual device.

