# Nutch 1.10 on Multinode Hadoop Cluster
This repository contains the nutch crawler and hadoop cluster used in srmse.
You can refer to configs made in nutch as well as hadoop.

The following are the changes made to nutch
  - Refer nutch-site.xml to see changes.
  - Added en support(to crawl en pages only).
  - Uses elasticsearch for indexing refer elasticsearch settings in nutch-site.xml
  - Restricting crawl to seed links. refer nutch2/conf/regex-urlfilter.txt
  - Increased elastic search indexer plugin bulk size .Refer nutch-site.xml
  - Removed nutch's so called graceful crawling by increasing fetcher threads and lowering time delay of 10 sec to 1 sec which was present for subsequent requests to same domain.
  - Use nutch2/runtime/deploy/exec.sh to start nutch job. It is not just a iterative crawl script that most nutch tutorials provides. It tries to create more segments and parallelize jobs.Only recommended if you have more mappers and reducers and you are using fair scheduler in hadoop.Because submitting multiple jobs to hadoop's default fifo scheduler does not result in running multiple jobs at same time as new jobs are simply added to the queue.

The following changes are made to hadoop:
  - This is a 3 node cluster.
  - Default 2 mapper and 2 reducer is overrided and made 4 each.Refer mapred-site.xml
  - Using fair scheduler instead of hadoop's default fifo scheduler as fifo as name suggests does not supports running multiple mapred jobs at once.
  - Also default setting of replication of 3 is reduced to 1.Because we are not storing files permanently as after crawling and indexing we can delete segment directories.Therefore,there is no point in replicating data to three times which we are going to delete eventually.
    

### Version
1.0.0


### Installation

You can make changes to nutch conf but rebuild it before submitting the job to hadoop,rebuilding is required to save conf with .job file

Rebuild with
```sh
$ ant runtime
```

### Plugins used

* Elastic Indexer

### Development

Want to contribute? Great?
Please send me an email.


**Free Software, Hell Yeah!**


