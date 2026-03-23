# Contributing

## Fork Workflow

1. **Fork** [Denomas/Turkce-yazim-denetimi](https://github.com/Denomas/Turkce-yazim-denetimi) on GitHub
2. **Clone** your fork: `git clone https://github.com/YOUR_USERNAME/Turkce-yazim-denetimi.git`
3. **Add upstream**: `git remote add upstream https://github.com/Denomas/Turkce-yazim-denetimi.git`
4. **Create branch**: `git checkout -b feature/new-rule`
5. **Develop and test** (see below)
6. **Push and create PR**: `git push origin feature/new-rule`

## Adding a New Rule

Create a YAML file in `styles/Turkish/` (PascalCase naming):

```yaml
extends: substitution
message: "🇹🇷 Türkçemizi koruyalım: '%s' kullanın ('%s' yerine)"
level: error
ignorecase: true
swap:
  wrong_word: correct_word
```

## Testing (Mandatory)

Every change must pass both tests:

```bash
# Clean file: must produce 0 errors
vale --config=.vale.ini fixtures/clean.md

# Dirty file: must catch errors
vale --config=.vale.ini fixtures/dirty.md
```

!!! warning
    Never submit code without testing. Both `clean.md` and `dirty.md` must be verified.

## Commit Message Convention (Required)

This project uses [Conventional Commits](https://www.conventionalcommits.org/). The commit prefix **directly affects version numbers**. Using the wrong prefix causes unnecessary version bumps.

### Key Rule

> **Adding data to an existing rule (words, terms, swap entries) is NOT a new feature.**
> `feat:` is only for new mechanisms or rule files.

### Prefix Guide

| Change | Prefix | Version effect | Example |
|---|---|---|---|
| New rule file (`.yml`) | `feat:` | Minor (1.3.0 → 1.4.0) | New `Fabrika.yml` rule |
| New mechanism / feature | `feat:` | Minor | Adding Spelling rule |
| Adding words/terms to existing rule | `fix:` | Patch (1.3.0 → 1.3.1) | New swap entries in Plaza.yml |
| Adding terms to accept.txt | `fix:` | Patch | Product name additions |
| Fixing false positives | `fix:` | Patch | Rule correction |
| Breaking change (rule removal etc.) | `feat!:` | Major (1.0.0 → 2.0.0) | Rule rename |
| Documentation | `docs:` | No release | README update |
| CI/CD | `ci:` | No release | Workflow change |
| Maintenance | `chore:` | No release | Dependency update |
| Code improvement | `refactor:` | No release | Regex optimization |
| Test changes | `test:` | No release | Fixture update |

### Examples

```bash
# ✅ CORRECT: Adding words to existing rule
git commit -m "fix(plaza): Katman 1 teknik terimlerinin Türkçe karşılıkları eklendi"

# ❌ WRONG: Adding words is NOT a feat!
git commit -m "feat(plaza): yeni teknik terimler eklendi"

# ✅ CORRECT: New rule file = new feature
git commit -m "feat(rules): Fabrika jargonu kuralı eklendi"
```

## Core Principles

1. **Add, never delete** — Only fix incorrect rules; never remove data
2. **All Turkish** — File names, descriptions, commit messages in Turkish
3. **Friendly messages** — Use emojis, be helpful, never scold

## Development Requirements

- [Vale](https://vale.sh)
- [Git](https://git-scm.com/)
- [Pre-commit](https://pre-commit.com/) (optional)
