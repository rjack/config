" Maintainer:   Giacomo Ritucci
" URL:          http://ubuntuone.com/p/NPR/
" Updated:      11/12/2008
"
" Derived from the .vimrc files by
" - Bram Moolenaar <Bram@vim.org>
" - Markus Mottl <markus.mottl@gmail.com>


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings
set nocompatible

" Always set autoindenting on
set autoindent

" Automatically write buffer before special actions
set autowrite

" Always want statusline
set laststatus=2

" Set statusline
set statusline=%<%f\ \ \|\ %o\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set nobackup		" keep a backup file
endif

" Keep 50 lines of command line history
set history=50

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" As it was written, so it shall be done
set textwidth=78

" No bell, no visual bell
set vb t_vb=

" Dark background
set background=dark

" Don't use Ex mode, use Q for formatting
map Q gq

" Turn off match highlighting
map <F11> :noh<CR>

" make and make clean
map <F5> :make<CR>
map <F6> :make clean<CR>

" Launch clisp in repl mode, with the current buffer loaded
map <F12> :!clisp -repl %<CR>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")


  autocmd BufNewFile,BufRead *.json set ft=javascript

  call pathogen#infect()

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on


  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
 
  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType coffee setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufRead *.md set ft=markdown

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else


endif " has("autocmd")
