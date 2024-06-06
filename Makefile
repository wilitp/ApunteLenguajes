all:
	rm -rf htmlapunte lenguajeslogica.tex
	lyx --export latex lenguajeslogica.lyx
	pandoc -t chunkedhtml lenguajeslogica.tex -o htmlapunte --mathjax --split-level=2 --markdown-headings=setext --number-sections --include-in-header=custom.html --toc=true
