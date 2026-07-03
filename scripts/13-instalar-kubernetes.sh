#!/usr/bin/env bash
set -e

# Script para instalar kubectl y minikube en macOS con Homebrew
# Autor: Brayan Diaz C
# Fecha: 3 jul 2025

echo ""
echo "🚀 Iniciando instalación de herramientas Kubernetes (kubectl + minikube) en macOS..."

# [1/8] Verificar Homebrew
echo "🍺 [1/8] Verificando si Homebrew está instalado..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew no está instalado. Instalándolo primero..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew ya está instalado."
fi

# [2/8] Instalar kubectl con Homebrew
echo "📦 [2/8] Instalando kubectl con Homebrew..."
brew install kubectl

# [3/8] Verificar instalación de kubectl
echo "🔍 [3/8] Verificando instalación de kubectl..."
kubectl version --client

# [4/8] Instalar minikube con Homebrew
echo "📦 [4/8] Instalando minikube con Homebrew..."
brew install minikube

# [5/8] Verificar instalación de minikube
echo "🔍 [5/8] Verificando instalación de minikube..."
minikube version

# [6/8] Mostrar ayuda de kubectl y minikube (opcional)
echo "ℹ️ [6/8] Puedes ver los comandos disponibles con:"
echo "    kubectl --help"
echo "    minikube --help"

# [7/8] Ejemplo de inicio de clúster y addons recomendados
echo ""
echo "🔗 [7/8] Para iniciar un clúster y habilitar complementos útiles:"
echo "    minikube start --driver=docker"
echo "    minikube addons list"
echo ""
echo "Para mejorar la funcionalidad puedes habilitar algunos addons:"
echo "    minikube addons enable registry"
echo "    eval \$(minikube docker-env)"
echo "    minikube addons enable metrics-server"

# [8/8] Mensaje final
echo ""
echo "🎉 [8/8] Instalación completada exitosamente."
echo "Ya puedes comenzar a trabajar con Kubernetes localmente en macOS 🚀"