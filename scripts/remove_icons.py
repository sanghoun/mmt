import sys, glob

fl = glob.glob("grammars/*/ace/config.tdl")
for fn in fl:
	f = open(fn)
	data = f.read()
	f.close()

	f1 = open(fn.replace(".tdl", ".bck"), 'w')
	f1.write(data)
	f1.close()

	pos = data.find("enable-icons := yes.")
	f1 = open(fn, 'w')
	if pos != -1:
		f1.write(data[:pos])
	else:
		f1.write(data)
	f1.close()
	
