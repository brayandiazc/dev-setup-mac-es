#!/bin/bash
set -e

# Script para instalar Docker Desktop en macOS
# Autor: Brayan Diaz C
# Fecha: 2 jul 2026

echo ""
echo "🐳 Iniciando la instalación de Docker Desktop en macOS..."

# [1/4] Verificar si Homebrew está instalado
echo "🍺 [1/4] Verificando si Homebrew está instalado..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew no está instalado. Instalándolo primero..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew ya está instalado."
fi

# [2/4] Instalar Docker Desktop (cask)
echo "⬇️ [2/4] Instalando Docker Desktop..."
brew update
brew install --cask docker-desktop

# [3/4] Abrir Docker Desktop para el primer arranque
echo "▶️ [3/4] Abriendo Docker Desktop..."
open -a Docker || true
echo "⚠️ Completa el primer arranque en la app (acuerdo de servicio y permisos)."
echo "   Docker funciona mientras la ballena esté en la barra de menú."

# [4/4] Instrucciones de verificación
echo "🔍 [4/4] Para verificar (cuando la ballena esté quieta):"
echo "    docker --version"
echo "    docker compose version"
echo "    docker run hello-world"

echo ""
echo "🎉 Docker Desktop ha sido instalado."
echo "ℹ️ Incluye Docker Compose. Activa el arranque automático en Settings → General si lo usas a diario."
