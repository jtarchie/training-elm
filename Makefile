all: build
clean:
	rm -Rf docs/

fast: clean
	elm make --warn --output docs/main-large.js --yes src/Main.elm
	elm-format-0.18 --yes src/
	cp main.css docs/main-large.css
	erb extension=large index.html.erb > docs/index.html

ts := $(shell /bin/date "+%Y%m%d%H%M%S")
build: clean
	elm make --warn --output docs/main-$(ts).js --yes src/Main.elm
	elm-format-0.18 --yes src/
	closure-compiler --compilation_level SIMPLE_OPTIMIZATIONS --js docs/main-$(ts).js --js_output_file docs/main-$(ts).min.js
	scss -t compressed main.css docs/main-$(ts).min.css
	erb extension=$(ts).min index.html.erb > docs/index.html

.PHONY: clean
