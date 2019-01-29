#!/bin/zsh

# Return IP address of running system on stdout (requires network access)

# skips httpheader of a site
function skip_httpheader {
   for i in {1..7} ; do
	  read -u $REPLY LINE;
  	  if [[ "$LINE" == "" ]] ; then return ; fi
  done
}

zmodload zsh/net/tcp
HOST=v4.showip.spamt.net
ztcp $HOST 80
print -u $REPLY "GET / HTTP/1.0\r\nHost: $HOST\r\n\r\n"
skip_httpheader
read -u $REPLY LINE
echo "$LINE"
ztcp -c $REPLY

# vim: fenc=utf-8 ft=zsh
