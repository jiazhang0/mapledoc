" kk's vim profile <freeordie.k@gmail.com>

" from https://github.com/gmarik/vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-fugitive'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = ','

Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" end from vundle
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Bundle "Lokaltog/powerline", {'rtp': 'powerline/bindings/vim/'}
" powerline{
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
" }

" Bundle "Valloric/YouCompleteMe"
" YouCompleteMe {
let g:ycm_global_ycm_extra_conf = 'YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
" }

" Begin custom settings
set ai
set hlsearch
set incsearch
set cursorline
highlight CursorLine ctermbg=lightgray

map <F2> <Esc>:Tlist<CR>

"for python set
function! PythonSet()
        let l:filename = bufname("%")
        let l:line = getline(1)
        if l:line =~ "^#!.*python" || l:filename =~ ".*\.py"
                set cursorcolumn
                set expandtab
                set ts=4
                set sw=4
"                set foldmethod=indent
        endif
endfunction

au BufReadPost * call PythonSet()

" folding
set foldenable
" set foldopen=all
" set foldclose=all
set foldmethod=syntax
" setlocal foldlevel=1
set foldcolumn=2
