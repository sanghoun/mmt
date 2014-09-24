import sys, glob

sens = {}

fl = glob.glob(sys.argv[1] + "/*.txt")
for fn in fl:
	f = open(fn)
	lines = f.readlines()
	f.close()	
	iso = fn.replace("test_sentences/", "").replace(".txt", "").strip()
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

	max_value = 0
	fl = glob.glob("outputs/" + line + ".*.out")
	for fn in fl:
		current = 0
		f = open(fn)
		outputs = f.readlines()
		f.close()
		for output in outputs:
			output = output.strip()
			if len(output) == 0:
				continue
			current += 1
		
		if current > max_value:
			max_value = current 

	values[line] = max_value


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

log = ""
M = 0
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

