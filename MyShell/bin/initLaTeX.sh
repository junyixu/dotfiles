#! /bin/sh
# usage 
# eg： initLaTeX.sh matlab

TEMPLATE="normal"
if [ $# = 1 ] && [ $1 = "matlab" ]
then
    TEMPLATE="matlab"
fi
cp -r  ~/Desktop/university/template/$TEMPLATE/* .
echo "LaTeX template: "$TEMPLATE
