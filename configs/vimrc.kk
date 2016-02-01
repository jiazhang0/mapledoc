" kk's vim profile <freeordie.k@gmail.com>
"
" Vundle is short for Vim bundle and is a Vim plugin manager.
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

let mapleader = ","

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'easymotion/vim-easymotion'

Plugin 'scrooloose/nerdtree'
map <c-t> :NERDTreeToggle<CR>

Plugin 'davidhalter/jedi-vim'
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_command = "<C-i>"

" toggle with `<Leader>ig` and default color is very ugly
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

Plugin 'hdima/python-syntax'
let python_highlight_all = 1

Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2
set encoding=UTF-8
set t_Co=256
let g:Powerline_symbols = 'fancy'


" 自动补全配置 {
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" }


Plugin 'Valloric/YouCompleteMe'
" YouCompleteMe {
let g:ycm_global_ycm_extra_conf = '~/git/mapledoc/configs/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }


" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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

"au BufReadPost * call PythonSet()

" folding
set foldenable
" set foldopen=all
" set foldclose=all
" set foldmethod=syntax
" setlocal foldlevel=1
" set foldcolumn=3
