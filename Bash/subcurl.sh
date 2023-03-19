#!/bin/bash

subfinder -d $1 | httprobe | tee $1.domains; for i in ${cat $1.domains}; do gobuster dir -u $i -w //usr/share/seclists/SecLists-master/Discovery/Web-Content/raft-medium-words.txt | tee $1.directories; cat $1.directories | sort | tee $1.directories; done; 