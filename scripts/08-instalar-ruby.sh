#!/usr/bin/env bash
set -e

# Script para instalar y configurar Ruby con rbenv en macOS
# Autor: Brayan Diaz C
# Fecha: 3 jul 2025

echo ""
echo "💎 Iniciando el proceso de instalación y configuración de Ruby con rbenv en macOS..."

# [1/10] Verificar si Homebrew está instalado
echo "🍺 [1/10] Verificando si Homebrew está instalado..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew no está instalado. Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew ya está instalado."
fi

# [2/10] Instalar rbenv y ruby-build con Homebrew
echo "🔧 [2/10] Instalando rbenv y ruby-build usando Homebrew..."
brew update
brew install rbenv ruby-build

# [3/10] Agregar configuración a ~/.zprofile si no existe
echo "🧩 [3/10] Añadiendo configuración de rbenv a ~/.zprofile si es necesario..."
if ! grep -q 'rbenv init' ~/.zprofile 2>/dev/null; then
  {
    echo ''
    echo '# Configuración de rbenv'
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"'
    echo 'eval "$(rbenv init -)"'
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"'
  } >> ~/.zprofile
  echo "✅ Configuración añadida en ~/.zprofile"
else
  echo "ℹ️ ~/.zprofile ya contiene configuración de rbenv. Saltando."
fi

# [4/10] Mostrar versiones disponibles de Ruby
echo "📜 [4/10] Estas son las versiones de Ruby disponibles:"
rbenv install --list

# [5/10] Sugerir la última versión estable
ruby_latest=$(rbenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 ¡Atención! Se ha detectado que la última versión estable disponible es: $ruby_latest"
echo
echo "🧠 Puedes escribir una versión específica para instalarla (por ejemplo: 3.1.4)"
echo "👉 O simplemente presiona ENTER para instalar la última versión estable mostrada arriba."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p "¿Qué versión de Ruby deseas instalar?: " ruby_version
echo

if [[ -z "$ruby_version" ]]; then
  ruby_version=$ruby_latest
  echo "🔁 No se ingresó ninguna versión. Se instalará: $ruby_version"
else
  echo "📥 Se instalará Ruby $ruby_version según tu elección."
fi

# [6/10] Instalar la versión seleccionada y configurarla como global
echo "⬇️ [6/10] Instalando Ruby $ruby_version..."
rbenv install "$ruby_version"
rbenv global "$ruby_version"

# [7/10] Verificar instalación de Ruby
echo "🔍 [7/10] Verificando instalación de Ruby..."
ruby -v

# [8/10] Instalar Bundler y actualizar RubyGems
echo "📦 [8/10] Instalando Bundler y actualizando RubyGems..."
gem install bundler
gem update --system

# [9/10] Instrucciones para actualizar rbenv y ruby-build en el futuro
echo
echo "🛠️ [9/10] Para actualizar rbenv y ruby-build en el futuro puedes ejecutar:"
echo "brew upgrade rbenv"
echo "brew upgrade ruby-build"

# [10/10] Mensaje de recarga manual
echo
echo "🔁 [10/10] IMPORTANTE: Para usar Ruby y rbenv, **cierra y abre la terminal** o ejecuta:"
echo "    source ~/.zprofile"
echo "Luego podrás verificar con: ruby -v   y   rbenv -v"

echo
echo "🎉 Ruby $ruby_version ha sido instalado y configurado exitosamente con rbenv en macOS."