all: report.pdf

report.pdf: report.tex gender.png ethnicity.png
	pdflatex report.tex
	
gender.png: gender.dat
	gnuplot gender.plt
	
ethnicity.png:  ethnicity.dat
	gnuplot ethnicity.plt

gender.dat:
	demos.sh
	
ethnicity.dat:
	demo.sh
	
clean:
	rm -f *.png *.pdf *.dat *.csv *.aux *.out *.log
