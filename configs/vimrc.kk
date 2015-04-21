" kk's vim profile <freeordie.k@gmail.com>
"
" Vundle is short for Vim bundle and is a Vim plugin manager.
" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'L9'

Plugin 'git://git.wincent.com/command-t.git'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}


" kk legacy
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" powerline{
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
" }

Plugin 'Valloric/YouCompleteMe'
" YouCompleteMe {
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }
" UltiSnips ???

Plugin 'sontek/dotfiles'
" ./install.sh vim
" tomasr/molokai 不好用啊，为什么需要它？


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
" set foldmethod=syntax
" setlocal foldlevel=1
" set foldcolumn=3
