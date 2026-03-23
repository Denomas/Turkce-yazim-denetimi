# Bu Projeye Nasıl Destek Olabilirsiniz? 🤝

Merhaba! **Türkçe Yazım Denetimi** projesine ilgi gösterdiğiniz için teşekkür ederiz. Bu proje, [Denomas](https://denomas.com) tarafından Türkçemizin dijital dünyada daha doğru ve güzel kullanılması için başlatılmış bir topluluk hareketidir.

Katkıda bulunmak için kodlama uzmanı veya dilbilimci olmanıza gerek yok. Gözünüze çarpan bir yazım hatasını düzeltmek, yeni bir "Plaza Türkçesi" kelimesi eklemek veya sadece bir fikir belirtmek bile bizim için çok değerlidir.

## Nasıl Yardımcı Olabilirsiniz?

### 1. Hata Bildirin 🐛
Kullandığınız kurallarda bir yanlışlık mı fark ettiniz? Veya Vale doğru bir kelimeye "yanlış" mı diyor?
*   GitHub'da **Issues** (Sorunlar) sekmesine gidin.
*   "Yeni Sorun" (New Issue) butonuna tıklayın.
*   Hatayı ve nasıl düzeltebileceğimizi bize anlatın. (Ekran görüntüsü eklerseniz harika olur!)

### 2. Kural Ekleyin veya Düzeltin ✏️
Projenin kalbine dokunmak isterseniz:
1.  Bu projeyi kendi hesabınıza kopyalayın (Çatallama/Fork).
2.  Bilgisayarınıza indirin ve değişikliklerinizi yapın.
    *   *Yeni kural eklerken:* `styles/Turkish/` klasörüne bakın.
    *   *Kelime eklerken:* `styles/config/vocabularies/Turkish/accept.txt` dosyasına ekleyin.
3.  Yaptığınız değişiklikleri test edin (`./install.sh` ile kurup `vale test_dosyaniz.md` diyerek).
4.  Bize bir **Birleştirme İsteği** (Pull Request) gönderin.

### 3. Fikir Verin 💡
"Şöyle bir özellik olsa ne güzel olurdu" dediğiniz her şeyi **Discussions** (Tartışmalar) veya **Issues** bölümünde bizimle paylaşın.

## Altın Kurallarımız 🌟

0.  **💎 ANA GELİŞTİRME İLKESİ:** Bu projenin en önemli kuralı **ekleyerek zenginleştirmektir.** Hatalı olan bir kuralı düzeltmek dışında **hiçbir veriyi silmiyoruz.** Mevcut yapıyı budamak yerine, yeni kurallar ve kelimeler ekleyerek sürekli büyüyoruz. Daha fazla detay için [Proje Manifestosu (AGENTS.md)](AGENTS.md) dosyasını inceleyebilirsiniz.
1.  **Tam Türkçe:** Projedeki her şey (dosya isimleri, açıklamalar, commit mesajları) Türkçe olmalıdır. Yabancı terimler yerine Türkçe karşılıklarını kullanmaya özen gösteriyoruz.
2.  **Kapsayıcılık:** Dilimiz herkesi kucaklamalı. Kaba, ayrıştırıcı veya saldırgan ifadelerden kaçınıyoruz.
3.  **Kalite:** "Testleri geçsin diye kuralı kapatmak" yok. Sorunu kökten çözüyoruz.

## Commit Mesajı Kuralları (Zorunlu)

Bu proje [Conventional Commits](https://www.conventionalcommits.org/) kullanır ve commit prefix'i **versiyon numarasını doğrudan etkiler**. Yanlış prefix kullanmak gereksiz versiyon artışına neden olur.

### Temel Kural

> **Mevcut bir kurala veri eklemek (kelime, terim, swap girişi) yeni bir özellik DEĞİLDİR.**
> Yeni özellik (`feat:`) yalnızca yeni bir mekanizma veya kural dosyası eklendiğinde kullanılır.

### Prefix Rehberi

| Değişiklik | Prefix | Versiyon etkisi | Örnek |
|---|---|---|---|
| Yeni kural dosyası (`.yml`) oluşturma | `feat:` | Minor (1.3.0 → 1.4.0) | Yeni `Fabrika.yml` kuralı |
| Yeni mekanizma / özellik ekleme | `feat:` | Minor | Spelling kuralı ekleme |
| Mevcut kurala kelime/terim ekleme | `fix:` | Patch (1.3.0 → 1.3.1) | Plaza.yml'ye yeni swap girişleri |
| accept.txt'ye terim ekleme | `fix:` | Patch | Ürün adı ekleme |
| Mevcut kuralda hata düzeltme | `fix:` | Patch | False positive giderme |
| Kırıcı değişiklik (kural silme vb.) | `feat!:` | Major (1.0.0 → 2.0.0) | Kural yeniden adlandırma |
| Döküman değişikliği | `docs:` | Release yok | README güncelleme |
| CI/CD değişikliği | `ci:` | Release yok | Workflow düzenleme |
| Bakım / temizlik | `chore:` | Release yok | Bağımlılık güncelleme |
| Kod iyileştirme | `refactor:` | Release yok | Regex optimizasyonu |
| Test ekleme/düzeltme | `test:` | Release yok | Fixture güncelleme |

### Doğru ve Yanlış Örnekler

```bash
# ✅ DOĞRU: Plaza.yml'ye kelime eklemek = mevcut veriye ekleme
git commit -m "fix(plaza): Katman 1 teknik terimlerinin Türkçe karşılıkları eklendi"

# ❌ YANLIŞ: Kelime eklemek "feat" değildir!
git commit -m "feat(plaza): yeni teknik terimler eklendi"

# ✅ DOĞRU: Yeni kural dosyası = yeni özellik
git commit -m "feat(rules): Fabrika jargonu kuralı eklendi"

# ✅ DOĞRU: False positive düzeltmek = hata düzeltme
git commit -m "fix(spelling): Türkçe çekim eki false positive düzeltildi"
```

> **Hatırlatma:** Commit mesajları Türkçe yazılmalıdır.

## Geliştirme Ortamı

Projeyi geliştirmek için bilgisayarınızda şunların kurulu olması yeterlidir:
*   [Vale](https://vale.sh) (Linter aracı)
*   Git (Versiyon kontrolü)

Katkılarınızla bu projeyi büyüteceğimiz için şimdiden çok heyecanlıyız! Hoş geldiniz! 👋
