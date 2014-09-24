import sys

_prefix = """
\\documentclass{article}
\\pagestyle{empty}
\\begin{document}
\\centering
\\begin{table}[!h]
"""
_suffix = """
\\end{tabular}
\\end{table}
\\end{document}
"""

print _prefix

max_cell_num = 0
buf = ""

for line in sys.stdin:
	each = line.split("\t")
	if len(each) > max_cell_num:
		max_cell_num = len(each)
	buf += line.replace("\t\n", "\n").replace("\t", " & ").strip() + " \\\\"
	buf += "\n"
	buf += "\\hline \n"

print "\\begin{tabular}{" + ((max_cell_num - 1) * "|c") + "|}"
print "\\hline \n"
print buf.strip()

print _suffix




