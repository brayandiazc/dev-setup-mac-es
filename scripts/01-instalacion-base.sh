#!/bin/bash
set -e

# Script para configurar el entorno de desarrollo en macOS
# Autor: Brayan Diaz C
# Fecha: 2 jul 2025

echo ""
echo "🍎 Iniciando la configuración del entorno de desarrollo en macOS..."

# [1/7] Instalar Homebrew si no está instalado
echo "🍺 [1/7] Verificando e instalando Homebrew si es necesario..."
if ! command -v brew &> /dev/null; then
  echo "🔧 Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew ya está instalado."
fi

# [2/7] Configurar el PATH para Homebrew (Apple Silicon por defecto)
echo "🛣️ [2/7] Configurando el PATH para Homebrew en ~/.zprofile y en la sesión actual..."
if ! grep -q 'brew shellenv' ~/.zprofile 2>/dev/null; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# [3/7] Verificar la instalación de Homebrew
echo "🔍 [3/7] Verificando la instalación de Homebrew..."
brew --version

# [4/7] Actualizar Homebrew
echo "🔄 [4/7] Actualizando Homebrew..."
brew update

# [5/7] Instalar herramientas esenciales de desarrollo
echo "🛠️ [5/7] Instalando herramientas esenciales de desarrollo con Homebrew..."
brew install \
  git \
  wget \
  curl \
  openssl \
  readline \
  libyaml \
  libffi \
  xz \
  zlib \
  sqlite3 \
  libpq \
  cmake \
  tree \
  pkg-config \
  llvm \
  imagemagick \
  libxml2 \
  libxslt \
  libvips \
  ffmpeg \
  webp \
  poppler

# [6/7] Verificar instalación de Xcode Command Line Tools
echo "🧰 [6/7] Verificando instalación de Xcode Command Line Tools..."
if ! xcode-select -p &> /dev/null; then
  echo "🛠️ Instalando Xcode Command Line Tools..."
  xcode-select --install
else
  echo "✅ Xcode Command Line Tools ya están instaladas."
fi

# [7/7] Sugerencia de limpieza de paquetes antiguos
echo "🧹 [7/7] (Opcional) Puedes limpiar paquetes antiguos con: brew cleanup"

echo ""
echo "🎉 Entorno base configurado correctamente en macOS"
echo "➡️ Continúa con los demás scripts desde la carpeta scripts/ (ej: ./02-instalar-zsh.sh)"