import time,os,sys
import subprocess
removed=0
while True:
	if removed%2==0 and removed!=0:
		sys.exit()		
	a=os.listdir("./")
	for aa in a:
		if "2015" in aa:
			fi=len(open(aa,"r").read().split("\n"))
			if fi==4:
				os.system("hadoop fs -rmr crawl/segments/"+aa)
				os.system("rm "+aa)
				removed+=1
	time.sleep(60)
