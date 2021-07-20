#! /bin/bash
upid=`netstat -lnp |grep 8080 |grep -v grep |awk '{print $7}'|awk -F "/" '{print $1}'`
echo "$upid"
if [ ! $upid ];then
    echo "start"
    nohup java -jar demo.jar > log.out 2>&1 & 
else
    echo "restart"
    kill -9 $upid
    nohup java -jar demo.jar > log.out 2>&1 & 
fi