#!/bin/bash
### This is use for command dall 

### This is configuration for .vimrc file

## Delete .vimrc and .bashrc in root folder 

if [ -f ~/.vimrc ]
then
	sudo rm -f ~/.vimrc
fi

if [ -f ~/.vimrc ]
then
	sudo rm -f ~/.bashrc
fi

## Restore backup files
## If .vimrc in root folder does not exist. mv it from preconfig/backup folder
if [ ! -f ~/.vimrc ]
then
	mv ~/preconfig/backup/.vimrc.backup ~/.vimrc
fi

## If .bashrc in root folder does not exist. mv it from preconfig/backup folder
if [ ! -f ~/.bashrc ]
then
	mv ~/preconfig/backup/.bashrc.backup ~/.bashrc
fi
## Remove preconfig folder and .bashrc~ file
rm -rf ~/preconfig
sudo rm -f ~/.bashrc~

## Clear all alias
exec bash

