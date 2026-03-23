---
name: vale-turkish-dev
description: Vale Turkish projesinde yeni Türkçe yazım kuralı ekleme, test etme ve geliştirme. Kural oluşturma, fixtures test etme, conventional commits formatında Türkçe commit mesajları yazma.
---

# Vale Turkish Geliştirici Rehberi

Bu proje, Vale prose linter için Türkçe yazım/dilbilgisi kuralları içerir.

## Başlamadan Önce

1. **AGENTS.md** dosyasını oku — proje felsefesi ve zorunlu kurallar orada.
2. **Ana ilke:** Sadece ekleyerek zenginleştiriyoruz. Hatalı olanı düzeltmek dışında hiçbir veriyi silmiyoruz.
3. **Test zorunluluğu:** Asla test etmeden commit atma.

## Geliştirme Döngüsü

Her değişiklik şu adımları takip etmelidir:

```bash
# 1. Ön kontrol — mevcut durumu gör
vale --config=.vale.ini fixtures/clean.md   # 0 hata olmalı
vale --config=.vale.ini fixtures/dirty.md   # Hatalar bulunmalı

# 2. Değişikliğini yap (kural ekle, düzelt vb.)

# 3. Doğrulama — yeni kuralın çalıştığını kanıtla
vale --config=.vale.ini fixtures/dirty.md   # Yeni hataları yakalamalı

# 4. Sıfır hata — yan etki yaratmadığını doğrula
vale --config=.vale.ini fixtures/clean.md   # Hâlâ 0 hata olmalı
```

## Yeni Kural Ekleme

Dosya: `styles/Turkish/KuralAdi.yml` (PascalCase)

### substitution kuralı (kelime değiştirme)

```yaml
extends: substitution
message: "🇹🇷 Türkçemizi koruyalım: '%s' kullanın ('%s' yerine)"
level: error
ignorecase: true
swap:
  yanlis_kelime: dogru_kelime
  baska_yanlis: baska_dogru
```

### existence kuralı (varlık kontrolü)

```yaml
extends: existence
message: "'%s' büyük harfle başlamalı."
level: warning
ignorecase: false
tokens:
  - '\btürkiye\b'
  - '\bistanbul\b'
```

### Mesaj formatı kuralları

- Emoji ile başla: 📝 🇹🇷 🏢 ✨ 💻 🎓 🏭 ☕️ 📋 📖
- Nazik ol: "Yanlış yaptın!" değil, "Şöyle yapsak daha iyi olur" tonu
- Vale `%s` parametreleri: 1. Öneri (Doğru), 2. Eşleşen (Yanlış)

## Test Dosyaları

- `fixtures/clean.md` — Hatasız metin. Yeni kural ekledikten sonra hâlâ 0 hata vermelidir.
- `fixtures/dirty.md` — Bilerek hatalı metin. Yeni kuralın yakalayacağı örnekleri buraya ekle.

## Commit Formatı

Türkçe conventional commits kullanılır. **Prefix seçimi versiyon numarasını doğrudan etkiler.**

### KRİTİK KURAL

> **Mevcut bir kurala veri eklemek (kelime, terim, swap girişi) yeni bir özellik DEĞİLDİR.**

| Değişiklik | Prefix | Versiyon |
|---|---|---|
| Yeni `.yml` kural dosyası | `feat:` | Minor (1.3→1.4) |
| Mevcut kurala kelime/terim ekleme | `fix:` | Patch (1.3.0→1.3.1) |
| False positive düzeltme | `fix:` | Patch |
| Kural silme / yeniden adlandırma | `feat!:` | Major |
| Döküman, CI, bakım | `docs:/ci:/chore:` | Release yok |

### Doğru ve Yanlış Örnekler

```bash
# ✅ DOĞRU: Mevcut kurala kelime eklemek
fix(plaza): Katman 1 teknik terimlerinin Türkçe karşılıkları eklendi

# ❌ YANLIŞ: Kelime eklemek feat değildir!
feat(plaza): yeni teknik terimler eklendi

# ✅ DOĞRU: Yeni kural dosyası
feat(rules): Fabrika jargonu kuralı eklendi

# ✅ DOĞRU: False positive düzeltme
fix(rules): BitisikYazim kuralındaki false positive düzeltildi

# ✅ DOĞRU: Döküman değişikliği
docs(readme): kurulum talimatları güncellendi

# ✅ DOĞRU: Test değişikliği
test(fixtures): dirty.md'ye Plaza örnekleri eklendi
```

## Anti-pattern'ler (YAPMA!)

- **ASLA** `Turkish.Spelling = NO` yaparak testleri geçirme
- **ASLA** `accept.txt`'yi dirty.md testini geçmek için kullanma
- **ASLA** kullanıcıya "Yanlış yaptın!" deme
- **ASLA** mevcut kuralları veya kelimeleri silme
- **ASLA** test etmeden commit atma

## Mevcut Kurallar

!`ls -1 styles/Turkish/*.yml 2>/dev/null | sed 's|styles/Turkish/||' | sed 's|\.yml||'`

## Proje Yapısı

```
styles/Turkish/     — Kural dosyaları (YAML)
styles/dictionaries/ — Hunspell sözlük (tr.dic, tr.aff)
styles/config/       — Kelime listeleri (accept.txt)
fixtures/            — Test dosyaları (clean.md, dirty.md)
hooks/               — Pre-commit wrapper script
scripts/             — CI rapor scriptleri
.github/workflows/   — GitHub Actions CI/CD
.gitlab/             — GitLab CI şablonu
```
