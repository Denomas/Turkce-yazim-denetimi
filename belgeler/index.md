# Türkçe Yazım Denetimi

**Dijital dünyada Türkçemizin koruyucusu.**

---

Türkçe Yazım Denetimi, metin dosyalarınızdaki yazım hatalarını, Plaza Türkçesini, anlatım bozukluklarını ve teknik terim yanlışlarını otomatik olarak bulur ve nazikçe düzeltme önerir. [Denomas](https://denomas.com) tarafından geliştirilmektedir.

<div class="grid cards" markdown>

-   :material-rocket-launch:{ .lg .middle } **5 Dakikada Başlayın**

    ---

    Pre-commit, yerel kurulum veya CI/CD — size uygun yolu seçin.

    [→ Kurulum](tr/baslangic/kurulum.md)

-   :material-book-open-variant:{ .lg .middle } **16 Kural ile Denetim**

    ---

    Bitişik yazım, Plaza Türkçesi, akademik dil, teknik terimler ve daha fazlası.

    [→ Kurallar](tr/kurallar/index.md)

-   :material-github:{ .lg .middle } **Katkıda Bulunun**

    ---

    Fork iş akışı ile projeye destek olun. Türkçemize birlikte sahip çıkalım.

    [→ Katkı rehberi](tr/katki/fork-is-akisi.md)

-   :material-translate:{ .lg .middle } **English Docs**

    ---

    For international developers using Vale Turkish in their projects.

    [→ English](en/index.md)

</div>

## Hızlı Başlangıç

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/Denomas/Turkce-yazim-denetimi
    rev: v1
    hooks:
      - id: Turkce-yazim-denetimi
```

```bash
pip install pre-commit
pre-commit install
```

Her commit'te Türkçe belgeleriniz otomatik denetlenir.

## Kim Kullanabilir?

| Senaryo | Nasıl? |
|---------|--------|
| **Türk yazılımcı** | Pre-commit + CI ile kendi projelerinde otomatik Türkçe denetim |
| **Yapay zeka ajanı geliştiricisi** | Claude/GPT ile ürettirilen Türkçe içeriklerin kalite kontrolü |
| **Uluslararası ekip** | Çok dilli projede sadece `docs/tr/` klasörünü denetleme |
| **Teknik yazar** | Kurumsal dokümantasyon standartlarını otomatik uygulama |
| **Açık kaynak proje sahibi** | Katkıda bulunanlardan gelen Türkçe PR'ları otomatik denetleme |
| **Lokalizasyon ekibi** | Çeviri sonrası Türkçe kalite güvencesi |
| **Eğitimci** | Öğrenci ödevlerinde yazım denetimi |
| **Türkçe öğrenen yabancı** | Yazdığı Türkçe metinleri kontrol ettirme |

---

*[Denomas](https://denomas.com) — Türkçenin dijital dünyadaki koruyucusu.*
