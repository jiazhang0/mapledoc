# bash profile for myself

echo 'source bashrc.kk'

# for ls output
export LC_COLLATE=C

# alias
alias m='make'
alias ll='ls -l'

shopt -s autocd
shopt -s cdspell

# record history in every console
shopt -s histappend
PROMPT_COMMAND='history -a'

# for python
export PYTHONSTARTUP=`pwd`/pythonstartup.py

