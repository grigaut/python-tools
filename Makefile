.ONESHELL:
	SHELL:=/bin/bash

ENVIRONMENT_FILEPATH := environment.yml
VENV := ./.venv
POETRY := $(VENV)/bin/poetry
PYTHON := $(VENV)/bin/python3.11
MKDOCS := $(VENV)/bin/mkdocs
PRECOMMIT := $(VENV)/bin/pre-commit
HOOKS := ./.git/hooks

default:
	@echo "Call a specific subcommand: create-env,install,update,documentation"

all:
	$(MAKE) -s copy-default-config
	$(MAKE) -s install

clean:
	rm -r -f $(VENV)
	rm -r -f $(HOOKS)

.PHONY: install-with-hooks
install-with-hooks:
	$(MAKE) -s copy-default-config
	$(MAKE) -s install
	$(MAKE) -s pre-commit


$(VENV): $(CONDA_EXE) $(ENVIRONMENT_FILEPATH)
	@$(MAKE) -s clean
	$(CONDA_EXE) env create -q --file $(ENVIRONMENT_FILEPATH) --prefix $(VENV)

.PHONY: clean-dirs
clean-dirs:
	$(foreach dir, $(OUTPUT_DIRS), rm -r -f $(dir))

.PHONY: create-env
create-env:
	@$(MAKE) -s $(VENV)

.PHONY: install
install: poetry.lock
	@$(MAKE) -s $(VENV)
	$(POETRY) install

.PHONY: view-docs
view-docs:
	@$(MAKE) -s $(VENV)
	$(POETRY) install --only docs
	$(MKDOCS) serve

./site:
	@$(MAKE) -s $(VENV)
	$(POETRY) install --only docs
	$(MKDOCS) build

.PHONY: build-docs
build-docs:
	@$(MAKE) -s ./site

.PHONY: deploy-docs
deploy-docs:
	$(POETRY) install --only docs
	$(MKDOCS) gh-deploy
	rm -r -f ./site
	
.PHONY: pre-commit
pre-commit: $(PRECOMMIT)
	$(PRECOMMIT) install
