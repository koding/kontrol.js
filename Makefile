all: bluebird-shim build browserify build-promises browserify-promises uglify uglify-promises dev

dev: browserify-dev browserify-promises-dev

bluebird-shim:
	tar -zxvf ./bluebird-shim.tgz

build:
	node_modules/.bin/coffee -b -o ./lib/kontrol -c ./src/kontrol/*.coffee
	find ./lib/kontrol/*.js -type f -exec sed -i "" -e 's/\.coffee/\.js/g' {} \;

build-promises:
	node_modules/.bin/coffee -b -o ./lib/kontrol-as-promised -c ./src/kontrol-as-promised/*.coffee
	find ./lib/kontrol-as-promised/*.js -type f -exec sed -i "" -e 's/\.coffee/\.js/g' {} \;

browserify:
	node_modules/.bin/browserify -s Kontrol -x bluebird -t coffeeify src/kontrol/kontrol.coffee > bundle.js

browserify-promises:
	node_modules/.bin/browserify -s Kontrol -x bluebird -t coffeeify src/kontrol-as-promised/kontrol.coffee > bundle-promises.js

browserify-dev:
	node_modules/.bin/browserify -s Kontrol -d -x bluebird -t coffeeify src/kontrol/kontrol.coffee > bundle-dev.js

browserify-promises-dev:
	node_modules/.bin/browserify -s Kontrol  -d -x bluebird -t coffeeify src/kontrol-as-promised/kontrol.coffee > bundle-promises-dev.js

uglify:
	node_modules/.bin/uglifyjs bundle.js -c -m -o bundle.min.js 2>/dev/null

uglify-promises:
	node_modules/.bin/uglifyjs bundle-promises.js -c -m -o bundle-promises.min.js 2>/dev/null
