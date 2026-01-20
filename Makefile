PROJECT_FILES := $(wildcard projectfiles/*.json)

.PHONY: check
check: fix
	@git diff --exit-code

.PHONY: fix
fix:
	@for f in $(PROJECT_FILES); do jq . "$$f" | sponge "$$f"; done