all: report.pdf

report.pdf: latency.png latencyf.png throughput.png throughputf.png
	pdflatex report.tex
	
latency.png:
	gnuplot latency.plt

latencyf.png:
	gnuplot latencyf.plt

throughput.png:
	gnuplot throughput.plt

throughputf.png:
	gnuplot throughputf.plt
	
clean:
	rm *.png *.pdf 


