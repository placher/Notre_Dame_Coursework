set xlabel 'Type'
set ylabel 'Bits per second'
set term png
set output 'throughputwithfork.png'

set boxwidth 0.5
set style fill solid
plot "throughputf.dat" using 1:2:xtic(3) with boxes notitle
