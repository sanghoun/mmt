import sys, glob

trans_set = glob.glob(sys.argv[1]+"/*")

f = open(sys.argv[2])
lines = f.readlines()
f.close()
gold = {}
i = 0
for line in lines:
	gold[i] = line.strip()
	i += 1

translated = 0
cnt = 0
matched = 0
trans_set.sort()

for i in range(0, len(trans_set)):
	f = open(trans_set[i])
	trans = f.readlines()
	f.close()
	
	if len(trans) == 0: continue
	if trans[0].strip().startswith("unify failed at path:"): continue
	translated += 1
	cnt += len(trans)

	for line in trans:
		line = line.strip()
		if line == gold[i]: 
			matched += 1  
			break
			
print "covergage: " + str(float(translated) / float(len(trans_set)))
print "matched: " + str(float(matched) / float(len(trans_set)))
print "average number: " + str(float(cnt) / float(len(trans_set)))
