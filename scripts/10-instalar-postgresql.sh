#!/bin/bash
set -e

# Script para instalar PostgreSQL con Postgres.app en macOS
# Autor: Brayan Diaz C
# Fecha: 2 jul 2026

echo ""
echo "🐘 Iniciando la instalación de PostgreSQL (Postgres.app) en macOS..."

# [1/5] Verificar si Homebrew está instalado
echo "🍺 [1/5] Verificando si Homebrew está instalado..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew no está instalado. Instalándolo primero..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew ya está instalado."
fi

# [2/5] Instalar Postgres.app (cask)
echo "⬇️ [2/5] Instalando Postgres.app..."
brew update
brew install --cask postgres-unofficial

# [3/5] Configurar las herramientas de línea de comandos en el PATH
echo "⚙️ [3/5] Añadiendo psql y herramientas al PATH del sistema..."
sudo mkdir -p /etc/paths.d
echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp > /dev/null
echo "✅ PATH configurado (aplica en terminales nuevas)."

# [4/5] Abrir Postgres.app para inicializar el servidor
echo "▶️ [4/5] Abriendo Postgres.app..."
open -a Postgres || true
echo "⚠️ En la app, haz clic en \"Initialize\" para crear tu servidor (solo la primera vez)."

# [5/5] Instrucciones de verificación
echo "🔍 [5/5] Para verificar (en una terminal NUEVA, tras inicializar):"
echo "    psql --version"
echo "    psql   # entra con tu usuario de macOS a tu base de datos"

echo ""
echo "🎉 PostgreSQL (Postgres.app) ha sido instalado."
echo "ℹ️ Valores por defecto: host localhost, puerto 5432, usuario = tu usuario de macOS, sin contraseña."
