# Use Cases

Vale Turkish is not just for Turkish developers. Here are scenarios where international teams benefit from automated Turkish language checking.

## AI-Generated Content Quality Control

If you use Claude, GPT, or other AI models to generate Turkish documentation, Vale Turkish catches common AI mistakes:

```yaml
# Check AI-generated Turkish content before publishing
- uses: Denomas/Turkce-yazim-denetimi@v1
  with:
    files: 'docs/tr/'
    min_alert_level: 'warning'
```

AI models often produce plausible but incorrect Turkish — joined/separate writing errors, wrong conjunctions, and unnecessary English loanwords. Vale Turkish catches these automatically.

## Multilingual Projects

For projects with `docs/en/` and `docs/tr/` directories, run Vale Turkish only on Turkish files:

```yaml
- id: Turkce-yazim-denetimi
  files: ^docs/tr/
```

English files are untouched. Turkish files get full 16-rule analysis.

## Localization Teams

After translating content to Turkish, run Vale Turkish as a quality gate:

```yaml
# In your translation pipeline
Turkce-yazim-denetimi:
  extends: .Turkce-yazim-denetimi
  variables:
    VALE_FILES: "translations/tr/"
    MIN_ALERT_LEVEL: "error"
  only:
    changes:
      - translations/tr/**
```

## Open Source Projects

Automatically check Turkish PRs from contributors:

```yaml
name: Turkish Content Check
on:
  pull_request:
    paths: ['docs/tr/**', '*.tr.md']
jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: Denomas/Turkce-yazim-denetimi@v1
        with:
          files: 'docs/tr/'
          min_alert_level: 'warning'
```

## Turkish Language Learners

Students or learners writing Turkish can use Vale Turkish to get instant feedback on their writing. Install locally and check files:

```bash
vale --config=.vale.ini my-essay.md
```

## Corporate Documentation Standards

Enforce consistent Turkish writing across your organization by adding Vale Turkish to your CI pipeline. The Plaza rule alone eliminates unnecessary English jargon from business documents.

---

*Built by [Denomas](https://denomas.com) — protecting Turkish in the digital world.*
