set xlabel 'Type'
set ylabel 'Average time in seconds'
set term png
set output 'latencywithfork.png'

set boxwidth 0.5
set style fill solid
plot "latencyf.dat" using 1:2:xtic(3) with boxes notitle
