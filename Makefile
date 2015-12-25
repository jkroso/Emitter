serve: node_modules
	@$</.bin/serve -Slojp 0

test: node_modules
	@$</.bin/_hydro test/emitter.test.js \
		--formatter $</hydro-dot \
		--setup test/hydro.conf.js

node_modules: package.json
	@npm install

bench: node_modules
	@node bench/index.js

.PHONY: serve test bench
