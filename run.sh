#!/bin/bash

pdata="$(<index.html)"	#read file into memory
while :; do
	ncat -l 8080 <<< """$pdata""" 2>error_log | tee -a request_log
done
