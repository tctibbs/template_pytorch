# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a PyTorch project template using uv for dependency management and hatchling for building. It provides a streamlined starting point for PyTorch projects with linting, testing, and pre-commit hooks pre-configured.

## Development Commands

All commands use uv and are available via Makefile:

```bash
make install    # Install dependencies (uv sync --group dev)
make lint       # Run Ruff linting
make format     # Format code and fix issues
make test       # Run pytest
make check      # Run lint + test
make clean      # Remove build artifacts
```

### Direct Commands

```bash
uv run ruff check .              # Lint
uv run ruff format .             # Format
uv run pytest -v                 # Run tests
uv run pytest tests/test_file.py::test_name -v  # Single test
```

## Project Structure

```
src/pytorch_template/   # Main package source code
tests/                  # Test files
tools/docker/           # Dockerfile for DevContainer
.devcontainer/          # VSCode DevContainer configuration
.github/workflows/      # CI workflow
docs/                   # Documentation
```

## Code Standards

- **Line length**: 88 characters
- **Indentation**: 4 spaces
- **Type annotations**: Required for public APIs
- **Docstrings**: Google-style (enforced by pydocstyle)
- **Import sorting**: Automatic with Ruff isort

### Ruff Rules

Extended rule set including: E, F, W, I, N, D, BLE, B, A, ICN, Q, PD, ANN, UP, C4, SIM, PT, PTH, PIE, ISC, TID, RUF

## Pre-commit Hooks

Install with `uv run pre-commit install`. Runs Ruff linting/formatting and general code quality checks on each commit.

## DevContainer

Uses Python 3.12 with uv pre-installed. Runs as non-root user `developer`.
