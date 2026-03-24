# Değişiklik Günlüğü (Changelog)

Bu proje, [Semantik Versiyonlama](https://semver.org/lang/tr/) kurallarına uymaya çalışır.

## [1.3.1](https://github.com/Denomas/Turkce-yazim-denetimi/compare/v1.3.0...v1.3.1) (2026-03-24)


### Düzeltmeler

* **accept:** gereksiz Türkçe kelimeler kaldırıldı, Vale workaround'ları belgelendi ([28d8447](https://github.com/Denomas/Turkce-yazim-denetimi/commit/28d84479ce35fa25383e603cb06582ff89ca44f0))
* **plaza:** Katman 1 teknik terimlerinin Türkçe karşılıkları eklendi ([b02f895](https://github.com/Denomas/Turkce-yazim-denetimi/commit/b02f8957a6704e513a635bf29da3c17555e44591))
* spelling varsayılan kapalı — Vale Hunspell entegrasyonunda bilinen bug ([9681a80](https://github.com/Denomas/Turkce-yazim-denetimi/commit/9681a808d4895a6723e9f1d1c8e2729f1fb3fb17))
* **spelling:** Türkçe isim çekim eki filtreleri ve eksik terimler eklendi ([d7b9cd0](https://github.com/Denomas/Turkce-yazim-denetimi/commit/d7b9cd0686e37455b85c223ab829b4eedbf783ff))
* **spelling:** Vale Go binding workaround filtreleri eklendi ([2cef796](https://github.com/Denomas/Turkce-yazim-denetimi/commit/2cef796a18df937e5e5e0230e10d90a523a294c0))


### Dokümantasyon

* commit prefix seçim kuralı tüm geliştirici dökümanlarına eklendi ([d8d02ac](https://github.com/Denomas/Turkce-yazim-denetimi/commit/d8d02ace6c4d934a750e1dc8f5dd719afdb4a662))

## [1.3.0](https://github.com/Denomas/Turkce-yazim-denetimi/compare/v1.2.0...v1.3.0) (2026-03-23)


### Yeni Özellikler

* accept.txt genişletildi — 100+ teknik terim eklendi ([98a0b82](https://github.com/Denomas/Turkce-yazim-denetimi/commit/98a0b82878f31a6913586f91286f454b985a1de5))
* tam otomatik release pipeline + geliştirici iş akışı belgeleri ([#1](https://github.com/Denomas/Turkce-yazim-denetimi/issues/1)) ([e90d263](https://github.com/Denomas/Turkce-yazim-denetimi/commit/e90d26381d3b5c893eaf9b18f565144f10f5f79d))


### Düzeltmeler

* Teknik.yml substring false positive düzeltildi, mktemp çakışması giderildi ([28381ab](https://github.com/Denomas/Turkce-yazim-denetimi/commit/28381ab8f2fc546d0698d1e7ce49c03512ea6d0b))


### İyileştirmeler

* accept.txt sadeleştirildi — yalnızca zorunlu terimler kaldı ([b25719a](https://github.com/Denomas/Turkce-yazim-denetimi/commit/b25719a5872107af3aaacc7507ad073cb54f0a2c))
* Vale versiyonunu tek kaynaktan yönet (.github/vale-version) ([876d703](https://github.com/Denomas/Turkce-yazim-denetimi/commit/876d703ee6714c480557a5887cec6d3613c912f2))

## v1.2.0

### 🐛 Düzeltmeler
*   **Capitalization False Positive:** ListCapitalization ve ParagraphCapitalization kurallarına exceptions eklendi. AI, API, SSH, HTML, URL vb. kısaltmalar artık false positive üretmiyor.
*   **Bold Liste Öğeleri:** `**Bold başlık:** açıklama` formatındaki liste öğelerinde sentence-case kontrolü warning seviyesine düşürüldü (Vale çekirdek limitasyonu).
*   **GitLab CI Şablonu:** Dinamik dizin adı, mutlak yol çözümleme ve stderr ayrımı düzeltmeleri.

### 🔧 İyileştirmeler
*   **Vale 3.14.1:** Tüm entegrasyonlarda Vale sürümü 3.14.1'e yükseltildi.
*   **Denomas Markası:** Tüm Türkçe dokümanlarda "Türkçe Yazım Denetimi", İngilizce dokümanlarda "Vale Turkish" markalaması.
*   **Teknik Tanımlayıcılar:** `vale-turkish` → `Turkce-yazim-denetimi` (hook ID, dosya adları, şablon adları).

### 📖 Dokümantasyon
*   **İki Dilli Dokümantasyon Sitesi:** MkDocs Material ile GitHub Pages üzerinde TR + EN belgeler.
*   **Dil Algılama:** Tarayıcı diline göre otomatik yönlendirme (TR → /tr/, diğer → /en/).
*   **Fork İş Akışı:** Mermaid diyagram ile katkıda bulunma rehberi.
*   **Kullanıcı Senaryoları:** AI içerik QA, lokalizasyon, çok dilli projeler.

### 🏗️ Altyapı
*   **Örnek Repolar:** Denomas organizasyonuna taşındı ve `Turkce-yazim-denetimi-ornek` olarak yeniden adlandırıldı.
*   **CI Tasarımı:** Temiz/hatalı belge ayrı job'lar (GitHub + GitLab).

---

## v1.1.0

### 🔌 Entegrasyonlar
*   **Pre-commit Desteği:** `.pre-commit-config.yaml` ile tek satırda Türkçe yazım denetimi entegrasyonu.
*   **GitHub Actions:** Tekrar kullanılabilir composite action (`action.yml`) ile CI/CD entegrasyonu.
*   **GitLab CI:** Include edilebilir CI şablonu (`.gitlab/Turkce-yazim-denetimi.yml`).
*   **Kurulum Betiği:** Tüm entegrasyonların temelini oluşturan `hooks/Turkce-yazim-denetimi.sh` betiği.
*   **Otomatik Vale Kurulumu:** Sistemde Vale yoksa wrapper script otomatik olarak indirir (`~/.local/bin/vale`).

### 🚀 Yeni Özellikler
*   **Sadelik Modülü:** Karmaşık ve eski ifadeler yerine duru Türkçe önerileri (`Sadelik.yml`).
*   **Gelişmiş Teknik Terimler:** AWS, Azure, GCP ve modern framework'leri içeren kapsamlı liste (`Teknik.yml`).
*   **Akıllı Yazım Denetimi:** Hunspell'in eksiklerini kapatan fiil çekimi regex filtresi (`Spelling.yml`).
*   **Uzun Cümle Kontrolü:** 30 kelimeyi geçen cümleler için okunabilirlik uyarısı (`UzunCumle.yml`).
*   **Kullanıcı Dostu Mesajlar:** Tüm hata mesajları emojilerle zenginleştirildi ve nazik bir tona kavuşturuldu.

### 📊 Görsel CI Raporlama
*   **GitHub Actions Step Summary:** Markdown tablo ile hata/uyarı/öneri sayaçları ve collapsible detay.
*   **GitHub Annotations:** PR diff'inde inline `::error` ve `::warning` gösterimi.
*   **GitLab JUnit:** Vale sonuçları MR'da "Tests" sekmesinde gösteriliyor (`junit.xml`).
*   **GitLab CodeClimate:** Code Quality widget'ında sorunlar gösteriliyor (`gl-code-quality-report.json`).

### 🏗️ Altyapı
*   **Çoklu Platform:** GitHub Actions action.yml artık Linux, macOS (Intel/ARM) ve Windows runner'larını destekliyor.
*   **Release Kapısı:** Tüm testler geçmeden release yapılamaz (`needs: test`).
*   **Floating Tag:** Her release'de `v1` major tag'i otomatik güncelleniyor.
*   **Dependabot:** GitHub Actions bağımlılıkları haftalık otomatik güncelleme.
*   **CODEOWNERS:** Tüm dosyalar için code review sorumlusu tanımlandı.
*   **Issue Template'leri:** Hata raporu ve kural önerisi formları (Türkçe YAML form).
*   **PR Template:** Test kontrol listesi ve AGENTS.md uygunluk checklist'i.
*   **EditorConfig:** YAML/MD dosyaları için tutarlı dosya formatı.

### 🐛 Düzeltmeler
*   **Fiil Çekimleri:** "Geliyorum", "gidersin" gibi kelimelerdeki yanlış pozitif hatalar giderildi.
*   **Başlık Büyük Harf:** Başlıkların yanlışlıkla cümle başı kuralına takılması önlendi (`HeadingCapitalization.yml`).
*   **Hata Mesajları:** `substitution` kurallarındaki ters mesaj formatı (Doğru/Yanlış sırası) düzeltildi.
*   **action.yml Heredoc:** YAML girintisi `.vale.ini` içine taşınıyordu, `echo` ile düzeltildi.
*   **action.yml Path:** `github.action_path` `./` kalıntısı `realpath` ile temizlendi.
*   **GitLab CI Shell Executor:** `apk` yerine platform algılama ile `~/.local/bin` fallback'i.
*   **Spelling False Positive:** `sonucunda`, `Bununla`, `listesini`, `yeniden` kelimeler accept.txt'ye eklendi.

### 📚 Dokümantasyon
*   **Diátaxis Yapısı:** README Öğretici/Nasıl Yapılır/Başvuru/Açıklama kadranlarına göre yeniden yazıldı.
*   **Platform Kurulumları:** macOS, Linux (Ubuntu/Debian/Arch/Fedora), Windows detaylı kurulum rehberleri.
*   **CI Badge'leri:** Test durumu ve release versiyonu badge'leri README'ye eklendi.
*   **Tam Türkçe:** Tüm proje dokümantasyonu ve kod içi yorumlar Türkçeleştirildi.
*   **Katkı Rehberi:** `KATKIDA_BULUNMA.md` dosyası eklendi.
*   **VS Code:** Önerilen eklentiler yapılandırması eklendi.
*   **AGENTS.md:** Proje manifestosu, Yayınlama Kapısı kuralı ve teknik hafıza güncellendi.

## v1.0.0 (Geri Alındı)
*   İlk deneme sürümü. GitHub Actions izin sorunu nedeniyle geri çekildi.
