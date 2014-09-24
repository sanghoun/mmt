import sys, glob

fl = glob.glob("test_sentences/*.txt")

for fn in fl:
	f = open(fn)
	data = f.read()
	f.close()

	f = open(fn, 'w')
	f.write(data.rstrip() + "\n")
	f.close()
