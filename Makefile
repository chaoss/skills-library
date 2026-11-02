SKILLSAW_VERSION := 0.22.0

.PHONY: lint lint-fix badge
lint: badge
	uvx skillsaw==$(SKILLSAW_VERSION) --strict

lint-fix:
	uvx skillsaw==$(SKILLSAW_VERSION) fix

badge:
	uvx skillsaw==$(SKILLSAW_VERSION) badge
