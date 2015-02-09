"------------------------------------------------------------------------------
" neobundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
" call neobundle#rc(expand('~/.vim/bundle'))
  call neobundle#begin(expand('~/.vim/bundle'))
  call neobundle#end()
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

filetype plugin indent on
filetype indent on
syntax on
"call neobundle#rc(expand('~/.vim/bundle/'))

"filetype plugin indent on

"if nebundle#exists_not_installed_bundles()
"  echomsg 'Not installed bundles : ' .
"        \ string(neobundle#get_not_installed_bundle_names())
"  echomsg 'Please execute ":NeoBundleInstall" command.'
"endif       
"------------------------------------------------------------------------------

autocmd FileType javascript setl autoindent
autocmd FileType javascript setl smartindent
autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
execute pathogen#infect()
set autoindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=0
set expandtab
let g:syntastic_javascript_checkers=['gjslint']
" shiftwidthを2にするやつ
let g:SimpleJsIndenter_briefMode = 2
" switchのインデントを多少まともに
let g:SimpleJsIndenter_CaseIndentLevel = -1
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
