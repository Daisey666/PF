#!/bin/sh
#========================================================
# Script to convert mlf files generated by simpleForceAlignment.sh in lab files 
# created by group 8
#========================================================

CWD=`pwd`
cd `dirname $0`/..
REC_ROOT=`pwd`
cd $CWD

mkdir -p forced_alignmentsLAB
cp ./forced_alignments/*.mlf ./forced_alignmentsLAB
cd forced_alignmentsLAB

echo " "
echo " ############# CONVERTING MLF TO LAB #############"
echo " "

for FILE in `find . -name \*.mlf -print`; do
	
	LENGTH=`expr length $FILE`
    INDEX=$(($LENGTH-13))
    FILE=`expr substr $FILE $INDEX 14`
    NEWFILE=`expr substr $FILE 1 10`
    NEWFILE="$NEWFILE"".lab"

    echo " ------------ Converting [ $FILE ----> $NEWFILE ] ------------"

	tail -n +3 $FILE | head -n -1 > $NEWFILE

done

rm *.mlf
