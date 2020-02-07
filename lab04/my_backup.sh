#!/bin/bash
#backs up a single assignment folder within my ABE65100 folder
#mcubbage 2/7/2020

if [ $# != 1 ]
then echo usage:A single argument which is the assignment folder to back up

exit
fi 

if [ ! -d ~/ABE65100/$1 ]
then echo 'given directory does not seem to exist possible typo?'
exit
fi 

#do we already have a backup for today's date?
date=`date +%F`
if [ -d ~/ABE65100_backups/$1_$date ]
then echo 'this project has already been backed up today,overwrite?' 
read answer
if [ $answer != 'y' ]
then exit
fi
else 
mkdir -p  ~/ABE65100_backups/$1_$date
fi 

cp -R ~/ABE65100/$1  ~/ABE65100_backups/$1_$date
echo " backup of $1 completed"
