#!/bin/bash

IFS="
"

for i in `cat temp`
do
  puppetvar=`echo $i | awk '{print $1}' | awk -F\$ '{print $2}'`
  echo "\$$puppetvar = \$redis::server::server_$puppetvar"
done

