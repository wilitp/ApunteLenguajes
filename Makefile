all:
	rm -rf htmlapunte lenguajeslogica.tex
	lyx --export latex lenguajeslogica.lyx
	pandoc -t chunkedhtml lenguajeslogica.tex -o htmlapunte --mathml
