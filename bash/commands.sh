#!/bin/bash
touch ~/preconfig/commands/1.txt
echo !! > ~/preconfig/commands/1.txt
sed 's/md //' ~/preconfig/commands/1.txt
sed 's/mkdir //' ~/preconfig/commands/1.txt
cd $(cat ~/preconfig/commands/1.txt)
rm ~/preconfig/commands/1.txt
