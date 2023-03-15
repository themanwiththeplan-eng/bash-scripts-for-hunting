#!/bin/bash

subfinder -d $1 | tee $1; mkdir $1.dir; mv $1 $1.dir; cd $1.dir;  cat $1 | httprobe | tee $1.domains; for line in ${cat $1.domains}; do gobuster dir -u $line -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/raft-medium-words.txt | tee $1.brute; cat $1.brute | httprobe | tee $1.brute; cat $1.brute| sort | tee $1.sorteddirs; done;

