BIN_DIR ?= node_modules/.bin

.PHONY: test

bootstrap:
	@echo "+ $@"
	yarn install

clean:
	@echo "+ $@"
	rm -rf node_modules
	rm -rf build

build:
	@echo "+ $@"
	@$(BIN_DIR)/tsc

build-watch:
	@echo "+ $@"
	@$(BIN_DIR)/tsc --watch

test: build
	@echo "+ $@"
	@$(BIN_DIR)/ava "build/**/*.spec.js"

test-watch:
	@echo "+ $@"
	@echo "+ make sure to also run build-watch"
	@$(BIN_DIR)/ava

fmt:
	@echo "+ $@"
	@$(BIN_DIR)/prettier \
		--print-width 100 \
		--tab-width 4 \
		--single-quote \
		--no-semi \
		--write \
		"{src,__tests__}/**/*.ts"

lint: fmt
	@echo "+ $@"
	@$(BIN_DIR)/tslint --config tslint.json \
		--exclude "node_modules" \
		--project tsconfig.json \
		--format codeFrame \
		--type-check "src/**"
