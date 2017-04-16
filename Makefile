all: html

html:\
	day01/day01.html \
	day02/day02.html \
	day03/day03.html
# day04/day04.html

%.html: %.Rmd
	RScript -e "rmarkdown::render('$(<)')"
