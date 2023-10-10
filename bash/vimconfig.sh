#!/bin/bash

### This is configuration for .vimrc file
## If preconfig folder deos not exist. Create it
if [ ! -d ~/preconfig ]
then
	mkdir ~/preconfig
fi
## If the run.sh file in preconfig folder exist. Delete
if [ -f ~/preconfig/run.sh ]
then
	rm ~/preconfig/run.sh
fi
## If the .vimrc file in preconfig folder exist. Delete
if [ -f ~/preconfig/.vimrc ]
then
	rm ~/preconfig/.vimrc
fi
## Write content to run.sh file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/run.sh
#!/bin/bash

## If previmrc already exist. Delete it
if [ -f ~/preconfig/previmrc ]
then
	rm ~/preconfig/previmrc
fi

## If .vimrc in root foleder does not exist. Create it
if [ ! -f ~/.vimrc ]
then
	touch ~/.vimrc
fi

## If .vimrc.origin does not exist. Create it
if [ ! -f ~/.vimrc.backup ]
then
	cp ~/.vimrc ~/.vimrc.backup
fi
## move .vimrc to previmrc file in preconfig folder
mv ~/.vimrc ~/preconfig/previmrc

## move .vimrc int preconfig folder to root folder
mv ~/preconfig/.vimrc ~/.vimrc

EOF
## Write content to .vimrc file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/.vimrc

set history=200
set paste
set wrap
set number

map \t :ter

EOF
