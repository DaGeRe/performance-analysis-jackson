for file in *.csv
do
	tac $file > tailed_$file
	gnuplot -c plot.plt tailed_$file
	mv tailed_$file.pdf $file.pdf
done
