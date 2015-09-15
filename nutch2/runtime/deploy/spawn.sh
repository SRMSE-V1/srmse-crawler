bin/nutch fetch crawl/segments/$1 -threads 1000
./parse.sh $1 
./updatedb.sh $1 1 & #file to check if crawldb locked before making update
#bin/nutch invertlinks crawl/linkdb crawl/segments/$s1
./index.sh $1 &
