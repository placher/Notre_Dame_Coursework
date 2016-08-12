#!/bin/sh

roll_dice.sh -r 1000 | awk '{
    for (i = 1; i <= NF; i++)
        freq[$i]++
}

END {
    for (num in freq)
        printf "%s\t%d\n", num, freq[num]
}' | sort -n > results.dat