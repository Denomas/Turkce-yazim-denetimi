# Vale Turkish — Turkish Spelling & Grammar Checker

A comprehensive Vale style package for Turkish language with **16 rules** covering spelling, grammar, plaza language, academic style, technical terms, idioms, and readability. Built by [Denomas](https://denomas.com).

## Why Vale Turkish?

If your project has Turkish documentation, translated content, or AI-generated Turkish text, Vale Turkish catches common mistakes automatically:

- **Spelling errors**: `birşey` → `bir şey` (joined/separate writing rules)
- **Corporate jargon**: `deadline` → `son teslim tarihi` (plaza language cleanup)
- **Technical terms**: `Nextjs` → `Next.js` (standard capitalization)
- **Long sentences**: Warns when sentences exceed 30 words
- **Hunspell dictionary**: 36 MB Turkish dictionary with verb conjugation filters

## Quick Start

### Pre-commit

```yaml
repos:
  - repo: https://github.com/Denomas/Turkce-yazim-denetimi
    rev: v1
    hooks:
      - id: Turkce-yazim-denetimi
        files: ^docs/tr/  # Only check Turkish files
```

### GitHub Actions

```yaml
- uses: Denomas/Turkce-yazim-denetimi@v1
  with:
    files: 'docs/tr/'
    min_alert_level: 'warning'
    no_spelling: 'true'
```

### GitLab CI

```yaml
include:
  - remote: 'https://raw.githubusercontent.com/Denomas/Turkce-yazim-denetimi/v1/.gitlab/Turkce-yazim-denetimi.yml'

Turkce-yazim-denetimi:
  extends: .Turkce-yazim-denetimi
  variables:
    VALE_FILES: "docs/tr/"
```

## Supported File Formats

Markdown, reStructuredText, AsciiDoc, HTML, plain text, and Org Mode.

## Links

- [GitHub Repository](https://github.com/Denomas/Turkce-yazim-denetimi)
- [Live Example (GitHub)](https://github.com/Denomas/Turkce-yazim-denetimi-ornek)
- [Vale Documentation](https://vale.sh/docs/)
