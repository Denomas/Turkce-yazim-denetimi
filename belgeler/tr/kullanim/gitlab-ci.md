# GitLab CI Entegrasyonu

GitLab CI/CD pipeline'ınızda otomatik Türkçe yazım denetimi.

## En Kolay Yol: Remote Include

```yaml
include:
  - remote: 'https://raw.githubusercontent.com/Denomas/Turkce-yazim-denetimi/v1/.gitlab/Turkce-yazim-denetimi.yml'

Turkce-yazim-denetimi:
  extends: .Turkce-yazim-denetimi
  variables:
    VALE_FILES: "docs/tr/"
    MIN_ALERT_LEVEL: "warning"
    VALE_TURKISH_NO_SPELLING: "1"
```

Bu şablon hem Docker hem de shell executor ile uyumludur.

## Değişkenler

| Değişken | Varsayılan | Açıklama |
|----------|-----------|----------|
| `VALE_FILES` | `.` | Denetlenecek dosyalar veya dizin |
| `MIN_ALERT_LEVEL` | `suggestion` | Minimum uyarı seviyesi |
| `VALE_VERSION` | `3.14.1` | Vale sürümü |
| `VALE_TURKISH_VERSION` | `v1.1.0` | Türkçe Yazım Denetimi sürümü |
| `VALE_TURKISH_NO_SPELLING` | `0` | `1` ile yazım denetimini devre dışı bırakır |

## JUnit ve CodeClimate Raporları

Şablon otomatik olarak şu raporları üretir (jq kurulu ise):

- **JUnit XML** — GitLab Tests sekmesinde görünür
- **CodeClimate JSON** — GitLab Code Quality sekmesinde görünür

## Canlı Örnek

[denomas/Turkce-yazim-denetimi-ornek](https://code.denomas.com/denomas/Turkce-yazim-denetimi-ornek) reposunda çalışan bir GitLab CI örneği görebilirsiniz.
