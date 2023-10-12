import numpy as np

from pylatex import Document, Section, Subsection, Tabular, Math, TikZ, Axis, \
    Plot, Figure, Matrix, Alignat
from pylatex.utils import italic
import os


def foo():
    #foo.txt
    fileName = "foo.txt"
    file = open(fileName, 'r')
    columns = 0
    text = []
    for x in file:
        text.append(x)
    file.close()
    formula = ["\\frac{","}{","} & x \\in \\left( ","; ",' \\right]\\\\']
    for i in range(len(text[4])):
        if(text[4][i] == ':'):
            columns = int(text[4][i+2:len(text[4])])
            break
    #print(text)
    varStr = []
    for i in text[-6:]:
        varStr.append(i)
    var = [[],[],[],[]]
    for i in range(0,4):
        temp = 0
        tempStr = ""
        for j in range(len(varStr[i])):
            if(varStr[i][j]!=' '):
                tempStr+=varStr[i][j]
            elif(tempStr!=""):
                var[i].append(tempStr)
                tempStr = ""
            if(j == len(varStr[i])-1):
                var[i].append(tempStr[0:-1])
    result = []
    for i in range(0,columns):
        a = var[2][i]
        b = var[3][i]
        c = var[0][i]
        d = var[1][i]
        if(c=="-Inf"):
            c="-\\infty"
        else:
            c = float(c)
        if(d=="Inf"):
            d="+\\infty"
        else:
            d = float(d)
        endStr = formula[4]
        if(i==columns-1):
            endStr = "\\right)\\"
        r = (formula[0] + str(a) + 
                    formula[1] + str(b) +
                    formula[2] + str(c) +
                    formula[3] + str(d) +
                    endStr)
        result.append(r)
    output = ""
    output += "\\begin{equation*}\n\tF{^{*}_{\\xi}}=\n\t\\begin{cases}\n"
    for i in result:
        output += "\t\t" + i+'\n'
    output += "\t\\end{cases}\n\\end{equation*}"
    
    fileName = "foo.tex"
    file = open(fileName,'w')
    file.write(output)
    file.close()

def raspr():
    #foo.txt
    fileName = "raspr.txt"
    file = open(fileName, 'r')
    columns = 0
    text = []
    for x in file:
        text.append(x)
    file.close()
    formula = ["","","","",'']
    for i in range(len(text[4])):
        if(text[4][i] == ':'):
            columns = int(text[4][i+2:len(text[4])])
            break
    #print(text)
    varStr = []
    for i in text[-4:]:
        varStr.append(i)
    var = [[],[]]
    for i in range(0,2):
        temp = 0
        tempStr = ""
        for j in range(len(varStr[i])):
            if(varStr[i][j]!=' '):
                tempStr+=varStr[i][j]
            elif(tempStr!=""):
                var[i].append(tempStr)
                tempStr = ""
            if(j == len(varStr[i])-1):
                var[i].append(tempStr[0:-1])
    print(var)
    r1 = "$x_i$"
    r2 = "$n_i$"
    for i in range(0,columns):
        a = float(var[0][i])
        b = float(var[1][i])
        endStr = formula[4]
        if(i==columns-1):
            endStr = ""
        r1 += " & " + str(a)
        r2 += " & " + str(b)
    r1 += "\\\\"
    r2 += "\\\\"
    output = ""
    output += ("\\begin{tabular}{|l||"+ 'c|'*columns +"}\n\t\\hline\n\t" + 
                r1 + "\n\t\\hline\\hline\n\t" + r2 + "\n\t\\hline\n\t" + "\n") 
    output += "\\end{tabular}"
    
    fileName = "raspr.tex"
    file = open(fileName,'w')
    print(file)
    print(output)
    file.write(output)
    file.close()

def getOneVar(fileName: str):
    #name.txt
    file = open(fileName, 'r')
    text = []
    flag = False
    for x in file:
        text.append(x)
        if(x == "# type: scalar\n"):
            flag = True
            continue
        if(flag):
            return float(x)
    file.close()

def X():
    fileName = "X.txt"
    res = getOneVar(fileName)
    text = "\\textbf{$X$}: $" + str(res) + "$\\\\"
    fileName = "X.tex"
    file = open(fileName,'w')
    file.write(text)
    file.close()

def S():
    fileName = "S.txt"
    res = getOneVar(fileName)
    text = "\\textbf{$S$}: $" + str(res) + "$\\\\"
    fileName = "S.tex"
    file = open(fileName,'w')
    file.write(text)
    file.close()

def _S():
    fileName = "_S.txt"
    res = getOneVar(fileName)
    text = "\\textbf{$S^-$}: $" + str(res) + "$\\\\"
    fileName = "_S.tex"
    file = open(fileName,'w')
    file.write(text)
    file.close()

def main():
    foo()
    raspr()
    X()
    S()
    _S()
    return 0

if __name__ == '__main__':
    main()











