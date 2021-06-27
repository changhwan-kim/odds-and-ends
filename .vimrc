set nocompatible

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"	  for Unix and OS/2:  ~/.vimrc
"		  for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"		for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
	finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file (restore to previous version)
	if has('persistent_undo')
		set undofile	" keep an undo file (undo changes after closing)
	endif
endif

if &t_Co > 2 || has("gui_running")
	" Switch on highlighting the last used search pattern.
	set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
	packadd! matchit
endif


" ======================================================================
" Custom Plugins
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'morhetz/gruvbox'
	Plugin 'scrooloose/nerdtree'
	Plugin 'vim-airline/vim-airline'
	Plugin 'valloric/youcompleteme'
	Plugin 'tpope/vim-fugitive'
	Plugin 'junegunn/fzf'
call vundle#end()
filetype plugin indent on
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'



" Custom Settings
colorscheme gruvbox
set background=dark
set termguicolors

if has("syntax")
	syntax on
endif
set clipboard=unnamedplus
set number relativenumber numberwidth=4 " number
set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab smarttab " tab
set hlsearch incsearch nowrapscan ignorecase smartcase " search
set laststatus=2 ruler " status-line
set nobackup noundofile noswapfile " creat file
set cindent autoindent smartindent " indent
set nowrap history=200 splitright splitbelow



" Custom Key Mappings
let mapleader=" "
nnoremap <silent><C-L> <C-L>:let @/=""<CR>
nnoremap <silent><C-N> :NERDTreeToggle<CR>
nnoremap <silent><C-F> :FZF<CR>
nnoremap <silent><Leader>d :bd<CR>
nnoremap <silent><Leader>p :bp<CR>
nnoremap <silent><Leader>n :bn<CR>
nnoremap <silent><Leader>1 :b1<CR>
nnoremap <silent><Leader>2 :b2<CR>
nnoremap <silent><Leader>3 :b3<CR>
nnoremap <silent><Leader>4 :b4<CR>
nnoremap <silent><Leader>5 :b5<CR>
nnoremap <silent><Leader>6 :b6<CR>
nnoremap <silent><Leader>7 :b7<CR>
nnoremap <silent><Leader>8 :b8<CR>
nnoremap <silent><Leader>9 :b9<CR>

