# Getting Started

## Installation

### Option 1: Pre-commit (Recommended)

No system dependencies needed — Vale is downloaded automatically on first run.

```bash
pip install pre-commit
```

Add to `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: https://github.com/Denomas/Turkce-yazim-denetimi
    rev: v1
    hooks:
      - id: Turkce-yazim-denetimi
        files: ^docs/tr/  # Only check Turkish files
        args: [--minAlertLevel=warning]
```

```bash
pre-commit install
```

### Option 2: GitHub Actions

Create `.github/workflows/vale.yml`:

```yaml
name: Turkish Spelling Check

on: [push, pull_request]

jobs:
  turkish-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: Denomas/Turkce-yazim-denetimi@v1
        with:
          files: 'docs/tr/'
          min_alert_level: 'warning'
          no_spelling: 'true'
```

### Option 3: GitLab CI

```yaml
include:
  - remote: 'https://raw.githubusercontent.com/Denomas/Turkce-yazim-denetimi/v1/.gitlab/Turkce-yazim-denetimi.yml'

turkish-check:
  extends: .Turkce-yazim-denetimi
  variables:
    VALE_FILES: "docs/tr/"
    MIN_ALERT_LEVEL: "warning"
```

## Platform Support

| Platform | Architecture | Auto-download |
|----------|-------------|---------------|
| macOS | Intel (x86_64) | ✅ |
| macOS | Apple Silicon (arm64) | ✅ |
| Linux | x86_64 | ✅ |
| Linux | ARM64 | ✅ |
| Windows | x86_64 | ✅ |

## First Test

Create a test file with intentional errors:

```bash
echo "birşey yazmak istiyorum" > test.tr.md
git add test.tr.md && git commit -m "test"
```

Expected output:

```
 test.tr.md
 1:1  error  📝 'bir şey' kullanın ('birşey' yerine)  Turkish.BitisikYazim
```
