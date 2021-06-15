#!/bin/bash
# aggretate the domain in one file

# arg1 = PURI


DIR=dir

rm $DIR/$1.*

FILES=`ls -1 $DIR/*.nt` 

for i in $FILES ; do
 echo $i
 cat $i >> $DIR/$1.nt
done

rapper -i ntriples -o turtle $DIR/$1.nt > $DIR/$1.ttl
rapper -i ntriples -o rdfxml $DIR/$1.nt > $DIR/$1.rdf
