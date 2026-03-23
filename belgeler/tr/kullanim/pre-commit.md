# Pre-commit Entegrasyonu

Her commit'te otomatik Türkçe yazım denetimi.

## Temel Yapılandırma

```yaml
repos:
  - repo: https://github.com/Denomas/Turkce-yazim-denetimi
    rev: v1
    hooks:
      - id: Turkce-yazim-denetimi
```

## Sadece Belirli Dosyaları Denetleme

```yaml
# Yalnızca docs/tr/ altındaki dosyalar
- id: Turkce-yazim-denetimi
  files: ^docs/tr/

# Birden fazla dizin veya .tr.md uzantılı dosyalar
- id: Turkce-yazim-denetimi
  files: (^docs/tr/|^content/turkce/|\.tr\.md$)
```

## Uyarı Seviyesini Ayarlama

```yaml
# Sadece hataları göster (CI/CD için ideal)
- id: Turkce-yazim-denetimi
  args: [--minAlertLevel=error]

# Uyarıları da göster
- id: Turkce-yazim-denetimi
  args: [--minAlertLevel=warning]
```

## Yazım Denetimini Kapatma

Hunspell sözlük denetimini kapatmak için:

```yaml
- id: Turkce-yazim-denetimi
  args: [--minAlertLevel=warning]
  env:
    VALE_TURKISH_NO_SPELLING: "1"
```

Veya ortam değişkeni ile:

```bash
VALE_TURKISH_NO_SPELLING=1 pre-commit run Turkce-yazim-denetimi --all-files
```

## Desteklenen Dosya Tipleri

Pre-commit hook'u şu dosya tiplerini otomatik tanır:

- Markdown (`.md`)
- reStructuredText (`.rst`)
- AsciiDoc (`.adoc`)
- HTML (`.html`)
- Düz metin (`.txt`)
