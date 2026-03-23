# Kurulum

Türkçe Yazım Denetimi'ni projenize eklemenin üç yolu vardır. Size en uygun olanı seçin.

## Yol 1: Pre-commit ile (Önerilen)

En hızlı yol. Altyapıyı ayrıca kurmanıza gerek yoktur; ilk çalıştırmada otomatik olarak indirilir.

```bash
pip install pre-commit
```

Proje kök dizininize `.pre-commit-config.yaml` dosyası oluşturun:

```yaml
repos:
  - repo: https://github.com/Denomas/Turkce-yazim-denetimi
    rev: v1
    hooks:
      - id: Turkce-yazim-denetimi
```

Hook'u etkinleştirin:

```bash
pre-commit install
```

Artık her commit'te Türkçe belgeleriniz otomatik denetlenir.

## Yol 2: GitHub Actions ile

`.github/workflows/vale.yml` dosyası oluşturun:

```yaml
name: Türkçe Yazım Denetimi

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  Turkce-yazim-denetimi:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: Denomas/Turkce-yazim-denetimi@v1
        with:
          files: '.'
          min_alert_level: 'warning'
```

## Yol 3: GitLab CI ile

`.gitlab-ci.yml` dosyanıza ekleyin:

```yaml
include:
  - remote: 'https://raw.githubusercontent.com/Denomas/Turkce-yazim-denetimi/v1/.gitlab/Turkce-yazim-denetimi.yml'

Turkce-yazim-denetimi:
  extends: .Turkce-yazim-denetimi
  variables:
    VALE_FILES: "docs/"
    MIN_ALERT_LEVEL: "warning"
```

## Platform Desteği

| Platform | Mimari | Otomatik İndirme |
|----------|--------|-----------------|
| macOS | Intel (x86_64) | :material-check: |
| macOS | Apple Silicon (arm64) | :material-check: |
| Linux | x86_64 | :material-check: |
| Linux | ARM64 | :material-check: |
| Windows | x86_64 | :material-check: |

## Sonraki Adım

[:octicons-arrow-right-24: İlk Adımlar](ilk-adimlar.md) — İlk denetiminizi yapın.
