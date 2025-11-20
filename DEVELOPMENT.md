# Development Guide

This document provides detailed setup instructions and development guidelines for contributors and developers working on this project.

## Prerequisites

- **Python 3.11+** - Required for modern Python features
- **uv** - Fast Python package installer and resolver ([install guide](https://docs.astral.sh/uv/getting-started/installation/))
- **Git** - Version control system
- **Make** - Build automation tool (usually pre-installed on macOS/Linux)

## Development Setup

### 1. Clone and Navigate
```bash
git clone <repository-url>
cd template_pytorch
```

### 2. Install Dependencies
```bash
make install
```
This command runs `uv sync --group dev` to install all dependencies including development tools.

### 3. Install Pre-commit Hooks (Optional but Recommended)
```bash
uv run pre-commit install
```
This ensures code quality checks run automatically before each commit.

## Development Workflow

### Available Make Commands

| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make install` | Install project dependencies |
| `make lint` | Run linting and static analysis |
| `make format` | Format code and fix linting issues |
| `make test` | Run the test suite |
| `make clean` | Remove build artifacts and cache files |

### Code Quality Tools

- **Ruff** - Fast Python linter, formatter, and static analysis toolkit
- **Pytest** - Testing framework

### Pre-commit Hooks

The following checks run automatically on commit:
- Code formatting with Ruff
- Linting with Ruff
- Trailing whitespace removal
- End-of-file fixing
- YAML validation
- Large file detection
- Merge conflict detection
- Debug statement detection

## Project Structure

```
template_pytorch/
├── src/                    # Source code (main package)
├── tests/                  # Test files
├── .devcontainer/          # DevContainer configuration
├── assets/                 # Project assets
├── tools/                  # Development scripts and utilities
├── pyproject.toml          # Project configuration and dependencies
├── uv.lock                 # Locked dependency versions
├── Makefile                # Development automation
├── .pre-commit-config.yaml # Pre-commit hook configuration
└── .gitignore              # Git ignore patterns
```

## Testing

Run the test suite:
```bash
make test
```

Run specific tests:
```bash
uv run pytest tests/test_specific.py
```

Run tests with coverage:
```bash
uv run pytest --cov=src
```

## Code Style Guidelines

- **Line length**: 88 characters (following Black's convention)
- **Import sorting**: Automatic with Ruff
- **Type hints**: Required for all public functions and methods
- **Docstrings**: Use Google-style docstrings for functions and classes
- **Naming**: Follow PEP 8 naming conventions

## Contributing

1. Create a feature branch from `main`
2. Make your changes following the code style guidelines
3. Run `make lint` and `make test` to ensure quality
4. Commit with conventional commit messages
5. Create a pull request

## Troubleshooting

### Common Issues

**Import errors after dependency changes:**
```bash
make clean
make install
```

**Pre-commit hooks failing:**
```bash
make format
git add .
git commit
```

**Lint errors:**
```bash
uv run ruff check .
```

---

For general project information and usage instructions, see [README.md](README.md).
