# Usage Guide

## Filtering Files

Only check Turkish files in your project:

```yaml
# Pre-commit: regex pattern
- id: Turkce-yazim-denetimi
  files: ^docs/tr/

# GitHub Actions: path input
- uses: Denomas/Turkce-yazim-denetimi@v1
  with:
    files: 'docs/tr/'

# GitLab CI: variable
  variables:
    VALE_FILES: "docs/tr/"
```

## Alert Levels

| Level | Meaning | Use Case |
|-------|---------|----------|
| `suggestion` | Style improvements | Full analysis (default) |
| `warning` | Should be addressed | Daily use |
| `error` | Definite mistakes | CI/CD gate |

## Disabling Rules

### Project-wide in `.vale.ini`:

```ini
[*.md]
BasedOnStyles = Turkish
Turkish.Spelling = NO
Turkish.Plaza = NO
```

### Inline in files:

```markdown
<!-- vale Turkish.Plaza = NO -->
This section allows English terms.
<!-- vale Turkish.Plaza = YES -->
```

## GitHub Actions Inputs

| Input | Default | Description |
|-------|---------|-------------|
| `files` | `.` | Files or directory to check |
| `min_alert_level` | `suggestion` | Minimum alert level |
| `vale_version` | `3.14.1` | Vale version to install |
| `reporter` | `CLI` | Output format |
| `no_spelling` | `false` | Disable Hunspell spelling |

## GitLab CI Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `VALE_FILES` | `.` | Files or directory |
| `MIN_ALERT_LEVEL` | `suggestion` | Minimum alert level |
| `VALE_VERSION` | `3.14.1` | Vale version |
| `VALE_TURKISH_NO_SPELLING` | `0` | Set `1` to disable spelling |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `VALE_VERSION` | Vale version to download |
| `VALE_TURKISH_NO_SPELLING` | Set to `1` to disable Hunspell |
| `VALE_CONFIG_PATH` | Path to Vale config file |
