# Kural Referansı

Türkçe Yazım Denetimi 16 kural dosyasıyla 6 ana kategoride denetim yapar.

## Kural Tablosu

| Kural | Tür | Açıklama | Seviye |
|-------|-----|----------|--------|
| `Turkish.BitisikYazim` | substitution | Ayrı/bitişik yazılması gereken kelimeler | error |
| `Turkish.Buyukharf` | existence | Özel isimlerin büyük harfle yazımı | warning |
| `Turkish.CumleBasi` | capitalization | Cümle başı büyük harf kontrolü | error |
| `Turkish.DeDABaglaci` | existence | de/da bağlacı kontrolü | warning |
| `Turkish.KiEki` | substitution | ki bağlacı kontrolü | warning |
| `Turkish.Noktalama` | existence | Noktalama işaretleri kontrolü | error |
| `Turkish.Spelling` | spelling | Hunspell tabanlı Türkçe yazım denetimi | error |
| `Turkish.Tekrar` | repetition | Kelime tekrarı kontrolü | warning |
| `Turkish.YanlisTurkce` | substitution | Yaygın yazım hataları | error |
| `Turkish.Plaza` | substitution | Plaza Türkçesi (iş dili) sadeleştirme | warning |
| `Turkish.Akademik` | substitution | Akademik dilde duruluk ve sadelik | suggestion |
| `Turkish.Fabrika` | substitution | Üretim sahası ve fabrika jargonu | warning |
| `Turkish.Teknik` | substitution | Teknik terimlerin standart yazımı | error |
| `Turkish.Sadelik` | substitution | Genel anlatım bozuklukları ve sadelik | suggestion |
| `Turkish.Deyimler` | substitution | Deyimlerin doğru kullanımı | error |
| `Turkish.UzunCumle` | existence | 30+ kelimeli uzun cümle uyarısı | warning |

## Kategoriler

### Yazım Kuralları
Bitişik/ayrı yazım (`birşey` → `bir şey`), büyük harf (`istanbul` → `İstanbul`), de/da ve ki bağlaçları, noktalama, cümle başı kontrolü.

### Yazım Denetimi
Hunspell tabanlı Türkçe sözlük ile kelime doğrulaması. 36 MB'lık sözlük ve fiil çekimi regex filtreleri ile false positive azaltma.

### Plaza Türkçesi
İş dünyasının gereksiz yabancı kelimelerini tespit eder:

- `deadline` → `son teslim tarihi`
- `feedback` → `geri bildirim`
- `meeting` → `toplantı`
- `ASAP` → `mümkün olan en kısa sürede`

### Akademik Dil
Ağdalı akademik ifadeleri sadeleştirir:

- `mamafih` → `bununla birlikte`
- `mevzubahis` → `söz konusu`

### Teknik Terimler
Teknik terimlerin standart yazımını kontrol eder:

- `Nextjs` → `Next.js`
- `Macos` → `macOS`
- `Github` → `GitHub`

### Okunabilirlik
30 kelimeyi aşan cümleleri uyarır, kelime tekrarlarını bulur.
