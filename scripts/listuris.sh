#!/bin/bash
# 
# list all uris 


TMPFILE=TMP
DIR=dir

PURI=$1

FILE=$DIR/$PURI.nt

rm -rf $TMPFILE.*


sort -u $FILE > $TMPFILE.1.nt

sed -e "s/> </>|</" $TMPFILE.1.nt > $TMPFILE.2.nt
sed -e "s/\(.*\)|.*$/\1/" $TMPFILE.2.nt > $TMPFILE.3.nt
sed -e "s/^<http:\/\/data.europa.eu//g" $TMPFILE.3.nt > $TMPFILE.4.nt
sed -e "s/>//" $TMPFILE.4.nt > $TMPFILE.5.nt

sort -u $TMPFILE.5.nt > $TMPFILE.nt


rm htmlmap.lua
cat htmlmap.prefix >> htmlmap.lua
sed -e 's/\(.*\)/  "\1" = " ",/' $TMPFILE.nt  >> htmlmap.lua
cat htmlmap.suffix >> htmlmap.lua

