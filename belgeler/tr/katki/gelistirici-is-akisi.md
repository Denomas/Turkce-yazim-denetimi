# Geliştirici İş Akışı

Bu belge, projeye nasıl katkıda bulunulacağını adım adım anlatır. Tüm değişiklikler PR ile yapılır, tüm testlerden geçmesi zorunludur ve release süreci tamamen otomatiktir.

## Genel Bakış

```mermaid
graph LR
    A[Fikir] --> B[Fork]
    B --> C[Branch]
    C --> D[Geliştir]
    D --> E[Test]
    E --> F[PR Aç]
    F --> G[CI Kontrol]
    G --> H{Testler Geçti?}
    H -->|Hayır| D
    H -->|Evet| I[Merge]
    I --> J[Otomatik Release]
```

**Hiçbir değişiklik doğrudan main branch'e push edilemez.** Her şey PR üzerinden geçer.

---

## PR Yaşam Döngüsü

```mermaid
graph TD
    A[PR Açılır] --> B[Otomatik Kontroller Başlar]
    B --> C[CI Testleri]
    B --> D[PR Başlık Kontrolü]
    B --> E[Conventional Commit Doğrulama]
    C --> F{Tümü Yeşil?}
    D --> F
    E --> F
    F -->|Hayır| G[Geliştirici Düzeltir]
    G --> B
    F -->|Evet| H[Merge Edilebilir]
    H --> I[Maintainer Merge Eder]
    I --> J[release-please Analiz Eder]
    J --> K{feat veya fix var mı?}
    K -->|Evet| L[Release PR Oluşturur]
    K -->|Hayır| M[Bekleme]
    L --> N[Release PR Merge]
    N --> O[Otomatik Release Yayınlanır]
    O --> P[v1 Tag Güncellenir]
```

---

## CI Pipeline Detayı

Her PR açıldığında 4 ayrı test çalışır:

```mermaid
graph TD
    A[PR / Push] --> B[test]
    A --> C[test-precommit]
    A --> D["test-action (Linux)"]
    A --> E["test-action (macOS)"]

    B --> B1[clean.md → 0 hata]
    B --> B2[dirty.md → hatalar bulunmalı]

    C --> C1[Hook script testi]
    C --> C2[Pre-commit framework testi]

    D --> D1[Action Linux'ta çalışıyor]
    E --> E1[Action macOS'ta çalışıyor]

    B1 --> F{Tümü Başarılı?}
    B2 --> F
    C1 --> F
    C2 --> F
    D1 --> F
    E1 --> F

    F -->|Evet| G[PR Merge Edilebilir]
    F -->|Hayır| H[PR Engellenmiş]
```

---

## Release Pipeline

```mermaid
graph TD
    A[Main'e Merge] --> B[release-please Çalışır]
    B --> C[Commit Mesajlarını Analiz Et]
    C --> D{Release Gerekli mi?}
    D -->|Hayır| E[Bekleme]
    D -->|Evet| F[Release PR Oluştur]
    F --> G[CHANGELOG Güncelle]
    F --> H[library.json Versiyon Güncelle]
    F --> I[.release-please-manifest Güncelle]
    G --> J[Release PR Merge Edilir]
    H --> J
    I --> J
    J --> K[Git Tag Oluştur]
    K --> L[GitHub Release Yayınla]
    L --> M[Turkish.zip + library.json Yükle]
    M --> N[v1 Floating Tag Güncelle]
    N --> O[Kullanıcılar Güncel Sürümü Alır]
```

---

## Yeni Kural Ekleme Akışı

```mermaid
graph TD
    A[Yeni Kural Fikri] --> B[styles/Turkish/ Altına YAML Oluştur]
    B --> C[fixtures/dirty.md'ye Hatalı Örnek Ekle]
    C --> D[fixtures/clean.md'ye Doğru Örnek Ekle]
    D --> E[Test Et]
    E --> F{clean.md 0 Hata?}
    F -->|Hayır| G[Kuralı Düzelt]
    G --> E
    F -->|Evet| H{dirty.md Hataları Yakalıyor?}
    H -->|Hayır| G
    H -->|Evet| I["PR Aç (feat: yeni kural)"]
    I --> J[CI Testleri Çalışır]
    J --> K[Merge + Otomatik Release]
```

---

## Hotfix Akışı

Kritik bir hata bulunduğunda:

```mermaid
graph LR
    A[Kritik Hata] --> B["fix/ Branch Oluştur"]
    B --> C[Düzelt]
    C --> D[Test Et]
    D --> E["PR Aç (fix: açıklama)"]
    E --> F[CI Kontrol]
    F --> G[Acil Merge]
    G --> H[Otomatik Patch Release]
```

`fix:` prefix'i otomatik olarak patch versiyon artışına neden olur (1.2.0 → 1.2.1).

---

## Versiyon Belirleme

Commit mesajlarına göre otomatik belirlenir:

```mermaid
graph TD
    A[Commit Mesajı] --> B{Prefix Nedir?}
    B -->|"feat:"| C["Minor Artış (1.2.0 → 1.3.0)"]
    B -->|"fix:"| D["Patch Artış (1.2.0 → 1.2.1)"]
    B -->|"feat!:"| E["Major Artış (1.2.0 → 2.0.0)"]
    B -->|"docs: / chore: / ci:"| F[Release Tetiklenmez]
```

### Conventional Commits Zorunluluğu

Her PR başlığı şu prefix'lerden biriyle başlamalıdır:

| Prefix | Anlam | Release Etkisi |
|--------|-------|----------------|
| `feat:` | Yeni özellik | Minor versiyon |
| `fix:` | Hata düzeltme | Patch versiyon |
| `docs:` | Dokümantasyon | Release yok |
| `chore:` | Bakım işleri | Release yok |
| `refactor:` | Kod iyileştirme | Release yok |
| `test:` | Test ekleme/düzeltme | Release yok |
| `ci:` | CI/CD değişikliği | Release yok |
| `feat!:` | Kırıcı değişiklik | Major versiyon |

### Prefix Seçim Kuralı (KRİTİK)

> **Mevcut bir kurala veri eklemek (kelime, terim, swap girişi) yeni bir özellik DEĞİLDİR.**

Bu ayrım versiyon numarasını doğrudan etkiler. Yanlış prefix gereksiz versiyon artışına neden olur.

| Değişiklik | Doğru prefix | Neden |
|---|---|---|
| Yeni `.yml` kural dosyası oluşturma | `feat:` | Yeni mekanizma ekleniyor |
| Yeni mekanizma / özellik ekleme | `feat:` | Projenin kapsamı genişliyor |
| Mevcut kurala kelime/terim ekleme | `fix:` | Mevcut mekanizmaya veri ekleniyor |
| accept.txt'ye terim ekleme | `fix:` | Mevcut sözlük genişletiliyor |
| False positive düzeltme | `fix:` | Hata gideriliyor |
| Kural silme / yeniden adlandırma | `feat!:` | Kırıcı değişiklik |

**Örnek:**

```bash
# ✅ DOĞRU: Mevcut kurala kelime eklemek
git commit -m "fix(plaza): Katman 1 teknik terimlerinin Türkçe karşılıkları eklendi"

# ❌ YANLIŞ: Kelime eklemek feat değildir!
git commit -m "feat(plaza): yeni teknik terimler eklendi"

# ✅ DOĞRU: Yeni kural dosyası oluşturmak
git commit -m "feat(rules): Fabrika jargonu kuralı eklendi"
```

---

## Güvenlik Katmanları

Kullanıcıların asla hatalı bir sürüm görmemesi için 6 katmanlı koruma:

```mermaid
graph TD
    A[Geliştirici Kodu Yazar] --> B["1. Branch Protection<br/>Doğrudan push yasak"]
    B --> C["2. PR Zorunluluğu<br/>Her değişiklik incelenir"]
    C --> D["3. Conventional Commits<br/>PR başlığı formatı zorunlu"]
    D --> E["4. CI Testleri<br/>4 job, 2 platform, tümü yeşil"]
    E --> F["5. release-please<br/>Otomatik versiyon + CHANGELOG"]
    F --> G["6. Otomatik Release<br/>İnsan müdahalesi yok"]
    G --> H["Kullanıcı Güvende"]
```

---

## Katkıda Bulunan Tipleri

| Tip | İş Akışı | PR Kuralı |
|-----|----------|-----------|
| **Dış geliştirici** | Fork → Branch → PR | Conventional commit zorunlu |
| **Denomas ekibi** | Branch → PR | Conventional commit zorunlu |
| **AI ajan** | Branch → PR | Conventional commit zorunlu, test zorunlu |
| **Dependabot** | Otomatik PR | Patch/minor otomatik merge |

---

## Hızlı Referans

```bash
# 1. Fork ve clone
git clone https://github.com/KULLANICI/Turkce-yazim-denetimi.git
cd Turkce-yazim-denetimi

# 2. Branch oluştur
git checkout -b feat/yeni-ozellik

# 3. Geliştir ve test et
vale --config=.vale.ini fixtures/clean.md   # 0 hata
vale --config=.vale.ini fixtures/dirty.md   # hatalar bulunmalı

# 4. Commit (conventional format)
git commit -m "feat: yeni kural eklendi"

# 5. Push ve PR aç
git push origin feat/yeni-ozellik
# GitHub'da PR oluştur
```
