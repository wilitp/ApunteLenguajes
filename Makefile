LYX_FILE = lenguajeslogica.lyx
FIXUP_FILE = lenguajeslogica-fixup.tex
TEX_FILE = lenguajeslogica.tex
HTML_DIR = htmlapunte
CLEANED_FILES = $(HTML_DIR) $(TEX_FILE) 

all:
	rm -rf $(CLEANED_FILES)
	lyx --export latex $(LYX_FILE)
	gawk '{ print gensub(/\\item\s*\[([^\]]*)\]/, "\\\\item adhocprefix\\1", "g"); }' $(TEX_FILE) > $(FIXUP_FILE)
	pandoc -t chunkedhtml $(FIXUP_FILE) -o $(HTML_DIR) --mathjax=https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML --split-level=2 --markdown-headings=setext --number-sections --include-in-header=custom.html --toc=true
