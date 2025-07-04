#!/bin/bash
set -e

# Script para configurar plugins en Oh My Zsh en macOS
# Autor: Brayan Diaz C
# Fecha: 2 jul 2025

echo ""
echo "🔧 [1/5] Instalando plugins zsh-syntax-highlighting y zsh-autosuggestions con Homebrew..."
brew install zsh-syntax-highlighting zsh-autosuggestions

echo "⚙️ [2/5] Configurando línea de plugins en ~/.zshrc..."
PLUGINS_LINE='plugins=(aws azure bundler colorize docker docker-compose gcloud gem git heroku history-substring-search node nodenv npm pip postgres pyenv python rails react-native rbenv ruby vscode)'
if grep -q "^plugins=" ~/.zshrc; then
  sed -i '' "s/^plugins=.*/$PLUGINS_LINE/" ~/.zshrc
else
  echo "$PLUGINS_LINE" >> ~/.zshrc
fi

echo "🔗 [3/5] Añadiendo sources de plugins a ~/.zshrc si es necesario..."
ZSH_HL='source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
ZSH_AUTOSUG='source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh'

if ! grep -q "zsh-syntax-highlighting.zsh" ~/.zshrc; then
  echo "$ZSH_HL" >> ~/.zshrc
fi
if ! grep -q "zsh-autosuggestions.zsh" ~/.zshrc; then
  echo "$ZSH_AUTOSUG" >> ~/.zshrc
fi

echo "🔁 [4/5] Para aplicar los cambios, cierra y abre una nueva terminal o ejecuta 'source ~/.zshrc' manualmente."

echo ""
echo "🎉 [5/5] Configuración avanzada de plugins Oh My Zsh completada en macOS."