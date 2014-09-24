import sys

mycolors = ["mygrey", 
"white,every path/.style={postaction={nomorepostaction,pattern=north east lines, pattern color=black}}",
"myblack", "mywhite", 
"white,every path/.style={postaction={nomorepostaction,pattern=west east lines, pattern color=black}}" ]


f = open("temp.tmp")
lines = f.readlines()
f.close()

buf = ""
print "\\begin{axis}[width=6in, height=4in, "
print "ybar=2*\\pgflinewidth, major x tick style = transparent, ymajorgrids = true, scaled y ticks = false, "
print "symbolic x coords={"
langs = lines[0].strip().split()
for lang in langs:
	buf += lang + ", "
	
print buf[:len(buf)-2]
print "}, ymin=0, "
print "ymax=" + lines[len(lines)-1].strip() + ", legend cell align=left, legend style={at={(0.99,0.01)}, anchor=south east, column sep=1ex}, xtick=data]"

cnt = 0

for i in range(1, len(lines) -1):
	values = lines[i].strip().split()
	print "\\addplot[style={bar width=0.12in,fill=" + mycolors[cnt] + ",draw=black}] coordinates {"
	for j in range(1, len(values)):
		print "(" + langs[j-1] + "," + values[j] + ")"
	print "};"
	cnt += 1

print "\\legend{" + buf[:len(buf)-2] + "}"
print "\\end{axis}"

