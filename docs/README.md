# Documentación de dev-setup-mac-es

Mapa de la documentación del proyecto. Empieza por aquí para saber qué documento
responde cada pregunta.

| Documento                                                      | Pregunta que responde              | Cuándo leerlo                     |
| -------------------------------------------------------------- | ---------------------------------- | --------------------------------- |
| [`architecture/architecture.md`](architecture/architecture.md) | ¿Cómo está organizado el repo?     | Para entender el panorama general |
| [`architecture/stack.md`](architecture/stack.md)               | ¿Qué instala cada script?          | Para saber qué queda en tu Mac    |
| [`decisions/`](decisions/README.md)                            | ¿Por qué se tomó cada decisión?    | Antes de re-debatir algo          |
| [`conventions/`](conventions/README.md)                        | ¿Cómo se escriben los scripts?     | Antes de contribuir un script     |
| [`glossary.md`](glossary.md)                                   | ¿Qué significa cada término?       | Ante vocabulario desconocido      |

## Sobre la distinción `architecture/` vs `conventions/`

- **`architecture/`** describe **este** proyecto en concreto (cómo está organizado
  el repo, qué instala cada script).
- **`conventions/`** describe **reglas reusables** de cómo trabajamos (cómo se
  escribe un script, cómo se manejan los secretos) — transversales a cualquier
  script.

## Cómo mantener esta documentación

- Actualiza la línea **"Última actualización"** al editar un documento.
- Registra las decisiones relevantes como [ADRs](decisions/README.md).
- Mantén este índice al día si agregas o quitas documentos.
