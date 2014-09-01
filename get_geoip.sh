#!/bin/bash
while IFS=$'\t' read host date req response size
do
#  domain=`nslookup $host | tail -n 2 | grep Address | sed "s/Address: //g"`
   domain=`curl -s http://localhost:8080/csv/$host | awk -F "," '{print $1,"\t",$6,"\t",$8,"\t",$9,"\t",$2,"\t",$3}' | sed 's/"//g'`
   if [ "$domain" != "Not Found" ];
   then 
 	echo "$host" $'\t' "$domain"
   fi
done < $1
