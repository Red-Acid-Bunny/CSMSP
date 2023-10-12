#!/bin/bash
#

bash ru2en.sh ans
flatpak run org.octave.Octave Test.m > octave.log
python3 generateLatexAns.py
pdflatex result.tex

# Test.m run.sh ru2en.sh result.tex result.pdf README.md generateLatexAns.py default.txt

rm result.{aux,log,toc} {{foo{,Grf},histogramm,MnogoUgolnik}{,-inc},raspr,X,S,_S}.* octave.log textfile.txt ans

