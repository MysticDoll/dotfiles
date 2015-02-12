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
NeoBundle 'Shougo/vimproc'
NeoBundle 'vim-scripts/VimClojure'
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

colorscheme elflord
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
NeoBundle 'kchcmck/vim-coffee-script'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee   setlocal sw=1 sts=2 ts=2 et

autocmd BufWritePOst *.coffee silent CoffeeMake! -cb | cwindow | redraw!

function! JasmineSetting()
  au BufRead,BufNewFile *Helper.js*Spec.js set filetype=jasmine.javascript
  au BufRead,BufNewFile *Helper/coffee,*Spec.coffee set filetype=jasmine.coffee
  au BufRead,BufNewFile,BufReadPre *Helper.coffee,*Spec.coffee let b:quickrun_config = {'type' : 'coffee'}
  call jasmine#load_snippets()
  map <buffer> <leader>m :JasmineRedGreen<CR>
  command! JasmineRedGreen :call jasmine#redgreen()
  command! JasmineMake :call jasmine#make()
endfunction
au BufRead,BufNewFile,BufReadPre *.coffee,*.js call JasmineSetting()

let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd ctermbg=235
hi IndentGuidesEven ctermbg=237
au FileType coffee,ruby,javascript,python IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle
