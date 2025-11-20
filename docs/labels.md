# Label Schema

This project uses the **Mechanical Color** label schema for organizing issues and pull requests. Labels are categorized into five dimensions:

## Label Categories

### Type (Required)

Identifies the nature of the work:

- **T-Feat** - New feature or capability
- **T-Fix** - Bug fix
- **T-Refactor** - Code improvement without behavior change
- **T-Chore** - Maintenance task (dependencies, tooling, configuration)
- **T-Docs** - Documentation update

### Status (Required)

Tracks progress through the workflow:

- **S-Todo** - Not started
- **S-Doing** - In progress
- **S-Review** - Ready for review
- **S-Done** - Completed

### Priority (Required)

Indicates urgency and importance:

- **P-0** - Critical priority (blocks release, security issues)
- **P-1** - High priority (needed soon)
- **P-2** - Medium priority (planned work)
- **P-3** - Low priority (nice to have)

### Area (Optional)

Identifies the part of the codebase affected:

- **A-Tooling** - Ruff, pytest, mypy, nox
- **A-Dependencies** - Package management
- **A-Docker** - Containers, DevContainer
- **A-Testing** - Test infrastructure

### Effort (Optional)

Estimates work required:

- **E-S** - Small effort (< 1 day)
- **E-M** - Medium effort (1-3 days)
- **E-L** - Large effort (3-5 days)
- **E-XL** - Extra large effort (> 5 days)

## Usage Guidelines

### Creating Issues

Every issue should have at minimum:
1. One **Type** label
2. One **Status** label (typically S-Todo)
3. One **Priority** label

Add **Area** and **Effort** labels when known.

**Example:** A new feature for Docker configuration that's high priority and medium effort:
```
T-Feat | S-Doing | P-1 | A-Docker | E-M
```

### Updating Status

As work progresses, update the status label:
- Starting work: Change S-Todo to S-Doing
- Ready for review: Change S-Doing to S-Review
- Merged/completed: Change S-Review to S-Done

### Pull Requests

PRs inherit labels from their related issues. Add the same Type, Area, and Priority labels to maintain consistency.

## Managing Labels

Labels are defined in `.github/labels.yml`. Use the GitHub CLI to create labels:

```bash
gh label create "T-Feat" --color "0E8A16" --description "New feature or capability" -f
gh label create "T-Fix" --color "D73A4A" --description "Bug fix" -f
# ... continue for all labels in .github/labels.yml
```

Or use the GitHub web interface to manually create labels based on the schema defined in `.github/labels.yml`.

## Visual Board Organization

Labels are designed for visual project boards:
- **Types** use distinct prefixes for quick scanning
- **Status** uses color progression
- **Priority** uses traffic light colors (red to green)
- **Areas** all use A- prefix for visual consistency
- **Effort** all use E- prefix for visual consistency

This makes it easy to filter and organize issues on GitHub Projects boards.
