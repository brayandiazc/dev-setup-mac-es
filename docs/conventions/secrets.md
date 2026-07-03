# Convenciones de Secretos

> Reglas de manejo de secretos y credenciales en dev-setup-mac-es.
> **Última actualización**: 2026-07-03

## Alcance

Cualquier dato sensible que pueda aparecer al usar o contribuir al proyecto:
claves SSH, tokens, contraseñas y certificados.

## Reglas

- **Nunca** commitees secretos en texto plano (claves de API, tokens, contraseñas,
  certificados o claves privadas).
- Los patrones sensibles (`.env`, `*.pem`, `*.key`, `id_rsa`, `id_ed25519`) están
  cubiertos por [`.gitignore`](../../.gitignore). No los fuerces al índice.
- Ningún script debe pedir ni almacenar contraseñas de servicios externos.
- El script `05-instalar-ssh.sh` genera claves SSH **en la máquina del usuario**:
  la clave privada nunca sale del equipo y solo la **pública** se pega en GitHub.
- Si un secreto se filtra por error, **rota el secreto antes de limpiar la historia**:
  reescribir el historial no basta, asume que ya está comprometido.

## Referencias

- [SECURITY.md](../../SECURITY.md)
- [GitHub — Conexión con SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
