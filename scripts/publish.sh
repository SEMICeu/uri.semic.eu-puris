#!/bin/bash
#
# ./publish PURI rdffile.{format}
#
# first the rdf file format will be guessed
# and than transformed to ntriples 
# and then a directory dir will be created
#
# arg 1. the puri domain to publish
# arg 2. the file the process
#

TMPFILE=TMP
DIR=dir
CREATEDIRS=createdirs

PURI=$1

rm -rf $TMPFILE.*
rm -rf $CREATEDIRS.*


rapper -o ntriples --guess $2 > $TMPFILE.nt


sort -u $TMPFILE.nt > $TMPFILE.1.nt

sed -e "s/> </>|</" $TMPFILE.1.nt > $TMPFILE.2.nt
sed -e "s/^\(.*\)|/\1|\1 /" $TMPFILE.2.nt > $TMPFILE.3.nt
sed -e "/^_:gen/d" $TMPFILE.3.nt > $TMPFILE.4.nt
sed -e "/$PURI.*|/!d" $TMPFILE.4.nt > $TMPFILE.5.nt
sed -e "s/^<http:\/\/data.europa.eu\/$PURI\///g" $TMPFILE.5.nt > $TMPFILE.6.nt
sed -e "s/^<http:\/\/data.europa.eu\/$PURI//g" $TMPFILE.6.nt > $TMPFILE.7.nt
sed -e "s/\(.*\)#.*|/\1|/" $TMPFILE.7.nt > $TMPFILE.8.nt
sed -e "s/\(.*\)>|/\1|/" $TMPFILE.8.nt > $TMPFILE.9.nt
sed -e '/^|/d' $TMPFILE.9.nt > $TMPFILE.10.nt

mkdir -p $DIR
awk -F "|" -v mydir="$DIR" '{ t=mydir"/"$1 ; print "mkdir -p "t}' $TMPFILE.10.nt > $CREATEDIRS
sort -u $CREATEDIRS > $CREATEDIRS.1
sed -e "s/\/[^\/]*$//" $CREATEDIRS.1 > $CREATEDIRS.2
bash -e $CREATEDIRS.2
awk -F "|" -v mydir="$DIR" '{ t=mydir"/"$1".nt" ; print $2 > t}' $TMPFILE.10.nt


