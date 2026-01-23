# GELİŞTİRİCİ REHBERİ (YAPAY ZEKA AJANLARI İÇİN)

**Konum:** gelistirme-notlari/AGENTS.md
**Amaç:** Projeye katkıda bulunacak diğer AI ajanlarına yol göstermek.

## TEMEL PRENSİPLER
1.  **DİL:** Bu projede her şey (kod, yorum, dosya adı, commit mesajı) **TÜRKÇE** olmak zorundadır.
2.  **KALİTE:** Asla "testleri geçsin diye" bir kuralı devre dışı bırakmayın (`NO`). Kuralı düzeltin veya istisnaları yönetin.
3.  **BÜTÜNLÜK:** `clean.md` dosyası her zaman hatasız, `dirty.md` dosyası ise hatalı olmalıdır.

## YENİ KURAL EKLEME ADIMLARI
1.  **Analiz:** Eklenecek kuralın kategorisini belirleyin (Yazım, Dilbilgisi, Stil, Plaza Dili vb.).
2.  **Dosya Oluşturma:** `styles/Turkish/` altında `KuralAdi.yml` oluşturun.
3.  **Şablon:**
    ```yaml
    extends: existence (veya substitution/capitalization)
    message: "Hata mesajı burada: '%s'"
    level: error (veya warning/suggestion)
    scope: sentence (veya paragraph)
    tokens:
      - 'regex_deseni'
    ```
4.  **Test:**
    *   `fixtures/dirty.md` dosyasına bu kuralı ihlal eden bir cümle ekleyin.
    *   `fixtures/clean.md` dosyasına bu kurala uyan doğru bir cümle ekleyin.
    *   `vale --config=.vale.ini fixtures/dirty.md` komutuyla hatayı yakaladığını doğrulayın.

## SIK KARŞILAŞILAN SORUNLAR VE ÇÖZÜMLERİ

### 1. "Doğru kelimeye hata veriyor" (Spelling Hatası)
*   **Sebep:** Hunspell sözlüğü eksik.
*   **Çözüm:** Kelimeyi `styles/config/vocabularies/Turkish/accept.txt` dosyasına ekleyin. Asla kuralı kapatmayın.

### 2. "Başlıklar veya Listeler Yanlış Algılanıyor"
*   **Sebep:** `capitalization` kuralı kapsamı yanlış.
*   **Çözüm:** Kural dosyasında `scope` ayarını kontrol edin. `paragraph` yerine `sentence` veya tam tersini deneyin. Gerekirse `HeadingCapitalization.yml` gibi ayrı kurallar oluşturun.

### 3. "CI Testleri Geçmiyor"
*   **Sebep:** `clean.md` temiz değil veya `dirty.md` hata vermiyor.
*   **Çözüm:** Test dosyalarını yerel ortamda `vale` komutuyla çalıştırarak debug edin.

## SÜRÜM YÖNETİMİ
*   Her ana özellik eklendiğinde `PRD.md` güncellenmelidir.
*   Versiyon yayınlamak için sadece Git tag oluşturmak yeterlidir (`v1.1.0` gibi). GitHub Actions gerisini halleder.

## İLETİŞİM VE RAPORLAMA
*   Yaptığınız değişiklikleri her zaman Türkçe ve açıklayıcı commit mesajlarıyla kaydedin.
*   Karmaşık regex desenleri için mutlaka yorum satırı ekleyin.
