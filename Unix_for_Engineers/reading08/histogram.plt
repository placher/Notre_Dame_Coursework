file1 = "results.dat"
set terminal png size 400,300
set output 'histogram.png'
set style data histogram 
set style histogram clustered gap 1

set grid y
set yrange[0:*]
set xtics border in scale 0,0 nomirror rotate by 90  offset character -1, -4, 0

set boxwidth 0.9 absolute

set style fill solid 1.0 noborder
set key outside right top vertical Left

plot newhistogram , file1 u 2:xtic(1) t "Results" lc rgbcolor "blue" lt 1