#!/bin/sh

latex $1.tex
dvips $1.dvi
ps2pdf $1.ps
pdfcrop $1.pdf
rm -f $1.pdf
mv $1-crop.pdf $1.pdf
rm -f $1.log
rm -f $1.aux
rm -f $1.dvi
rm -f $1.ps
rm -f *~