# Değişiklik Günlüğü (Changelog)

Bu proje, [Semantik Versiyonlama](https://semver.org/lang/tr/) kurallarına uymaya çalışır.

## v1.1.0

### 🔌 Entegrasyonlar
*   **Pre-commit Desteği:** `.pre-commit-config.yaml` ile tek satırda Türkçe yazım denetimi entegrasyonu.
*   **GitHub Actions:** Tekrar kullanılabilir composite action (`action.yml`) ile CI/CD entegrasyonu.
*   **GitLab CI:** Include edilebilir CI şablonu (`.gitlab/vale-turkish.yml`).
*   **Wrapper Script:** Tüm entegrasyonların temelini oluşturan `hooks/vale-turkish.sh` scripti.
*   **Otomatik Vale Kurulumu:** Sistemde Vale yoksa wrapper script otomatik olarak indirir (`~/.local/bin/vale`).

### 🚀 Yeni Özellikler
*   **Sadelik Modülü:** Karmaşık ve eski ifadeler yerine duru Türkçe önerileri (`Sadelik.yml`).
*   **Gelişmiş Teknik Terimler:** AWS, Azure, GCP ve modern framework'leri içeren kapsamlı liste (`Teknik.yml`).
*   **Akıllı Yazım Denetimi:** Hunspell'in eksiklerini kapatan fiil çekimi regex filtresi (`Spelling.yml`).
*   **Uzun Cümle Kontrolü:** 30 kelimeyi geçen cümleler için okunabilirlik uyarısı (`UzunCumle.yml`).
*   **Kullanıcı Dostu Mesajlar:** Tüm hata mesajları emojilerle zenginleştirildi ve nazik bir tona kavuşturuldu.

### 🐛 Düzeltmeler
*   **Fiil Çekimleri:** "Geliyorum", "gidersin" gibi kelimelerdeki yanlış pozitif hatalar giderildi.
*   **Başlık Büyük Harf:** Başlıkların yanlışlıkla cümle başı kuralına takılması önlendi (`HeadingCapitalization.yml`).
*   **Hata Mesajları:** `substitution` kurallarındaki ters mesaj formatı (Doğru/Yanlış sırası) düzeltildi.

### 📚 Dokümantasyon
*   **Tam Türkçe:** Tüm proje dokümantasyonu ve kod içi yorumlar Türkçeleştirildi.
*   **Katkı Rehberi:** `KATKIDA_BULUNMA.md` dosyası eklendi.
*   **VS Code:** Önerilen eklentiler yapılandırması eklendi.
*   **AGENTS.md:** Proje manifestosu ve teknik hafıza güncellendi.

## v1.0.0 (Geri Alındı)
*   İlk deneme sürümü. GitHub Actions izin sorunu nedeniyle geri çekildi.
