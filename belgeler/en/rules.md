# Rules Reference

Vale Turkish includes 16 rules organized in 6 categories.

## Rule Table

| Rule | Type | Description | Level |
|------|------|-------------|-------|
| `Turkish.BitisikYazim` | substitution | Joined/separate writing rules | error |
| `Turkish.Buyukharf` | existence | Proper noun capitalization | warning |
| `Turkish.CumleBasi` | capitalization | Sentence-initial capitals | error |
| `Turkish.DeDABaglaci` | existence | de/da conjunction check | warning |
| `Turkish.KiEki` | substitution | ki conjunction check | warning |
| `Turkish.Noktalama` | existence | Punctuation marks | error |
| `Turkish.Spelling` | spelling | Hunspell Turkish dictionary | error |
| `Turkish.Tekrar` | repetition | Word repetition | warning |
| `Turkish.YanlisTurkce` | substitution | Common misspellings | error |
| `Turkish.Plaza` | substitution | Corporate jargon cleanup | warning |
| `Turkish.Akademik` | substitution | Academic language simplification | suggestion |
| `Turkish.Fabrika` | substitution | Factory/industrial jargon | warning |
| `Turkish.Teknik` | substitution | Technical term standardization | error |
| `Turkish.Sadelik` | substitution | General simplification | suggestion |
| `Turkish.Deyimler` | substitution | Idiom correctness | error |
| `Turkish.UzunCumle` | existence | Long sentence warning (30+ words) | warning |

## Categories

### Spelling Rules
Handles Turkish-specific spelling patterns like joined/separate writing (`birşey` → `bir şey`), capitalization of proper nouns (`istanbul` → `İstanbul`), and conjunction rules.

### Hunspell Dictionary
36 MB Turkish dictionary with verb conjugation regex filters to reduce false positives. Custom vocabulary via `accept.txt`.

### Plaza Language (Corporate Jargon)
Detects unnecessary English loanwords in business Turkish: `deadline` → `son teslim tarihi`, `feedback` → `geri bildirim`.

### Academic Language
Simplifies overly formal academic Turkish: `mamafih` → `bununla birlikte`.

### Technical Terms
Enforces standard capitalization of technical terms: `Nextjs` → `Next.js`, `Macos` → `macOS`, `Github` → `GitHub`.

### Readability
Warns when sentences exceed 30 words, detects word repetitions.

## Supported File Formats

| Format | Extension |
|--------|-----------|
| Markdown | `.md` |
| reStructuredText | `.rst` |
| AsciiDoc | `.adoc` |
| HTML | `.html` |
| Plain text | `.txt` |
| Org Mode | `.org` |
