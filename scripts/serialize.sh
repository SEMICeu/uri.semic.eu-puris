#!/bin/bash
# 
# serialize all ntriples files in a directory to RDFXML and Turtle
# assume that these can be overwritten.


DIR=dir

rm -rf $DIR/*.ttl
rm -rf $DIR/*.rdf

FILES=`ls -1 $DIR` 

for i in $FILES ; do
 echo $i
 FILENAME=`echo $i | sed -e "s/.nt$//"`
 rapper -o rdfxml -i ntriples $DIR/$i > $DIR/$FILENAME.rdf
 rapper -o turtle -i ntriples $DIR/$i > $DIR/$FILENAME.ttl
done
