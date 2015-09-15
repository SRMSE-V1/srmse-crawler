import sys
print sys.argv
d=open("queue","r").read().strip().split("\n")
print d
d.remove(sys.argv[1])
open("queue","w").write("\n".join(d))
