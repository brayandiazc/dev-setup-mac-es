#!/bin/bash
set -e

# Script para instalar y configurar Node.js con nodenv en macOS
# Autor: Brayan Diaz C
# Fecha: 3 jul 2025

echo ""
echo "🟢 Iniciando el proceso de instalación y configuración de Node.js con nodenv en macOS..."

# [1/9] Verificar si Homebrew está instalado
echo "🍺 [1/9] Verificando si Homebrew está instalado..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew no está instalado. Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew ya está instalado."
fi

# [2/9] Instalar nodenv y node-build usando Homebrew
echo "🔧 [2/9] Instalando nodenv y node-build usando Homebrew..."
brew update
brew install nodenv node-build

# [3/9] Añadir configuración a ~/.zprofile si no existe
echo "🧩 [3/9] Añadiendo configuración de nodenv a ~/.zprofile si es necesario..."
if ! grep -q 'nodenv init' ~/.zprofile 2>/dev/null; then
  {
    echo ''
    echo '# Configuración de nodenv'
    echo 'export PATH="$HOME/.nodenv/bin:$PATH"'
    echo 'eval "$(nodenv init -)"'
    echo 'export PATH="$HOME/.nodenv/plugins/node-build/bin:$PATH"'
  } >> ~/.zprofile
  echo "✅ Configuración añadida en ~/.zprofile"
else
  echo "ℹ️ ~/.zprofile ya contiene configuración de nodenv. Saltando."
fi

# [4/9] Mostrar algunas versiones recientes disponibles
echo "📜 [4/9] Estas son algunas versiones recientes de Node.js disponibles:"
nodenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 20

# [5/9] Sugerir la última versión estable y solicitar al usuario
node_latest=$(nodenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 Última versión estable detectada de Node.js: $node_latest"
echo
echo "🧠 Puedes escribir una versión específica (ej: 20.17.0)"
echo "👉 O presiona ENTER para instalar la última versión estable mostrada arriba."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p "¿Qué versión de Node.js deseas instalar?: " node_version
echo

if [[ -z "$node_version" ]]; then
  node_version=$node_latest
  echo "🔁 No se ingresó ninguna versión. Se instalará: $node_version"
else
  echo "📥 Se instalará Node.js $node_version según tu elección."
fi

# [6/9] Instalar y establecer la versión global
echo "⬇️ [6/9] Instalando Node.js $node_version..."
nodenv install "$node_version"
nodenv global "$node_version"

# [7/9] Mensaje importante de recarga
echo
echo "🔁 [7/9] IMPORTANTE: Para usar Node.js y npm, **cierra y abre la terminal** o ejecuta:"
echo "    source ~/.zprofile"
echo "Luego podrás verificar con: node -v   y   npm -v"

# [8/9] Instrucciones para actualizar nodenv y node-build en el futuro
echo
echo "🛠️ [8/9] Para actualizar nodenv y node-build en el futuro puedes ejecutar:"
echo "brew upgrade nodenv"
echo "brew upgrade node-build"

echo
echo "🎉 Node.js $node_version ha sido instalado y configurado exitosamente con nodenv en macOS."