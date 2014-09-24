import sys

f = open("temp.tmp")
lines = f.readlines()
f.close()

buf = ""
print "\\begin{axis}[symbolic x coords={"
langs = lines[0].strip().split()
for lang in langs:
	buf += lang + ", "
	
print buf[:len(buf)-2]
print "}, ymin=0, "
print "ymax=" + lines[2].strip() + ", xtick=data]"

buf = ""
values = lines[1].strip().split()

if len(langs) != len(values):
	print "ERROR"
	sys.exit
 

print "\\addplot[ybar,fill=black] coordinates {"
for i in range(0,len(langs)):
	print "(" + langs[i] + ", " + values[i] + ")"

print "};"

print "\\end{axis}"

