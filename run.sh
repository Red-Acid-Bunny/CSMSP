#!/bin/bash
#

bash ru2en.sh ans
flatpak run org.octave.Octave Test.m > octave.log
python3 generateLatexAns.py
pdflatex result.tex

rm ans foo.tex {MnogoUgolnik,fooGrf,histogramm}{-inc,}.{pdf,tex} *.aux *.log textfile.txt *.toc

