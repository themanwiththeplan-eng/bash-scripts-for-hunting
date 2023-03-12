#!/bin/bash

subfinder -d $1 | tee $1; mkdir $1.dir; mv $1 $1.dir; cd $1.dir;  for i in $(cat $1); do curl -X GET $i | tee $1.curl; cat $1.curl | grep -e "200" | sort -u | tee $1.domains; done;

