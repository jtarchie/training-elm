all: build
clean:
	rm -Rf docs/

ts := $(shell /bin/date "+%Y%m%d%H%M%S")
build: clean
	elm make --warn --output docs/main-$(ts).js --yes src/Main.elm
	closure-compiler --compilation_level SIMPLE_OPTIMIZATIONS --js docs/main-$(ts).js --js_output_file docs/main-$(ts).min.js
	scss -t compressed main.css docs/main-$(ts).css
	erb timestamp=$(ts) index.html.erb > docs/index.html

.PHONY: clean
