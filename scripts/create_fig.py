import sys

_prefix = """
\\documentclass{article}
\\pagestyle{empty}
\\usepackage{pgfplots}
\\makeatletter
\\tikzset{nomorepostaction/.code=\\let\\tikz@postactions\\pgfutil@empty}
\\makeatother
\\definecolor{myblack}{HTML}{111111}
\\definecolor{mywhite}{HTML}{FFFFFF}
\\definecolor{mygrey}{HTML}{C8C8C8}
\\begin{document}
\\begin{tikzpicture}
"""
_suffix = """
\\end{tikzpicture}
\\end{document}
"""

print _prefix
print sys.stdin.read()
print _suffix

