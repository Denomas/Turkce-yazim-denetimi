# GitHub Actions Entegrasyonu

PR'larda ve push'larda otomatik Türkçe yazım denetimi.

## Temel Kullanım

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

## Girdiler

| Girdi | Varsayılan | Açıklama |
|-------|-----------|----------|
| `files` | `.` | Denetlenecek dosyalar veya dizin |
| `min_alert_level` | `suggestion` | Minimum uyarı seviyesi: `suggestion`, `warning`, `error` |
| `vale_version` | `3.9.0` | Kurulacak Vale sürümü |
| `reporter` | `CLI` | Çıktı formatı: `CLI`, `JSON`, `line` |
| `no_spelling` | `false` | `true` ile yazım denetimini devre dışı bırakır |

## Sadece Türkçe Belgeleri Denetleme

```yaml
- uses: Denomas/Turkce-yazim-denetimi@v1
  with:
    files: 'docs/tr/'
    min_alert_level: 'warning'
    no_spelling: 'true'
```

## Görsel Raporlama

`jq` kurulu ise (Ubuntu runner'larda varsayılan olarak mevcuttur), GitHub Step Summary'de görsel rapor oluşturulur ve PR diff'inde inline annotation'lar gösterilir.

## Canlı Örnek

[Denomas/Turkce-yazim-denetimi-ornek](https://github.com/Denomas/Turkce-yazim-denetimi-ornek) reposunda çalışan bir GitHub Actions örneği görebilirsiniz.
