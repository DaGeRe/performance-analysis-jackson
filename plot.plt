set encoding iso_8859_1
set terminal pdf size 8,5

set out ARG1.'.pdf'

set title ARG1

set xlabel 'Index'
set ylabel 'Duration'
	
plot ARG1 u 0:2 w linespoint, \
 ARG1 u 0:($2-$3):($2+$3) w filledcurves lc "red" notitle fs transparent solid 0.5
 
unset out
