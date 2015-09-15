while :
do
rm queue
touch queue
rm 2015*
#bin/nutch inject crawl/crawldb urls
bin/nutch generate crawl/crawldb crawl/segments -topN 10000 -numFetchers 10 -maxNumSegments 2
hadoop fs -ls  crawl/segments/
s1=(`hadoop fs -ls  crawl/segments/ | tail -2 | grep -o segments.* | grep -o 20.*`)
FAIL=0
echo "starting"
./spawn.sh ${s1[0]} 1 &
./spawn.sh ${s1[1]} 2 &
#./spawn.sh ${s1[2]} 3 $times &
#./spawn.sh ${s1[3]} 4 $times &

for job in `jobs -p`
do
echo $job
    wait $job || let "FAIL+=1"
done

echo $FAIL

if [ "$FAIL" == "0" ];
then
echo "YAY!"
else
echo "FAIL! ($FAIL)"
fi
python run.py
done
