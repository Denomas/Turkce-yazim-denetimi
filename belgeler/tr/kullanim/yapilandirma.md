# Yapılandırma

## `.vale.ini` Dosyası

```ini
StylesPath = styles
MinAlertLevel = suggestion
Vocab = Turkish

[*.md]
BasedOnStyles = Turkish

[*.rst]
BasedOnStyles = Turkish

[*.txt]
BasedOnStyles = Turkish
```

## Belirli Kuralları Kapatma

### Proje genelinde

```ini
[*.md]
BasedOnStyles = Turkish
Turkish.Spelling = NO
Turkish.Plaza = NO
```

### Dosya içinde geçici olarak

```markdown
Bu paragrafta Plaza kuralı uygulanır.

<!-- vale Turkish.Plaza = NO -->
Bu paragrafta "deadline" gibi kelimeler uyarı vermez.
<!-- vale Turkish.Plaza = YES -->

Bu paragrafta tekrar uygulanır.
```

## Özel Kelime Ekleme

Sözlükte olmayan ama projenizde kullandığınız terimleri kabul listesine ekleyin:

```bash
echo "Kubernetes" >> styles/config/vocabularies/Turkish/accept.txt
echo "DevOps" >> styles/config/vocabularies/Turkish/accept.txt
```

## Desteklenen Dosya Formatları

| Format | Uzantı | Açıklama |
|--------|--------|----------|
| Markdown | `.md` | GitHub, GitLab, dokümantasyon siteleri |
| reStructuredText | `.rst` | Sphinx, Python dokümantasyonu |
| AsciiDoc | `.adoc` | Teknik kitaplar |
| HTML | `.html` | Web sayfaları |
| Düz metin | `.txt` | Genel metin dosyaları |
| Org Mode | `.org` | Emacs org-mode dosyaları |

## Ortam Değişkenleri

| Değişken | Açıklama |
|----------|----------|
| `VALE_VERSION` | İndirilecek Vale sürümü (`.github/vale-version` dosyasından okunur) |
| `VALE_TURKISH_NO_SPELLING` | `1` olarak ayarlanırsa Spelling kuralı devre dışı kalır |
| `VALE_CONFIG_PATH` | Vale yapılandırma dosyasının yolu |
