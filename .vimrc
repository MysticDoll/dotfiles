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
"NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc.vim'
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
NeoBundle 'ujihisa/shadow.vim'
NeoBundle 'rbtnn/game_engine.vim'
NeoBundle 'rbtnn/mario.vim'
NeoBundle 'rbtnn/puyo.vim'
NeoBundle 'severin-lemaignan/vim-minimap'
NeoBundle 'tetris.vim'
NeoBundle 'sokoban.vim'
NeoBundle 'vim-latex'

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
colorscheme darkblue
set background=dark
autocmd FileType javascript setl autoindent
autocmd FileType javascript setl smartindent
autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType coffee set fileencoding=utf-8
let $LANG='ja_JP.UTF-8'
"set encoding=utf-8
set directory=~/vimfiles/tmp
set backupdir=~/vimfiles/tmp
set undodir=~/vimfiles/undo
set fileencoding=utf-8
set autoindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=0
set expandtab
set lines=60
set columns=250
set number
let g:syntastic_javascript_checkers=['gjslint']
" shiftwidthを2にするやつ
let g:SimpleJsIndenter_briefMode = 2
" switchのインデントを多少まともに
let g:SimpleJsIndenter_CaseIndentLevel = -1
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType txt setlocal textwidth=0
autocmd FileType coffee   setlocal sw=2 sts=2 ts=2 et

  "保存と同時にコンパイルする
"autocmd BufWritePost *.coffee silent make! 
nnoremap <Leader><C-C> :silent make!<Enter>
  "エラーがあったら別ウィンドウで表示
autocmd QuickFixCmdPost * nested cwindow | redraw! 
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1

hi IndentGuidesOdd ctermbg=gray
hi IndentGuidesEven ctermbg=darkgray
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

"" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


""neosnippet
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" run mikutter

function! s:runMikutter()
 !start C:\\Ruby200\\bin\\rubyw.exe D:\\mikutter3.2.2\\mikutter.rb 
endfunction

command! -nargs=0 Mikutter call s:runMikutter()
