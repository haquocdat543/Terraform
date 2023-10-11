#!/bin/bash
### This is use for command dall2

### This is configuration for .vimrc file

## Delete .vimrc and .bashrc in root folder 
rm -f ~/.vimrc
rm -f ~/.bashrc
rm -f ~/.ssh/id-ed25519

## Restore backup files
mv ~/preconfig/backup/.vimrc.backup ~/.vimrc
mv ~/preconfig/backup/.bashrc.backup ~/.bashrc

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

## Clear all alias
exec bash

