#!/bin/sh

curl -O https://www3.nd.edu/~pbui/teaching/cse.20189.sp16/static/csv/demographics.csv

cat demographics.csv | sed '1d' | awk -F "," 'NR<=128 {gen13[$1]++ gen14[$3]++ gen15[$5]++ gen16[$7]++ gen17[$9]++ gen18[$11]++;}END {for (i in gen13) print i, gen13[i], gen14[i], gen15[i], gen16[i], gen17[i], gen18[i]}' | sed '1d' > gender.dat

cat demographics.csv | sed '1d' | awk -F "," 'NR<=128 {demo13[$2]++ demo14[$4]++ demo15[$6]++ demo16[$8]++ demo17[$10]++ demo18[$12]++;}END {for (i in demo15) print i, demo13[i], demo14[i], demo15[i], demo16[i], demo17[i], demo18[i] }' | sed '1d' | sed 's/  / 0 /' | sed 's/  / 0 /' | sed 's/  / 0 /' | sed 's/  / 0 /' | sed 's/  / 0 /' | sed 's/  / 0 /' > ethnicity.dat