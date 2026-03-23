# Geliştirme Ortamı

## Gereksinimler

- [Git](https://git-scm.com/)
- [Vale](https://vale.sh) (metin denetleme motoru)
- [Pre-commit](https://pre-commit.com/) (isteğe bağlı, ama önerilir)

## Vale Kurulumu

=== "macOS"

    ```bash
    brew install vale
    ```

=== "Linux"

    ```bash
    sudo snap install vale
    ```

=== "Windows"

    ```powershell
    choco install vale
    ```

## Projeyi Klonlama

```bash
git clone https://github.com/KULLANICI_ADINIZ/Turkce-yazim-denetimi.git
cd Turkce-yazim-denetimi
```

## Testleri Çalıştırma

```bash
# Temiz dosya testi (0 hata beklenir)
vale --config=.vale.ini fixtures/clean.md

# Hatalı dosya testi (hatalar bulunmalı)
vale --config=.vale.ini fixtures/dirty.md
```

## Dizin Yapısı

```
Turkce-yazim-denetimi/
├── styles/
│   ├── Turkish/           # 16 kural dosyası (.yml)
│   ├── dictionaries/      # Hunspell Türkçe sözlük
│   └── config/            # Kelime listeleri
├── fixtures/              # Test dosyaları
│   ├── clean.md           # Hatasız örnek
│   └── dirty.md           # Hatalı örnek
├── hooks/                 # Kurulum betiği
├── scripts/               # Raporlama betikleri
└── .vale.ini              # Yapılandırma
```
