PATH := ./node_modules/.bin:$(PATH)

install: setup-config
	test -d plugins || mkdir plugins
	npm install
	bower install
	brew install android-sdk
	brew install ios-sim
	android
	test -d $(HOME)/.cordova/lib/ios && echo "Cordova iOS platform already installed." || cordova platform add ios
	test -d $(HOME)/.cordova/lib/android && echo "Cordova Android platform already installed." || cordova platform add android
	rm -rf www/components/requirejs/dist

setup-config:
	test -f www/app/config.js || cp -n www/app/example.config.js www/app/config.js

.PHONY: install build setup-config
