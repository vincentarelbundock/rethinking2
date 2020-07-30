all: index.html 04.html 05.html 06.html 07.html 08.html 09.html 11.html 12.html 13.html 14.html

index.html: README.md Makefile style.css
	pandoc -s -c style.css README.md -o index.html

04.html: 04.Rmd
	render 04.Rmd

05.html: 05.Rmd
	render 05.Rmd

06.html: 06.Rmd
	render 06.Rmd

07.html: 07.Rmd
	render 07.Rmd

08.html: 08.Rmd
	render 08.Rmd

09.html: 09.Rmd
	render 09.Rmd

11.html: 11.Rmd
	render 11.Rmd

12.html: 12.Rmd
	render 12.Rmd

13.html: 13.Rmd
	render 13.Rmd

14.html: 14.Rmd
	render 14.Rmd
