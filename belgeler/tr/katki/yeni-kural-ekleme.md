# Yeni Kural Ekleme

## Kural Dosyası Oluşturma

`styles/Turkish/` klasörüne yeni bir YAML dosyası ekleyin. Dosya adı `PascalCase` olmalıdır.

### Substitution (Kelime Değiştirme)

```yaml
extends: substitution
message: "🇹🇷 Türkçemizi koruyalım: '%s' kullanın ('%s' yerine)"
level: error
ignorecase: true
swap:
  yanlis_kelime: dogru_kelime
  baska_yanlis: baska_dogru
```

### Existence (Varlık Kontrolü)

```yaml
extends: existence
message: "📝 '%s' kullanımını kontrol edin."
level: warning
ignorecase: true
tokens:
  - kontrol_edilecek_kelime
```

## Test Etme

1. Hatalı örneği `fixtures/dirty.md` dosyasına ekleyin
2. Temiz örneği `fixtures/clean.md` dosyasına ekleyin
3. Testleri çalıştırın:

```bash
vale --config=.vale.ini fixtures/clean.md   # 0 hata olmalı
vale --config=.vale.ini fixtures/dirty.md   # Yeni kural çalışmalı
```

## Mesaj Formatı Kuralları

- Emoji ile başlayın: `📝`, `🇹🇷`, `🏢`, `✨`, `☕️`
- Nazik ve yol gösterici olun
- `'%s' kullanın ('%s' yerine)` formatını kullanın
- İlk `%s` = doğru kelime, ikinci `%s` = yanlış kelime

## Adlandırma Kuralları

| Kural | Örnek |
|-------|-------|
| Dosya adı PascalCase | `BitisikYazim.yml` |
| Seviye doğru seçilmeli | error: kesin hata, warning: dikkat, suggestion: öneri |
| Türkçe mesaj | Tüm mesajlar Türkçe olmalı |
