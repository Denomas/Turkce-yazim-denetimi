# İlk Adımlar

Kurulumu tamamladınız. Şimdi ilk denetiminizi yapalım.

## Bilerek Hatalı Bir Dosya Oluşturun

```bash
echo "birşey yazmak istiyorum, herşey yolunda. Bugün bir meeting'imiz var." > test.md
git add test.md
git commit -m "test"
```

## Çıktıyı İnceleyin

```
Türkçe Yazım Denetimi....Failed
- hook id: Turkce-yazim-denetimi

 test.md
 1:1   error    📝 'bir şey' kullanın ('birşey' yerine)     Turkish.BitisikYazim
 1:27  error    📝 'her şey' kullanın ('herşey' yerine)     Turkish.BitisikYazim
 1:50  warning  🏢 'toplantı' kullanın ('meeting' yerine)   Turkish.Plaza
```

## Ne Yakalandı?

| Hata | Kural | Seviye |
|------|-------|--------|
| `birşey` → `bir şey` | BitisikYazim | error |
| `herşey` → `her şey` | BitisikYazim | error |
| `meeting` → `toplantı` | Plaza | warning |

## Düzeltin ve Tekrar Deneyin

```bash
echo "Bir şey yazmak istiyorum, her şey yolunda. Bugün bir toplantımız var." > test.md
git add test.md
git commit -m "test"
```

Bu sefer commit başarılı olacak. Tebrikler! :tada:

## Uyarı Seviyeleri

| Seviye | Anlamı | Örnek |
|--------|--------|-------|
| `error` | Kesin yazım hatası | birşey → bir şey |
| `warning` | Dikkat edilmeli | meeting → toplantı |
| `suggestion` | Öneri niteliğinde | mamafih → bununla birlikte |

Varsayılan seviye `suggestion`'dır (tümünü gösterir). CI/CD'de `warning` veya `error` kullanmanız önerilir.

```yaml
# Sadece hataları göster
- id: Turkce-yazim-denetimi
  args: [--minAlertLevel=error]
```
