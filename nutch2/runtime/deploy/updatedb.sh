if [ $2 -eq $((1)) ]; then
echo "adding to queue"
echo $1 >> queue
fi
top=`head -n 1 queue`
#pop from the queue file to get jobid viz segment number
echo $top
hadoop fs -test -d crawl/crawldb/.locked
if [ $? != 0 ] && [ "$top" -eq $(($1)) ];then
	echo "Crawldb not locked procedding with updatedb"
	bin/nutch updatedb crawl/crawldb crawl/segments/$1 -filter &
	python removeFromQueue.py $1
	echo "update" >> $1
else
      echo "crawldb locked please wait"
      while :
	do
		sleep 10
		./updatedb.sh $1 0
	done

fi
