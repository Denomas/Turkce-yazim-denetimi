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

## Core Principles

1. **Add, never delete** — Only fix incorrect rules; never remove data
2. **All Turkish** — File names, descriptions, commit messages in Turkish
3. **Friendly messages** — Use emojis, be helpful, never scold

## Development Requirements

- [Vale](https://vale.sh)
- [Git](https://git-scm.com/)
- [Pre-commit](https://pre-commit.com/) (optional)
