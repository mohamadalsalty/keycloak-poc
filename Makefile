# Define the default target
.DEFAULT_GOAL := help

# Define variables
DOCKER_COMPOSE := docker-compose

# Define targets
.PHONY: help
help: ## Display this help message
	@echo "Usage: make [target]"
	@echo "Targets:"
	@awk '/^[a-zA-Z_-]+:.*?## .*$$/ { \
		printf "  %-20s %s\n", $$1, $$3 \
	}' $(MAKEFILE_LIST) | sort

.PHONY: up
up: ## Start the Docker Compose services
	$(DOCKER_COMPOSE) up -d

.PHONY: down
down: ## Stop the Docker Compose services
	$(DOCKER_COMPOSE) down

.PHONY: logs
logs: ## Show logs of Docker Compose services
	$(DOCKER_COMPOSE) logs -f
