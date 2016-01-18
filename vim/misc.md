# vim miscellaneous notes

## TIPS
* 3$: move curse to the end of 3rd line
* fy: forward next y
* Fy: backward to previous y
* ty: move to charater before next y
* macro: qa < -- > @a
* **digraphs**: © --> Ctrl+k Co --> :digraphs
* !!shell_command
* :rewind & :last
* countCtrl-^: 
* :count split +command: 3split +/printf xxx.c --> open xxx.c with 3 lines and goto the first printf
* :new
* :hide 

* :buffers Active Hidden Inactive


## Syntax Coloring
- :syntax on
- :set **background?**
- :set filetype=c
- :help new-filetype


## Automatic Indentation
- cindent
- smartindent
- autoindent

## locate items in a program
- [Ctrl-I ]Ctrl-I: 	Search for a word under the cursor in the current file and any brought in by #include directives.
- gd gD: 		go definition of a variable
- ]CTRL-D , [CTRL-D: 	Jump to a macro definition.
- ]d, [d , ]D, [D: 	Display macro definitions.

## Tags
- :tag xxx:		go to definition

## abbreviations
- :abbreviate kk Kai Kai

## Mapping
- :map : For the Normal, Insert, Visual, and Command-line modes
- :imap : For the Insert mode only
- :cmap : For the Command-line mode only
- :nmap : For the Normal mode only
- :vmap : For the Visual mode only

## Save current configure
- :mkvimrc filename

## Text
- :set textwidth=xx
- :rang center/right/left width

## Auto completion
- CTRL-D 	Macro definitions
- CTRL-F 	Filenames
- CTRL-K 	Dictionary
- CTRL-I 	Current files and #included fi les
- CTRL-L 	Whole lines
- CTRL-] 	Tags
- CTRL-P 	Same as CTRL-P without the CTRL-X (find previous match)
- CTRL-N 	Same as CTRL-N without the CTRL-X (find next match)

** How to use them **

## Auto command
- :autocmd 
- :autogroup	--> define a group of autocommands by :autogroup group_name ... :autogroup END
- group :autocmd group_name FileReadPost *.h :set cindent	--> add a new cmd to group
- :doautocmd group_name event file_name
- :doautoall
- ** :help autocmd-events **
