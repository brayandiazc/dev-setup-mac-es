# 🍎 Configuración de Entorno de Desarrollo para macOS

Este repositorio contiene una colección de scripts automatizados para configurar un entorno de desarrollo completo en macOS. Todos los scripts están diseñados para ser ejecutados secuencialmente y configurar herramientas esenciales para el desarrollo de software.

## 📋 Prerrequisitos

- macOS (compatible con Apple Silicon y Intel)
- Conexión a internet
- Terminal con permisos de administrador

## 🚀 Instalación Rápida

### Opción 1: Instalación Automática Completa

```bash
# Clonar el repositorio
git clone <url-del-repositorio>
cd dev-setup-mac-es

# Dar permisos de ejecución a todos los scripts
chmod +x scripts/*.sh

# Ejecutar todos los scripts en orden
./scripts/01-instalacion-base.sh
./scripts/02-instalar-zsh.sh
./scripts/03-configurar-zsh.sh
./scripts/04-instalar-git.sh
./scripts/05-instalar-ssh.sh
./scripts/06-instalar-ruby.sh
./scripts/07-instalar-node.sh
./scripts/08-instalar-python.sh
./scripts/09-instalar-kubernetes.sh
./scripts/10-instalar-terraform.sh
```

### Opción 2: Instalación Selectiva

Puedes ejecutar solo los scripts que necesites según tus requerimientos de desarrollo.

## 📦 Herramientas Instaladas

### 🔧 **01-instalacion-base.sh** - Configuración Base

- **Homebrew**: Gestor de paquetes para macOS
- **Xcode Command Line Tools**: Herramientas de desarrollo de Apple
- **Herramientas esenciales**: git, wget, curl, openssl, readline, libyaml, libffi, xz, zlib, sqlite3, libpq, cmake, tree, pkg-config, llvm, imagemagick, libxml2, libxslt, libvips, ffmpeg, webp, poppler

### 🖥️ **02-instalar-zsh.sh** - Shell Avanzado

- **Zsh**: Shell mejorado
- **Oh My Zsh**: Framework para gestionar la configuración de Zsh

### ⚙️ **03-configurar-zsh.sh** - Configuración Avanzada de Zsh

- **Plugins de sintaxis**: zsh-syntax-highlighting
- **Autocompletado**: zsh-autosuggestions
- **Plugins adicionales**: aws, azure, bundler, colorize, docker, docker-compose, gcloud, gem, git, heroku, history-substring-search, node, nodenv, npm, pip, postgres, pyenv, python, rails, react-native, rbenv, ruby, vscode

### 🔧 **04-instalar-git.sh** - Control de Versiones

- **Git**: Sistema de control de versiones
- **Configuración global**: Usuario, email, colores, rama principal
- **Plantilla de commits**: Configuración opcional de mensajes de commit

### 🔐 **05-instalar-ssh.sh** - Seguridad y Conectividad

- **SSH**: Protocolo de conexión segura
- **Configuración de claves**: Generación y configuración de claves SSH

### 💎 **06-instalar-ruby.sh** - Desarrollo Ruby

- **rbenv**: Gestor de versiones de Ruby
- **Ruby**: Lenguaje de programación
- **Bundler**: Gestor de dependencias de Ruby
- **RubyGems**: Sistema de paquetes de Ruby

### 🟢 **07-instalar-node.sh** - Desarrollo JavaScript/Node.js

- **nodenv**: Gestor de versiones de Node.js
- **Node.js**: Runtime de JavaScript
- **npm**: Gestor de paquetes de Node.js

### 🐍 **08-instalar-python.sh** - Desarrollo Python

- **pyenv**: Gestor de versiones de Python
- **pyenv-virtualenv**: Plugin para entornos virtuales
- **Python**: Lenguaje de programación
- **pip**: Gestor de paquetes de Python

### 🚀 **09-instalar-kubernetes.sh** - Orquestación de Contenedores

- **kubectl**: Cliente de línea de comandos para Kubernetes
- **minikube**: Clúster local de Kubernetes para desarrollo

### 🌍 **10-instalar-terraform.sh** - Infraestructura como Código

- **Terraform**: Herramienta de infraestructura como código de HashiCorp

## 📝 Notas Importantes

### 🔄 Recarga de Terminal

Después de ejecutar los scripts de instalación de lenguajes (Ruby, Node.js, Python, Java), **es necesario cerrar y abrir la terminal** o ejecutar:

```bash
source ~/.zprofile
```

### 🛠️ Actualizaciones

Para mantener las herramientas actualizadas:

```bash
# Homebrew
brew update && brew upgrade

# rbenv y ruby-build
brew upgrade rbenv ruby-build

# nodenv y node-build
brew upgrade nodenv node-build

# pyenv y pyenv-virtualenv
brew upgrade pyenv pyenv-virtualenv


```

### 🔧 Verificación de Instalaciones

Puedes verificar que todo esté funcionando correctamente con:

```bash
# Verificar versiones instaladas
ruby -v
node -v
python --version
kubectl version --client
terraform -version
```

## 🎯 Casos de Uso

### Desarrollo Web Full-Stack

1. Ejecuta los scripts 01-04 para la configuración base
2. Ejecuta 06-08 para Ruby, Node.js y Python
3. Configura tu editor preferido (VS Code, Sublime Text, etc.)

### Desarrollo DevOps/Cloud

1. Ejecuta todos los scripts en orden
2. Configura credenciales de AWS, Azure, GCP según necesites
3. Configura kubectl para tus clústeres de Kubernetes

## 🤝 Contribuciones

Si encuentras algún problema o quieres agregar nuevas herramientas, por favor:

1. Abre un issue describiendo el problema o la mejora
2. Crea un fork del repositorio
3. Desarrolla tu solución en una rama separada
4. Envía un pull request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👨‍💻 Autor

**Brayan Diaz C** - Desarrollador de software y DevOps Engineer

---

## 🆘 Solución de Problemas

### Error: "Homebrew no está instalado"

Si el script de instalación base falla, puedes instalar Homebrew manualmente:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Error: "Permission denied"

Asegúrate de dar permisos de ejecución a los scripts:

```bash
chmod +x scripts/*.sh
```

### Error: "Xcode Command Line Tools"

Si tienes problemas con las herramientas de línea de comandos:

```bash
xcode-select --install
```

### Problemas con PATH

Si las herramientas no se encuentran después de la instalación:

```bash
source ~/.zprofile
# o
source ~/.zshrc
```

---

**¡Disfruta de tu nuevo entorno de desarrollo en macOS! 🎉**
