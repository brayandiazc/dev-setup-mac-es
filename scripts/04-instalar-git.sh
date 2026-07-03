#!/usr/bin/env bash
set -e

# Script para instalar y configurar Git en macOS
# Autor: Brayan Diaz C
# Fecha: 3 jul 2025

echo ""
echo "🔧 Iniciando la instalación y configuración de Git en macOS..."

# [1/8] Verificar si Git está instalado
echo "🔍 [1/8] Verificando si Git está instalado..."
if command -v git &>/dev/null; then
  echo "✅ Git ya está instalado: $(git --version)"
else
  echo "📥 Git no está instalado. Instalando con Homebrew..."
  if ! command -v brew &>/dev/null; then
    echo "❌ Homebrew no está instalado. Instala Homebrew antes de continuar."
    exit 1
  fi
  brew install git
fi

# [2/8] Verificar instalación de Git
echo "🔎 [2/8] Verificando la versión de Git instalada..."
git --version

# [3/8] Configuración global básica de Git
echo "⚙️ [3/8] Iniciando configuración global de Git..."

echo "🎨 Habilitando colores en la salida de Git..."
git config --global color.ui true

# [4/8] Configurar nombre de usuario
while [[ -z "$git_user_name" ]]; do
  read -p "🧑 [4/8] Introduce tu nombre de usuario para Git: " git_user_name
done
git config --global user.name "$git_user_name"
echo "✅ Nombre configurado como: $git_user_name"

# [5/8] Configurar correo electrónico
while [[ -z "$git_user_email" ]]; do
  read -p "📧 [5/8] Introduce tu correo electrónico para Git: " git_user_email
done
git config --global user.email "$git_user_email"
echo "✅ Correo configurado como: $git_user_email"

# [6/8] Configurar rama principal por defecto
echo "🌿 [6/8] Estableciendo 'main' como rama principal por defecto..."
git config --global init.defaultBranch main

# [7/8] Configurar plantilla de mensaje de commit (opcional)
echo "📝 [7/8] Configuración opcional de plantilla de mensaje de commit..."
read -p "¿Deseas usar una plantilla de mensajes de commit recomendada? (y/n): " usar_plantilla
if [[ "$usar_plantilla" =~ ^[yY]$ ]]; then
    echo "📥 Descargando plantilla desde GitHub..."
    curl -fsSL https://raw.githubusercontent.com/brayandiazc/gitmessage-template-es/main/.gitmessage -o ~/.gitmessage
    git config --global commit.template ~/.gitmessage
    echo "📄 Plantilla configurada. Este es su contenido:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    cat ~/.gitmessage
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    echo "🧠 Recuerda que esta plantilla se abrirá cada vez que ejecutes:"
    echo "   git commit"
    echo "Y deberás escribir tu mensaje debajo de las instrucciones visibles."
else
    echo "❌ Plantilla no configurada. Puedes añadirla manualmente más tarde si lo deseas."
fi

# [8/8] Mostrar configuración actual
echo
echo "📋 [8/8] Este es el contenido actual de tu archivo ~/.gitconfig:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
cat ~/.gitconfig
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo ""
echo "🎉 Git ha sido instalado y configurado exitosamente en macOS."
echo "🚀 Ahora puedes comenzar a usar Git en tu sistema."