import sys, glob

f = open("languages")
lines = f.readlines()
f.close()

langs = []

for line in lines:
	each = line.strip().split()
	if len(each) != 1:
		continue
	langs.append(each[0].strip())

_1st_row = ""
for l in langs:
	_1st_row += l
	_1st_row += "\t"

print _1st_row.rstrip()

M = 0

buf = ""
for l in langs:
	fl = glob.glob("outputs/" + l + ".*.out")
	if len(fl) > M: M = len(fl)
	_value = 0
	for fn in fl:	
		f = open(fn)
		data = f.read()
		f.close()
		
		if data.strip()[:5] == "SENT:":
			_value += 1

	buf += str(_value)
	buf += "\t"

print buf

f = open("temp.tmp", 'w')
f.write(_1st_row.rstrip() + "\n")
f.write(buf+"\n")
f.write(str(M) + "\n")
f.close()

f = open("log.tmp", 'a')
f.write(_1st_row.rstrip() + "\n")
f.write(buf+"\n")
f.write("---\n")
f.close()

		
		
	
