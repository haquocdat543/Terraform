#!/bin/bash

### This is configuration for .vimrc file
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

## If .vimrc.backup does not exist. Create it
if [ ! -f ~/preconfig/backup/.vimrc.backup ]
then
	cp ~/.vimrc ~/preconfig/backup/.vimrc.backup 
fi
## move .vimrc to previmrc file in preconfig folder
mv ~/.vimrc ~/preconfig/previmrc

## move .vimrc in preconfig folder to root folder
mv ~/preconfig/.vimrc ~/.vimrc

EOF
## Write content to .vimrc file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/.vimrc
let mapleader = " "

set history=200
set paste
set wrap
set number
set ruler
set showcmd
set showmode
set wildmenu
set laststatus=2

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

map <C-T> :ter<CR>
map <C-b> :set backup<CR>
map <C-h> :noh<CR>
map <C-q> :q!<CR>
map <C-c> :%s/
map <C-i> :PlugInstall<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <Left> :echoe 'use h key instead'<CR>
nnoremap <Right> :echoe 'use l key instead'<CR>
nnoremap <Up> :echoe 'use k key instead'<CR>
nnoremap <Down> :echoe 'use j key instead'<CR>

nnoremap <mapleader>\ :vsplit
nnoremap <mapleader>/ :split

EOF

clear
