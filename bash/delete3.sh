#!/bin/bash
### This is use for command dall2

### This is configuration for .vimrc file

## Delete .vimrc and .bashrc in root folder 
rm -f ~/.vimrc
rm -f ~/.bashrc
rm -f ~/.ssh/id-ed25519

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


## If Terraform folder exist. Delete it
if [ -d ~/Terraform ]
then
	rm -rf ~/Terraform
fi

## If ArgoCD folder exist. Delete it
if [ -d ~/ArgoCD ]
then
	rm -rf ~/AgoCD
fi

## Clear all alias
exec bash

