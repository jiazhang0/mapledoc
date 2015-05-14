#Vim Plugins#
-------------

## Vundle ##
It is recommend to use Vundle to manage vim plugins. It refers to Vim Bundle.

Download the source code:
     
     git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Then copy the sample configure into .vimrc.

Launch vim to run :PluginInstall.

## Command T ##
An useful file explorer.

### build ###
     cd ~/.vim/bundle/command-t
     rake make

### Usage ###
     :CommandT

## You complete me ##
### install ###

     cd ~/.vim/bundle/YouCompleteMe
     ./install.sh --clang-completer
     
### Config ###
Set in .vimrc:
     
      let g:ycm_global_ycm_extra_conf = 'path to .ycm_extra_conf.py'



------------------------------
At last, some useful webpages:

      http://www.cnblogs.com/zhongcq/p/3642794.html
      http://tieba.baidu.com/p/2672605209
