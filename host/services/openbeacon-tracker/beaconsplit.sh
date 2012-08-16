#!/bin/sh
rm data/file*
cnt=0 ; fileNo=1; IFS=''
./openbeacon-tracker | while read line
do
cnt=$((cnt+1))
if [ ${line} = '},{' ] ; then
echo '}' >> data/file$fileNo
fileNo=$((fileNo+1)) ; echo New file number $fileNo at line $cnt
echo '{' >> data/file$fileNo
else
echo ${line} >> data/file$fileNo
fi
done
