import sys

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


for l in langs:
	print l + "\t" + ("\t" * len(langs))

