#git clone https://github.com/plokhotnyuk/jsoniter-scala.git
cd jsoniter-scala
git checkout gh-pages
for benchmark in $(cat corretto-11.json | grep benchmark | tr -d "\"," | awk '{print $3}')
do
	echo "Analysing $benchmark"
	benchmarkFile=../$benchmark.csv
	for commit in $(git log --pretty=format:"%h")
	do 
		git checkout $commit
		if [ ! -f corretto-11.json ]
		then
			git reset --hard
			git checkout gh-pages
			break
		fi
		echo -n "$commit " >> $benchmarkFile
       		grep "ADTReading.avSystemGenCodec" corretto-11.json -A 40 | \
			grep "score\"\|scoreError" | \
			awk '{print $3}' | \
			tr ",\n" " " \
			>> $benchmarkFile
       		echo >> $benchmarkFile
	done
done
