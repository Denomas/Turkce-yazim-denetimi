# Product Requirements Document (PRD): Vale Turkish

| Versiyon | Tarih       | Durum    | Yazar           |
| :---     | :---        | :---     | :---            |
| v1.0     | 23.01.2026  | Taslak   | Antigravity     |

## 1. Ürün Vizyonu
**Vale Turkish**, Türkçe teknik dokümantasyon, blog yazıları ve kurumsal iletişim metinleri için oluşturulmuş, açık kaynaklı, "kur ve unut" (plug-and-play) mantığında çalışan bir stil denetleyicisidir.

Amacımız, yazılımcıların ve içerik üreticilerinin **"Plaza Türkçesi"**, **anlatım bozuklukları** ve **yazım hatalarını** efor sarf etmeden, kod yazar gibi (linter) düzeltebilmesini sağlamaktır.

## 2. Hedef Kitle
*   **Yazılım Geliştiriciler:** README, PR açıklamaları ve teknik doküman yazanlar.
*   **Teknik Yazarlar:** Ürün dokümantasyonu hazırlayan profesyoneller.
*   **Blog Yazarları:** Teknoloji ve iş dünyası üzerine içerik üretenler.
*   **Kurumsal Şirketler:** Marka dili tutarlılığı sağlamak isteyen ekipler.

## 3. İsimlendirme Standartları
*   **GitHub Repo Adı:** `vale-turkish`
*   **Vale Paket Adı:** `Turkish`
*   **Konfigürasyon Kullanımı:** `Packages = Turkish`

## 4. Yol Haritası (Roadmap)

### Faz 1: Temel Atma (Tamamlandı ✅)
*   Temel yazım kuralları (ayrı/bitişik yazım).
*   Hunspell tabanlı Türkçe sözlük entegrasyonu.
*   Büyük/küçük harf ve noktalama kontrolleri.
*   macOS, Linux ve Windows kurulum scriptleri.

### Faz 2: İçerik Zenginleştirme (Şu anki Odak 🚧)
Bu fazda repoyu "basit bir yazım denetleyicisi" olmaktan çıkarıp "stil rehberi"ne dönüştüreceğiz.
*   **Plaza Türkçesi Temizliği:** `deploy etmek` -> `yayına almak`, `meeting` -> `toplantı`.
*   **Sadelik (Simplification):** Gereksiz, uzun ve karmaşık ifadelerin sadeleştirilmesi.
*   **Teknik Terim Standartları:** `Backend`, `Front-end` vb. terimlerin tutarlı yazımı.
*   **Kapsayıcı Dil (Inclusivity):** Cinsiyetçi veya ayrıştırıcı dilden arındırma.

### Faz 3: Ürünleşme ve Otomasyon
*   **Vale Package Format:** `library.json` dosyası oluşturularak Vale'nin resmi paket sistemine uyum.
*   **GitHub Releases:** `Turkish.zip` olarak paketlenmiş sürümlerin otomatik oluşturulması.
*   **CI/CD Pipeline:** Her Pull Request'te kuralların `fixtures` (test cümleleri) ile otomatik test edilmesi.

### Faz 4: Topluluk ve Yaygınlaştırma
*   Logo ve Kurumsal Kimlik tasarımı.
*   Hacktoberfest katılımı için `CONTRIBUTING.md` hazırlanması.
*   VS Code ve Obsidian için eklenti/entegrasyon rehberleri.

## 5. Teknik Mimari

### Klasör Yapısı (Hedef)
```text
vale-turkish/
├── .github/                # CI/CD Workflows
├── features/               # Test senaryoları (Cucumber/Gherkin benzeri)
├── styles/
│   └── Turkish/            # Ana Stil Paketi
│       ├── meta.json       # Paket metadata
│       ├── Plaza.yml       # Plaza dili kuralları
│       ├── Teknik.yml      # Teknik terimler
│       ├── Yazim.yml       # Temel yazım kuralları
│       └── ...
├── fixtures/               # Test için örnek hatalı/doğru metinler
├── library.json            # Vale Registry kayıt dosyası
└── README.md
```

### Kural Kategorileri
Paket modüler yapıda olacak, kullanıcılar isterse sadece belirli modülleri açabilecek:
*   `Turkish.Spelling` (Yazım Denetimi)
*   `Turkish.Plaza` (Plaza Dili)
*   `Turkish.Tech` (Teknik Terimler)
*   `Turkish.Grammar` (Dilbilgisi)
*   `Turkish.Style` (Üslup/Sadelik)

## 6. Başarı Kriterleri
*   Vale resmi paket listesinde yer almak.
*   GitHub'da 100+ Star.
*   Kullanıcıların tek komutla kurulum yapabilmesi (`vale sync`).
