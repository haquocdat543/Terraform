#!/bin/bash
### This is use for command dall2

### This is configuration for .vimrc file

## all file and folder in of vim configuration and .bashrc file
rm -rf ~/preconfig
sudo rm -f ~/.bashrc~

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
## Restore backup files
mv ~/.vimrc.backup ~/.vimrc
mv ~/.bashrc.backup ~/.bashrc

## Clear all alias
exec bash

