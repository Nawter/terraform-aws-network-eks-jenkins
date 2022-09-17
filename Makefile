BLACK ?= \033[0;30m
RED ?= \033[0;31m
GREEN ?= \033[0;32m
YELLOW ?= \033[0;33m
BLUE ?= \033[0;34m
PURPLE ?= \033[0;35m
CYAN ?= \033[0;36m
GRAY ?= \033[0;37m
COFF ?= \033[0m

# Mark non-file targets as PHONY
.PHONY: all help lint check plan
.EXPORT_ALL_VARIABLES:
.DEFAULT: help

all: help
help: ## Display help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-30s$(COFF) %s\n", $$1, $$2}'

lint:  ## Lint the code using terraform fmt
	terraform fmt -recursive

check:  ## Check and validate the terraform code
	terraform fmt -recursive -diff -check -list=true
	terraform validate

plan:  ## Plan a terraform run (speculative when using TF cloud backend)
	terraform plan

deploy:  ## Deploy a terraform plan (speculative when using TF cloud backend)
	terraform apply 

destroy:  ## Destroy a terraform plan(speculative when using TF cloud backend)
	terraform destroy

