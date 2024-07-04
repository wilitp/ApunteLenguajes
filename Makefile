all:
	rm -rf htmlapunte lenguajeslogica.tex
	lyx --export latex lenguajeslogica.lyx
	pandoc -t chunkedhtml lenguajeslogica.tex -o htmlapunte --mathjax=https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML --split-level=2 --markdown-headings=setext --number-sections --include-in-header=custom.html --toc=true