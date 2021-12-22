#!/bin/bash

# use the following sources to process the m8g domain
wget https://github.com/SEMICeu/CCCEV/raw/gh-pages/releases/2.00-draft/voc/cccev_en.ttl
wget https://github.com/catalogue-of-services-isa/CPSV-AP/raw/master/releases/2.2/SC2015DI07446_D02.02_CPSV-AP_v2.2_RDF_Schema_v1.00.ttl

./publish.sh m8g cccev_en.ttl
./publish.sh m8g SC2015DI07446_D02.02_CPSV-AP_v2.2_RDF_Schema_v1.00.ttl

./serialize.sh
./aggregate.sh m8g
