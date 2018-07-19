#!/bin/bash

jump.eu()
{
for i in `cat iplist.txt`
do
ssh -o StrictHostKeyChecking=no -J jump.eu $i 'bash -s' < commands.txt > $i.csv
if [ $? -ne 0 ]; then
    echo "Server $i is unable to connect"
fi
done
}

jump.solvedirect.com()
{
for i in `cat iplist.txt`
do
ssh -o StrictHostKeyChecking=no -J jump.solvedirect.com $i 'bash -s' < commands.txt > $i.csv
if [ $? -ne 0 ]; then
    echo "Server $i is unable to connect"
fi
done
}

echo -e "Select one of the following option:-\n
1. If your servers are accessible from jump.eu
2. If your servers are accessible from jump.solvedirect.com
3. Exit"

read -p "Make your choice:- " ch

case $ch in
	1)
             jump.eu ;;
        2)
             jump.solvedirect.com ;;
        3) 
	     exit ;;
	*)
	     echo "Wrong Choice, Try Again" ;;
esac
