for file in *.csv
do
	gnuplot -c plot.plt $file
done
