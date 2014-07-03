#!/bin/bash
echo -e "\n\t\tRemoving"
for FILE_TO_REMOVE in `cat list2remove.txt` ; do
rm -fr "temp/${FILE_TO_REMOVE}"
done

echo -e "\t\tCopying"
cp -a done/* temp

echo -e "\t\tDone"