# PROJE BİLGİ BANKASI (KNOWLEDGE BASE)

**Oluşturulma Tarihi:** 23 Ocak 2026
**Proje:** Vale Turkish (Türkçe Stil Rehberi)
**Konum:** Kök Dizin

## GENEL BAKIŞ
Vale Turkish, Türkçe teknik dokümantasyon, blog yazıları ve kurumsal metinler için açık kaynaklı bir Vale linter stil paketidir. Amacı, "Plaza Türkçesi", yazım hataları ve anlatım bozukluklarını otomatik olarak tespit edip düzeltmektir.

## YAPI
```text
vale-turkish/
├── .github/                # CI/CD İş Akışları (Test ve Release)
├── fixtures/               # Test Dosyaları (Temiz ve Hatalı örnekler)
├── gelistirme-notlari/     # Geliştiriciler için ek rehberler
├── styles/
│   ├── Turkish/            # Ana Stil Kuralları (YAML)
│   ├── dictionaries/       # Hunspell Sözlükleri (tr.dic, tr.aff)
│   └── config/             # Vocab (Özel kelime listeleri)
├── library.json            # Vale Registry Kaydı
├── PRD.md                  # Ürün Gereksinim Dokümanı
├── README.md               # Kullanım Kılavuzu
├── install.sh              # macOS/Linux Kurulum Scripti
└── install.ps1             # Windows Kurulum Scripti
```

## NEREYE BAKILMALI
| Görev | Konum | Notlar |
|-------|-------|--------|
| **Kural Ekleme/Düzenleme** | `styles/Turkish/*.yml` | Her kural ayrı bir YAML dosyasında olmalı. |
| **Sözlük Güncelleme** | `styles/config/vocabularies/Turkish/accept.txt` | Doğru olduğu halde hata veren kelimeleri buraya ekle. |
| **Test Senaryosu Ekleme** | `fixtures/clean.md` & `dirty.md` | Kuralların doğruluğunu test etmek için kullanılır. |
| **CI/CD Ayarları** | `.github/workflows/*.yml` | GitHub Actions yapılandırmaları. |
| **Kurulum Scriptleri** | `install.sh` / `install.ps1` | Kullanıcı kurulum süreçleri. |

## KONVANSİYONLAR (KURALLAR)
*   **Dil:** Tüm dokümantasyon, commit mesajları ve dosya içi yorumlar **Türkçe** olmalıdır.
*   **Dosya İsimlendirme:** Kural dosyaları `PascalCase.yml` formatında olmalıdır (Örn: `BitisikYazim.yml`).
*   **Kural Yapısı:** Her kural dosyasında `message`, `level` ve `link` (varsa) alanları mutlaka dolu olmalıdır.
*   **Kapsam (Scope):** Kurallar mümkün olduğunca dar kapsamlı (`scope: sentence` veya `scope: paragraph`) tutulmalıdır.
*   **Test Zorunluluğu:** Yeni bir kural eklendiğinde mutlaka `fixtures` dosyalarında test edilmelidir.

## ANTİ-DESENLER (YASAKLAR)
*   **ASLA** bir kuralı testleri geçmek için iptal etme veya kapatma. Kuralı düzelt.
*   **ASLA** `scope` alanını gereksiz yere genişletme (tüm dosyayı tarama).
*   **ASLA** Hunspell sözlüğünü manuel düzenleme; kelimeleri `accept.txt`'ye ekle.
*   **ASLA** İngilizce commit mesajı kullanma.

## KOMUTLAR
```bash
# Test Çalıştırma (Yerel)
vale --config=.vale.ini fixtures/clean.md
vale --config=.vale.ini fixtures/dirty.md

# Kurulum Testi
./install.sh

# Versiyon Yayınlama (Otomatik)
git tag vX.Y.Z
git push origin vX.Y.Z
```

## NOTLAR
*   `clean.md` dosyası her zaman **SIFIR HATA** vermelidir.
*   `dirty.md` dosyası beklenen hataları vermelidir.
*   Proje, Vale Package Registry standartlarına uyumlu olmalıdır (`library.json` güncel kalmalı).
