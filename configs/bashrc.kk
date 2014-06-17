# bash profile for myself

echo 'source bashrc.kk'

# show Capital files first
export LC_COLLATE=C

# alias
alias m='make'
alias ll='ls -l'
alias grep='grep --color'
alias cp='cp -v'

shopt -s autocd
shopt -s cdspell

# record history in every console
shopt -s histappend
PROMPT_COMMAND='history -a'

# for python
export PYTHONSTARTUP=$HOME/git/mapledoc/configs/pythonstartup.py

