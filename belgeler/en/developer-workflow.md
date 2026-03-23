# Developer Workflow

This document describes how to contribute to the project. All changes go through PRs, all tests must pass, and the release process is fully automated.

## Overview

```mermaid
graph LR
    A[Idea] --> B[Fork]
    B --> C[Branch]
    C --> D[Develop]
    D --> E[Test]
    E --> F[Open PR]
    F --> G[CI Checks]
    G --> H{Tests Pass?}
    H -->|No| D
    H -->|Yes| I[Merge]
    I --> J[Auto Release]
```

**No changes can be pushed directly to main.** Everything goes through pull requests.

---

## PR Lifecycle

```mermaid
graph TD
    A[PR Opened] --> B[Automated Checks Start]
    B --> C[CI Tests]
    B --> D[PR Title Check]
    B --> E[Conventional Commit Validation]
    C --> F{All Green?}
    D --> F
    E --> F
    F -->|No| G[Developer Fixes]
    G --> B
    F -->|Yes| H[Ready to Merge]
    H --> I[Maintainer Merges]
    I --> J[release-please Analyzes]
    J --> K{feat or fix commits?}
    K -->|Yes| L[Creates Release PR]
    K -->|No| M[Waiting]
    L --> N[Release PR Merged]
    N --> O[Auto Release Published]
    O --> P[v1 Tag Updated]
```

---

## CI Pipeline

Every PR triggers 4 test jobs:

```mermaid
graph TD
    A[PR / Push] --> B[test]
    A --> C[test-precommit]
    A --> D["test-action (Linux)"]
    A --> E["test-action (macOS)"]

    B --> B1[clean.md → 0 errors]
    B --> B2[dirty.md → errors found]

    C --> C1[Hook script test]
    C --> C2[Pre-commit framework test]

    D --> D1[Action works on Linux]
    E --> E1[Action works on macOS]

    B1 --> F{All Passed?}
    B2 --> F
    C1 --> F
    C2 --> F
    D1 --> F
    E1 --> F

    F -->|Yes| G[PR Can Be Merged]
    F -->|No| H[PR Blocked]
```

---

## Release Pipeline

```mermaid
graph TD
    A[Merge to Main] --> B[release-please Runs]
    B --> C[Analyze Commit Messages]
    C --> D{Release Needed?}
    D -->|No| E[Wait]
    D -->|Yes| F[Create Release PR]
    F --> G[Update CHANGELOG]
    F --> H[Update library.json Version]
    J[Release PR Merged] --> K[Create Git Tag]
    K --> L[Publish GitHub Release]
    L --> M[Upload Turkish.zip + library.json]
    M --> N[Update v1 Floating Tag]
    N --> O[Users Get Latest Version]
```

---

## Version Determination

Automatically determined from commit messages:

```mermaid
graph TD
    A[Commit Message] --> B{Prefix?}
    B -->|"feat:"| C["Minor Bump (1.2.0 → 1.3.0)"]
    B -->|"fix:"| D["Patch Bump (1.2.0 → 1.2.1)"]
    B -->|"feat!:"| E["Major Bump (1.2.0 → 2.0.0)"]
    B -->|"docs: / chore: / ci:"| F[No Release]
```

### Conventional Commits (Required)

| Prefix | Meaning | Release Effect |
|--------|---------|----------------|
| `feat:` | New feature | Minor version |
| `fix:` | Bug fix | Patch version |
| `docs:` | Documentation | No release |
| `chore:` | Maintenance | No release |
| `refactor:` | Code improvement | No release |
| `test:` | Test changes | No release |
| `ci:` | CI/CD changes | No release |
| `feat!:` | Breaking change | Major version |

### Prefix Selection Rule (CRITICAL)

> **Adding data to an existing rule (words, terms, swap entries) is NOT a new feature.**

This distinction directly affects version numbers. Wrong prefix = unnecessary version bump.

| Change | Correct prefix | Why |
|---|---|---|
| New `.yml` rule file | `feat:` | New mechanism added |
| New mechanism / feature | `feat:` | Project scope expands |
| Adding words/terms to existing rule | `fix:` | Data added to existing mechanism |
| Adding terms to accept.txt | `fix:` | Existing dictionary expanded |
| Fixing false positives | `fix:` | Bug fix |
| Rule removal / rename | `feat!:` | Breaking change |

---

## Safety Layers

6 layers of protection ensure users never see a broken release:

```mermaid
graph TD
    A[Developer Writes Code] --> B["1. Branch Protection<br/>Direct push forbidden"]
    B --> C["2. PR Required<br/>Every change is reviewed"]
    C --> D["3. Conventional Commits<br/>PR title format enforced"]
    D --> E["4. CI Tests<br/>4 jobs, 2 platforms, all green"]
    E --> F["5. release-please<br/>Auto version + CHANGELOG"]
    F --> G["6. Auto Release<br/>No human intervention"]
    G --> H["Users Are Safe"]
```

---

## Quick Reference

```bash
# 1. Fork and clone
git clone https://github.com/YOUR_USERNAME/Turkce-yazim-denetimi.git
cd Turkce-yazim-denetimi

# 2. Create branch
git checkout -b feat/new-feature

# 3. Develop and test
vale --config=.vale.ini fixtures/clean.md   # 0 errors
vale --config=.vale.ini fixtures/dirty.md   # errors must be found

# 4. Commit (conventional format)
git commit -m "feat: add new rule"

# 5. Push and open PR
git push origin feat/new-feature
# Create PR on GitHub
```
