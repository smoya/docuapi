

#
# Makefile to perform rebuilds after changes to asset files.
#
# n.b. you must install fswatch (OS X: `brew install fswatch`)
#
# To start live live rebuilds, use the following command:
# $ make serve
#

# TODO: Figure a way to watch recursive
WATCH_PATHS = ./assets/*.* ./assets/javascripts/*.* ./assets/javascripts/app/*.*
SLATE_DIR := /Users/bep/dev/clone/slate

build:
	go run bundler.go -slate=${SLATE_DIR}

serve:
	@make build 
	@fswatch -o ${WATCH_PATHS} | xargs -n1 -I{} make build

