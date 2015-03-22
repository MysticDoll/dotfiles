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

NeoBundle 'tpope/vim-pathogen.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-pathogen'))
  call pathogen#infect('~/.vim/bundle/manual')
endif
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'vim-scripts/VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchcmck/vim-coffee-script'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'TwitVim'
NeoBundle 'open-browser.vim'
NeoBundle 'kannokanno/previm'

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

"execute pathogen#infect()
colorscheme pablo
set background=dark
autocmd FileType javascript setl autoindent
autocmd FileType javascript setl smartindent
autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
let $LANG='ja_JP.UTF-8'
"set encoding=utf-8
set directory=~/vimfiles/tmp
set backupdir=~/vimfiles/tmp
set fileencoding=utf-8
set autoindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=0
set expandtab
set number
let g:syntastic_javascript_checkers=['gjslint']
" shiftwidthを2にするやつ
let g:SimpleJsIndenter_briefMode = 2
" switchのインデントを多少まともに
let g:SimpleJsIndenter_CaseIndentLevel = -1
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee   setlocal sw=2 sts=2 ts=2 et

  "保存と同時にコンパイルする
autocmd BufWritePost *.coffee silent make! 
  "エラーがあったら別ウィンドウで表示
autocmd QuickFixCmdPost * nested cwindow | redraw! 
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1

hi IndentGuidesOdd ctermbg=235
hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_space_guides=1
au FileType coffee,ruby,javascript,python IndentGuidesEnable 
nmap <silent><Leader>ig <Plug>IndentGuidesToggle
"Twit Vim 
let twitvim_browser_cmd = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' " for Windows
let twitvim_force_ssl = 1 
let twitvim_count = 40
"openbrowser

let g:netrw_nogx = 1
nmap gx <plug>(openbrowser-smart-search)
vmap gx <plug>(openbrowser-smart-search)
