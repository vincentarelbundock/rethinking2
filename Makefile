all: index.html 04.html

index.html: README.md Makefile style.css
	pandoc -s -c style.css README.md -o index.html

04.html: 04.Rmd
	render 04.Rmd
