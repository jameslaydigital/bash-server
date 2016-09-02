#!/bin/bash

#This is the actual server.

pdata="$(<index.html)"	#read file into memory
while :; do
	ncat -l 8080 <<< """$pdata
""" 2>error_log | tee -a request_log
done

# The while loop runs forever unconditionally.
#
# ncat returns the cached contents of index.html and a newline 
# so the client knows the transmission is complete
#
# Stderr is redirected to error_log and stdin is 
# redirected to request_log.
