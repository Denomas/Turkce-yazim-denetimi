#!/usr/bin/env bash
# Türkçe Yazım Denetimi — Kurulum ve Çalıştırma Betiği
# Denomas (https://denomas.com)
# Vale motorunu doğru StylesPath ile çalıştırır.
# Pre-commit, GitHub Actions ve GitLab CI entegrasyonları bu betiği kullanır.
#
# Özellikler:
#   - Vale sistemde yoksa otomatik indirir (~/.local/bin/vale)
#   - StylesPath'i otomatik ayarlar
#   - VALE_TURKISH_NO_SPELLING=1 ile yazım denetimi kapatılabilir
#   - VALE_VERSION ile indirilen sürüm belirlenebilir (.github/vale-version dosyasından okunur)

set -euo pipefail

# Script'in kendi konumunu bul (pre-commit cache dizininde olabilir)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
STYLES_PATH="$REPO_DIR/styles"

# Vale sürümü — tek kaynak: .github/vale-version
DEFAULT_VALE_VERSION="3.14.1"
if [ -f "$REPO_DIR/.github/vale-version" ]; then
  DEFAULT_VALE_VERSION="$(cat "$REPO_DIR/.github/vale-version" | tr -d '[:space:]')"
fi
VALE_VERSION="${VALE_VERSION:-$DEFAULT_VALE_VERSION}"

# --- Vale'i bul veya indir ---
# Desteklenen platformlar ve Vale binary isimleri:
#
#   vale_VERSION_macOS_64-bit.tar.gz    - macOS Intel (x86_64)
#   vale_VERSION_macOS_arm64.tar.gz     - macOS Apple Silicon (M1/M2/M3)
#   vale_VERSION_Linux_64-bit.tar.gz    - Linux x86_64
#   vale_VERSION_Linux_arm64.tar.gz     - Linux ARM64 (Raspberry Pi, AWS Graviton vb.)
#   vale_VERSION_Windows_64-bit.zip     - Windows x86_64 (WSL/Git Bash/MSYS2 üzerinden)
#
# Desteklenmeyen: FreeBSD, OpenBSD, 32-bit (i386/i686), RISC-V, s390x, ppc64le
#
# Kurulum dizini:
#   Linux/macOS:  ~/.local/bin/vale
#   Windows:      ~/AppData/Local/vale/vale.exe

find_or_install_vale() {
  # 1. Sistemde kurulu mu? (PATH'te arama)
  if command -v vale &>/dev/null; then
    echo "vale"
    return 0
  fi

  # 2. Platform bilgisini al
  local kernel arch
  kernel="$(uname -s)"
  arch="$(uname -m)"

  # 3. Platform-spesifik kurulum dizinini belirle
  local local_bin vale_exe
  case "$kernel" in
    MINGW*|MSYS*|CYGWIN*|Windows_NT)
      # Windows (Git Bash / MSYS2 / Cygwin)
      local install_dir="${APPDATA:-${HOME}/AppData/Roaming}/vale"
      local_bin="${install_dir}"
      vale_exe="${install_dir}/vale.exe"
      ;;
    *)
      # Linux, macOS ve diğer Unix
      local_bin="${HOME}/.local/bin"
      vale_exe="${local_bin}/vale"
      ;;
  esac

  # 4. Daha önce indirilmiş mi?
  if [ -x "$vale_exe" ]; then
    echo "$vale_exe"
    return 0
  fi

  # 5. Otomatik indir
  echo "Vale bulunamadı, v${VALE_VERSION} indiriliyor..." >&2

  # İşletim sistemi adını Vale'in kullandığı formata çevir
  local os ext
  case "$kernel" in
    Linux)
      os="Linux"
      ext="tar.gz"
      ;;
    Darwin)
      os="macOS"
      ext="tar.gz"
      ;;
    MINGW*|MSYS*|CYGWIN*|Windows_NT)
      os="Windows"
      ext="zip"
      ;;
    FreeBSD|OpenBSD|NetBSD)
      echo "Hata: ${kernel} için Vale binary'si bulunmuyor." >&2
      echo "Alternatifler:" >&2
      echo "  - Go ile derleyin: go install github.com/errata-ai/vale/v3/cmd/vale@v${VALE_VERSION}" >&2
      echo "  - Docker kullanın: docker run --rm -v \$(pwd):/work jdkato/vale" >&2
      return 1
      ;;
    *)
      echo "Hata: Desteklenmeyen işletim sistemi: ${kernel}" >&2
      echo "Vale'i manuel kurun: https://vale.sh/docs/vale-cli/installation/" >&2
      return 1
      ;;
  esac

  # Mimari adını Vale'in kullandığı formata çevir
  local arch_label
  case "$arch" in
    x86_64|amd64)
      arch_label="64-bit"
      ;;
    arm64|aarch64)
      arch_label="arm64"
      ;;
    i386|i686)
      echo "Hata: 32-bit sistemler desteklenmiyor. Vale yalnızca 64-bit binary sunuyor." >&2
      return 1
      ;;
    *)
      echo "Hata: Desteklenmeyen işlemci mimarisi: ${arch}" >&2
      echo "Desteklenen mimariler: x86_64 (Intel/AMD 64-bit), arm64 (Apple Silicon, Graviton)" >&2
      return 1
      ;;
  esac

  local url="https://github.com/errata-ai/vale/releases/download/v${VALE_VERSION}/vale_${VALE_VERSION}_${os}_${arch_label}.${ext}"
  echo "İndiriliyor: ${url}" >&2

  local tmpdir
  tmpdir="$(mktemp -d)"
  # shellcheck disable=SC2064
  trap "rm -rf '${tmpdir}'" RETURN

  # İndir (curl veya wget)
  local archive="${tmpdir}/vale.${ext}"
  if command -v curl &>/dev/null; then
    curl -fsSL "$url" -o "$archive" || { echo "Hata: Vale indirilemedi: ${url}" >&2; return 1; }
  elif command -v wget &>/dev/null; then
    wget -q "$url" -O "$archive" || { echo "Hata: Vale indirilemedi: ${url}" >&2; return 1; }
  else
    echo "Hata: curl veya wget bulunamadı. Vale'i manuel kurun." >&2
    return 1
  fi

  # Arşivi aç (zip veya tar.gz)
  case "$ext" in
    tar.gz)
      tar -xzf "$archive" -C "$tmpdir"
      ;;
    zip)
      if command -v unzip &>/dev/null; then
        unzip -q "$archive" -d "$tmpdir"
      else
        echo "Hata: unzip bulunamadı. Windows'ta zip açmak için unzip gerekli." >&2
        return 1
      fi
      ;;
  esac

  # Kurulum dizinini oluştur ve binary'yi taşı
  mkdir -p "$local_bin"
  if [ "$os" = "Windows" ]; then
    mv "$tmpdir/vale.exe" "$vale_exe"
  else
    mv "$tmpdir/vale" "$vale_exe"
    chmod +x "$vale_exe"
  fi

  echo "Vale v${VALE_VERSION} başarıyla kuruldu: ${vale_exe}" >&2
  echo "  Platform: ${os} ${arch_label} (${kernel} ${arch})" >&2
  echo "$vale_exe"
}

VALE_BIN="$(find_or_install_vale)" || exit 1

# Styles dizini mevcut mu kontrol et
if [ ! -d "$STYLES_PATH/Turkish" ]; then
  echo "Hata: Turkish styles dizini bulunamadı: $STYLES_PATH/Turkish" >&2
  exit 1
fi

# Geçici .vale.ini oluştur
VALE_CONFIG=$(mktemp "${TMPDIR:-/tmp}/Turkce-yazim-denetimi-$$.XXXXXX.ini")
trap 'rm -f "$VALE_CONFIG"' EXIT

# Spelling kuralını devre dışı bırakma seçeneği (CI ortamları için)
SPELLING_LINE=""
if [ "${VALE_TURKISH_NO_SPELLING:-0}" = "1" ]; then
  SPELLING_LINE="Turkish.Spelling = NO"
fi

cat > "$VALE_CONFIG" <<EOF
StylesPath = ${STYLES_PATH}
MinAlertLevel = suggestion
Vocab = Turkish

[*.md]
BasedOnStyles = Turkish
${SPELLING_LINE}

[*.rst]
BasedOnStyles = Turkish
${SPELLING_LINE}

[*.adoc]
BasedOnStyles = Turkish
${SPELLING_LINE}

[*.html]
BasedOnStyles = Turkish
${SPELLING_LINE}

[*.txt]
BasedOnStyles = Turkish
${SPELLING_LINE}

[*.org]
BasedOnStyles = Turkish
${SPELLING_LINE}
EOF

# Tüm argümanları vale'e ilet
"$VALE_BIN" --config="$VALE_CONFIG" "$@"
