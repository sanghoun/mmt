f = open("languages")
lines = f.readlines()
f.close()

langs = []

for line in lines:
	each = line.strip().split()
	if len(each) != 1:
		continue

	langs.append(each[0].strip())

for s in langs:
	for t in langs:
		print s+"2"+t

