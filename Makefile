.PHONY: help install lint format test check clean

# Show available commands
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# Install dependencies using UV
install: ## Install project dependencies
	uv sync --group dev

# Run linting checks
lint: ## Run linting and static analysis
	uv run ruff check .


# Format code with ruff
format: ## Format code and fix linting issues
	uv run ruff format .
	uv run ruff check --fix .

# Run test suite
test: ## Run pytest test suite
	uv run pytest -v

# Run all quality gates
check: ## Run linting and tests
	$(MAKE) lint
	$(MAKE) test

# Clean build artifacts and cache files
clean: ## Remove build artifacts and cache files
	find . -type d -name __pycache__ -delete
	find . -type f -name "*.pyc" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	rm -rf build/
	rm -rf dist/
	rm -rf .pytest_cache/
	rm -rf .ruff_cache/
