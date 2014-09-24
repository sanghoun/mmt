import sys, glob

sens = {}
sens_num = 0

fl = glob.glob(sys.argv[1] + "/*.txt")
for fn in fl:
	f = open(fn)
	lines = f.readlines()
	f.close()	
	sens_num = len(lines)
	iso = fn.replace(sys.argv[1], "").replace(".txt", "").replace("/", "").strip()
	sens[iso] = []
	for line in lines:
		sens[iso].append(line.strip())


f = open("pairs")
lines = f.readlines()
f.close()

values = {}

for line in lines:
	line = line.strip()
	each = line.split('2')
	if len(each) != 2:
		continue
	s = each[0]
	t = each[1]

	values[line] = 0

	for i in range(1, sens_num+1):
		f = open("outputs/" + line + "." + str(i) + ".out")
		outputs = f.readlines()
		f.close()
		
		for output in outputs:
			output = output.strip()
			if len(output) == 0:
				continue
			if sens[t][i-1] == output:
				values[line] += 1


f = open("languages")
lines = f.readlines()
f.close()

langs = []

for line in lines:
	each = line.strip().split()
	if len(each) != 1:
		continue
	langs.append(each[0].strip())

_1st_row = "\t"
for l in langs:
	_1st_row += l
	_1st_row += "\t"

print _1st_row.rstrip()

M = 0
log = ""
for s in langs:
	buf = s + "\t"
	for t in langs:
		p = s+"2"+t
		buf += str(values[p])
		buf += "\t"
		if values[p] > M: M = values[p]

	print buf
	log += buf + "\n"


f = open("temp.tmp", 'w')
f.write(_1st_row.rstrip() + "\n")
f.write(log)
f.write(str(M) + "\n")
f.close()

f = open("log.tmp", 'a')
f.write(_1st_row.rstrip() + "\n")
f.write(log)
f.write("---\n")
f.close()




		
		
