PATH := ./node_modules/.bin:$(PATH)

install: setup-config
	test -d plugins || mkdir plugins
	npm install
	bower install
	rm -rf www/components/requirejs/dist

setup-config:
	test -f www/app/config.js || cp -n www/app/example.config.js www/app/config.js

.PHONY: install build setup-config
