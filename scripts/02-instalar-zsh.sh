#!/bin/bash
set -e

# Script para instalar y configurar Oh My Zsh en macOS
# Autor: Brayan Diaz C
# Fecha: 2 jul 2025

echo ""
echo "🖥️ Iniciando la instalación de Zsh y Oh My Zsh en macOS..."

# [1/4] Verificar si Zsh está instalado
echo "🔎 [1/4] Verificando si Zsh está instalado..."
if command -v zsh &> /dev/null; then
  echo "✅ Zsh ya está instalado. Versión: $(zsh --version)"
else
  echo "📥 Instalando Zsh con Homebrew..."
  brew install zsh
fi

# [2/4] Cambiar el shell por defecto a Zsh si aún no lo es
echo "⚙️ [2/4] Verificando si Zsh es el shell por defecto..."
if [[ "$SHELL" != *"zsh"* ]]; then
  echo "🔄 Cambiando el shell por defecto a Zsh..."
  chsh -s "$(command -v zsh)"
else
  echo "✅ Zsh ya es tu shell por defecto."
fi

# [3/4] Instalar Oh My Zsh si no está instalado
echo "🎩 [3/4] Verificando e instalando Oh My Zsh..."
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  echo "✅ Oh My Zsh ya está instalado."
else
  echo "📥 Instalando Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# [4/4] Mensaje final
echo ""
echo "🎉 Zsh y Oh My Zsh están listos en macOS"
echo "💡 Cierra y vuelve a abrir tu terminal para aplicar los cambios."