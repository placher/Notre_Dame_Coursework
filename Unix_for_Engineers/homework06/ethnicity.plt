set terminal png size 700,525
set output 'ethnicity.png'
set style data histograms
set style fill solid 1.00
set boxwidth 0.9 absolute
set grid ytics
set ytics 10
set yrange[0:*]
set xrange [-1:7]
set xtics border in scale 1,0.5 nomirror rotate by -45  offset character 0, -4, 0
set xtics norangelimit
set xtics ("Native" 0, "Black" 1, "Oriental" 2, "White" 3, "Hispanic" 4, "Multiple" 5, "Undeclared" 6)
plot "ethnicity.dat" using 2 ti "2013", '' u 3 ti "2014", '' u 4 ti "2015", '' u 5 ti "2016", '' u 6 ti "2017", '' u 7 ti "2018"