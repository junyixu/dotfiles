#! /bin/sh
# usage 
# eg： initLaTeX.sh matlab

TEMPLATE="normal"
if [ $# = 1 ] && [ $1 = "matlab" ]
then
    TEMPLATE="matlab"
fi
if [ $# = 1 ] && [ $1 = "phyreport" ]
then
    TEMPLATE="phyreport"
fi
if [ $# = 1 ] && [ $1 = "notes" ]
then
    TEMPLATE="notes"
fi
cp -r  ~/Desktop/university/template/$TEMPLATE/* .
echo "Initialize LaTeX template: "$TEMPLATE" successfully!" 
