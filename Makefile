LYX_FILE = lenguajeslogica.lyx
FIXUP_FILE = lenguajeslogica-fixup.tex
TEX_FILE = lenguajeslogica.tex
HTML_DIR = htmlapunte
JS_FILE = custom.js
CUSTOM_HTML_FILE = custom.html
CLEANED_FILES = $(HTML_DIR) $(TEX_FILE) 

all:
	# quitar versión anterior
	rm -rf $(CLEANED_FILES)
	# generar latex a partir de lyx
	lyx --export latex $(LYX_FILE)
	# identificar usor de custom items y cambiarlos por texto(pandoc no se los banca y simplemente los ignora)
	gawk '{ print gensub(/\\item\s*\[([^\]]*)\]/, "\\\\item adhocprefix\\1adhocsufix", "g"); }' $(TEX_FILE) > $(FIXUP_FILE)
	# pasar del latex corregido a html
	pandoc -t chunkedhtml $(FIXUP_FILE) -o $(HTML_DIR) --mathjax=https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML --split-level=2 --markdown-headings=setext --number-sections --include-in-header=$(CUSTOM_HTML_FILE) --toc --resource-path=resources
	# mover archivo de javascript custom al directorio del apunte
	cp $(JS_FILE) $(HTML_DIR)
	
