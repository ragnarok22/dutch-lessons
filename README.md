# Guía y plan de estudios de holandés (A1)

Este proyecto en LaTeX reúne una guía autodidacta de 20 capítulos más un capítulo 0 sobre cómo aprender idiomas. Todo el contenido está pensado para hispanohablantes que empiezan neerlandés.

## Estructura
- `main.tex`: documento principal; configura paquetes y ordena los capítulos.
- `chapters/00_metodologia/`: carpeta del capítulo 0 (aprendizaje); contiene `main.tex`.
- `chapters/01_pronunciacion/` ... `chapters/20_repaso_a1/`: cada capítulo en su carpeta, con `main.tex` y espacio para sub-secciones (p.ej. `sections/`).

## Compilación
Usa el `Makefile` incluido (requiere `latexmk` instalado):

```bash
make pdf   # compila main.tex a PDF
make clean # elimina archivos auxiliares
```

## Próximos pasos sugeridos
- Completar cada capítulo con explicaciones, ejemplos y ejercicios.
- Añadir recursos de audio y enlaces en notas al pie o apéndices.
- Incluir ilustraciones o tablas donde sean útiles (alfabeto, horarios, mapas simples).
