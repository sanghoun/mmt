import sys, glob

f = open("pairs")
lines = f.readlines()
f.close()

values = {}
M = 0

for line in lines:
	line = line.strip()
	each = line.split('2')
	if len(each) != 2:
		continue
	s = each[0]
	t = each[1]

	values[line] = 0

	fl = glob.glob("outputs/" + line + ".*.out")
	if len(fl) > M: M = len(fl)
	for fn in fl:
		f = open(fn)
		data = f.read()
		f.close()

		data = data.strip()
		if len(data) != 0:
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

log = ""
for s in langs:
	buf = s + "\t"
	for t in langs:
		p = s+"2"+t
		buf += str(values[p])
		buf += "\t"

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

