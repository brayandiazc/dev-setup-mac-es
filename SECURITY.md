# Política de Seguridad

Este documento describe cómo reportar vulnerabilidades en **dev-setup-mac-es** y qué prácticas de seguridad seguimos en el repositorio.

## Tabla de Contenidos

- [Reporte de Vulnerabilidades](#reporte-de-vulnerabilidades)
- [Versiones Soportadas](#versiones-soportadas)
- [Alcance](#alcance)
- [Fuera de Alcance](#fuera-de-alcance)
- [Consideraciones de Seguridad de los Scripts](#consideraciones-de-seguridad-de-los-scripts)
- [Manejo de Secretos](#manejo-de-secretos)
- [Contacto](#contacto)

## Reporte de Vulnerabilidades

Si descubres una vulnerabilidad de seguridad, **no abras un issue público**. Repórtala de forma privada por uno de estos canales:

- **Email**: <brayandiazc@gmail.com> (usa un asunto que empiece con `Security:` para priorizarlo).
- **GitHub Security Advisories**: pestaña _Security_ del repositorio → _Report a vulnerability_.

Incluye una descripción clara, los pasos para reproducirla, el script y commit afectados y, si lo deseas, cómo quieres ser acreditado.

## Versiones Soportadas

| Versión                 | Soporte de seguridad |
| ----------------------- | -------------------- |
| `main` (rama principal) | Sí                   |
| Último release / tag    | Sí                   |
| Releases anteriores     | No                   |

## Alcance

Superficies **en alcance** para reportes de seguridad:

- Los scripts de `scripts/` (comandos que ejecutan, fuentes que descargan, permisos que solicitan).
- Los workflows de CI/CD del repositorio, si existieran (`.github/workflows/`).

Ejemplos de hallazgos de interés:

- Descarga y ejecución de código desde fuentes no verificadas o inseguras (HTTP en lugar de HTTPS).
- Uso innecesario o inseguro de `sudo`.
- Comandos que podrían sobrescribir configuración del usuario sin consentimiento.
- Inclusión accidental de secretos o credenciales en el repositorio.

## Fuera de Alcance

- Vulnerabilidades en el software de terceros que instalan los scripts (repórtalas a cada proyecto: Homebrew, Docker, PostgreSQL, etc.).
- Reportes de escáneres automáticos sin impacto demostrado.
- Ingeniería social o phishing.

## Consideraciones de Seguridad de los Scripts

- Los scripts descargan e instalan software; **revisa siempre su contenido antes de ejecutarlos**.
- Las descargas se hacen desde fuentes oficiales y por HTTPS (Homebrew, SDKMAN!, Postgres.app, Docker).
- El uso de `sudo` se limita a lo estrictamente necesario y se indica al usuario.
- Ningún script pide ni almacena contraseñas de servicios externos.

## Manejo de Secretos

- **Nunca** commitees secretos en texto plano (claves de API, tokens, contraseñas, certificados o claves privadas).
- El script `05-instalar-ssh.sh` genera claves SSH en tu máquina; **la clave privada nunca sale de tu equipo** y no debe subirse al repositorio.
- Los archivos sensibles (`*.pem`, `*.key`, `.env`) están cubiertos por [`.gitignore`](.gitignore).
- Si un secreto se filtra por error, **rota el secreto antes de limpiar la historia**: asume que ya está comprometido.

## Contacto

- **Reportes de seguridad**: <brayandiazc@gmail.com> (asunto: `Security: …`)

---

> Versión: 1.0 — Última actualización: 2026-07-03
