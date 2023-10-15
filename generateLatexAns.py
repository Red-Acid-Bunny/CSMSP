import numpy as np

from pylatex import Document, Section, Subsection, Tabular, Math, TikZ, Axis, \
    Plot, Figure, Matrix, Alignat
from pylatex.utils import italic
import os

BUILD = "./build_pdf/"

def foo(BasicName :str):
    #foo.txt
    fileName = BUILD + BasicName + ".txt"
    file = open(fileName, 'r')
    columns = 0
    text = []
    for x in file:
        text.append(x)
    file.close()
    formula = ["\\frac{","}{","} & x \\in \\left[ ","; ",' \\right)\\\\']
    for i in range(len(text[4])):
        if(text[4][i] == ':'):
            columns = int(text[4][i+2:len(text[4])])
            break
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
        left = ""
        if(i==0):
            left = "} & x \\in \\left( "
        else:
            left = "} & x \\in \\left[ "
        r = (formula[0] + str(a) + 
                    formula[1] + str(b) +
                    left + str(c) +
                    formula[3] + str(d) +
                    endStr)
        result.append(r)
    output = ""
    output += "\\begin{equation*}\n\tF{^{*}_{\\xi}}=\n\t\\begin{cases}\n"
    for i in result:
        output += "\t\t" + i+'\n'
    output += "\t\\end{cases}\n\\end{equation*}"
    
    fileName = BUILD + BasicName + ".tex"
    file = open(fileName,'w')
    file.write(output)
    file.close()

def raspr(BasicName :str):
    #foo.txt
    fileName = BUILD + BasicName + ".txt"
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
    l1 = "$x_i$"
    l2 = "$n_i$"
    output = ""
    pre = """\\begin{longtable}{|l|l|}
\\caption{""" + BasicName + """.} \\label{tab:long} \\\\

\\hline \\multicolumn{1}{|c|}{\\textbf{""" + l1 + """}} & \\multicolumn{1}{c|}{\\textbf{""" + l2 + """}}\\\\ \\hline 
\\endfirsthead

\\multicolumn{2}{c}%
{{\\bfseries \\tablename\\ \\thetable{} -- continued from previous page}} \\\\
\\hline \\multicolumn{1}{|c|}{\\textbf{""" + l1 +"""}} & \\multicolumn{1}{c|}{\\textbf{""" + l2 + """}}\\\\ \\hline 
\\endhead

\\hline \\multicolumn{2}{|r|}{{Continued on next page}} \\\\ \\hline
\\endfoot

\\hline \\hline
\\endlastfoot
"""
    post = "\\end{longtable}"
    output += pre
    output += str(float(var[0][0])) + " & " + str(float(var[1][0])) + "\\\\\n\\hline"
    for i in range(1,columns):
        a = float(var[0][i])
        b = float(var[1][i])
        endStr = formula[4]
        if(i==columns-1):
            endStr = ""
        output += str(a) + " & " + str(b) + "\\\\\n\\hline"
    output += post
    
    fileName = BUILD + BasicName + ".tex"
    file = open(fileName,'w')
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

def txt2tex_for_single_value(BasicName :str):
    fileName = BUILD + BasicName + ".txt"
    res = getOneVar(fileName)
    text = "\\textbf{" + BasicName + "}: $" + str(res) + "$\\\\"
    fileName = BUILD + BasicName + ".tex"
    file = open(fileName,'w')
    file.write(text)
    file.close()

def main():
    foo("empiricalFunction")
    raspr("groupedSelection")
    txt2tex_for_single_value("expectedValue")
    txt2tex_for_single_value("biasedSampleVariance")
    txt2tex_for_single_value("unbiasedSampleVariance")
    return 0

if __name__ == '__main__':
    main()











