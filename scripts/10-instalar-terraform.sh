#!/bin/bash
set -e

# Script para instalar Terraform en macOS con Homebrew
# Autor: Brayan Diaz C
# Fecha: 3 jul 2025

echo ""
echo "🌍 Iniciando la instalación de Terraform en macOS..."

# [1/5] Verificar si Homebrew está instalado
echo "🍺 [1/5] Verificando si Homebrew está instalado..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew no está instalado. Instalándolo primero..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew ya está instalado."
fi

# [2/5] Añadir el tap oficial de HashiCorp (si no existe)
echo "➕ [2/5] Añadiendo el tap oficial de HashiCorp..."
brew tap | grep -q "^hashicorp/tap$" || brew tap hashicorp/tap

# [3/5] Instalar Terraform
echo "⬇️ [3/5] Instalando Terraform con Homebrew..."
brew install hashicorp/tap/terraform

# [4/5] Verificar instalación
echo "🔍 [4/5] Verificando instalación de Terraform..."
terraform -version

# [5/5] Mensaje final
echo
echo "🎉 [5/5] Terraform ha sido instalado correctamente en macOS."
echo "Puedes crear una carpeta de trabajo y probar con:"
echo "    mkdir prueba-terraform"
echo "    cd prueba-terraform"
echo "    echo 'terraform { required_version = \">= 1.0.0\" }' > main.tf"
echo "    terraform init"

echo ""
echo "Recuerda consultar la documentación oficial: https://developer.hashicorp.com/terraform/docs"