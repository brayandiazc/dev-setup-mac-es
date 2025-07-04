#!/bin/bash
set -e

# Script para instalar y configurar Python con pyenv en macOS
# Autor: Brayan Diaz C
# Fecha: 3 jul 2025

echo ""
echo "🐍 Iniciando el proceso de instalación y configuración de Python con pyenv en macOS..."

# [1/9] Verificar si Homebrew está instalado
echo "🍺 [1/9] Verificando si Homebrew está instalado..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew no está instalado. Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew ya está instalado."
fi

# [2/9] Instalar pyenv y pyenv-virtualenv usando Homebrew
echo "🔧 [2/9] Instalando pyenv y pyenv-virtualenv usando Homebrew..."
brew update
brew install pyenv pyenv-virtualenv

# [3/9] Añadir configuración a ~/.zprofile si no existe
echo "🧩 [3/9] Añadiendo configuración de pyenv a ~/.zprofile si es necesario..."
if ! grep -q 'pyenv init' ~/.zprofile 2>/dev/null; then
  {
    echo ''
    echo '# Configuración de pyenv'
    echo 'export PYENV_ROOT="$HOME/.pyenv"'
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"'
    echo 'eval "$(pyenv init --path)"'
    echo 'eval "$(pyenv init -)"'
    echo 'eval "$(pyenv virtualenv-init -)"'
  } >> ~/.zprofile
  echo "✅ Configuración añadida en ~/.zprofile"
else
  echo "ℹ️ ~/.zprofile ya contiene configuración de pyenv. Saltando."
fi

# [4/9] Mostrar algunas versiones recientes disponibles
echo "📜 [4/9] Estas son algunas versiones recientes de Python disponibles:"
pyenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 20

# [5/9] Sugerir la última versión estable y solicitar al usuario
python_latest=$(pyenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 Última versión estable detectada de Python: $python_latest"
echo
echo "🧠 Puedes escribir una versión específica (ej: 3.12.3)"
echo "👉 O presiona ENTER para instalar la última versión estable mostrada arriba."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p "¿Qué versión de Python deseas instalar?: " python_version
echo

if [[ -z "$python_version" ]]; then
  python_version=$python_latest
  echo "🔁 No se ingresó ninguna versión. Se instalará: $python_version"
else
  echo "📥 Se instalará Python $python_version según tu elección."
fi

# [6/9] Instalar y establecer la versión global
echo "⬇️ [6/9] Instalando Python $python_version..."
pyenv install "$python_version"
pyenv global "$python_version"

# [7/9] Verificar instalación
echo "🔍 [7/9] Verificando instalación de Python y pip..."
python --version
pip --version

# [8/9] Instrucciones para actualizar pyenv y plugins en el futuro
echo
echo "🛠️ [8/9] Para actualizar pyenv y pyenv-virtualenv en el futuro puedes ejecutar:"
echo "brew upgrade pyenv"
echo "brew upgrade pyenv-virtualenv"

# [9/9] Mensaje de recarga manual
echo
echo "🔁 [9/9] IMPORTANTE: Para usar Python y pyenv, **cierra y abre la terminal** o ejecuta:"
echo "    source ~/.zprofile"
echo "Luego podrás verificar con: python --version   y   pyenv --version"

echo
echo "🎉 Python $python_version ha sido instalado y configurado exitosamente con pyenv en macOS."