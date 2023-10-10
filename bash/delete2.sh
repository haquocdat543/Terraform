#!/bin/bash

### This is configuration for .vimrc file

## all file and folder in of vim configuration and .bashrc file
rm -rf ~/preconfig
sudo rm -f ~/.bashrc~

if [ -d ~/Terraform ]
then
	rm -rf ~/Terraform
fi
## Restore backup files
mv ~/.vimrc.backup ~/.vimrc
mv ~/.bashrc.backup ~/.bashrc

## Clear all alias
exec bash

