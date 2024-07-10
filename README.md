# Apunte

Proyecto para colgar el apunte de las materias Lenguajes formales y Computabilidad y Lógica en la página granlogico.com

## Generación del apunte en formato html

El apunte se genera usando:

- lyx: para generar latex a partir de el documento lyx que escribe el profe
- gawk: para hacer reemplazos auxiliares
- pandoc: para traducir latex a html
- css y js client-side: para algunos retoques que no podemos / sabemos / queremos hacer por medio de pandoc

todo esto a través de un Makefile.
