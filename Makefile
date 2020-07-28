all: index.html 04.html

index.html: README.md
	pandoc -o index.html README.md

04.html: 04.Rmd
	render 04.Rmd
