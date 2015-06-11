# bash profile for myself

echo 'source bashrc.kk'

# show Capital files first
export LC_COLLATE=C

# alias
alias m='make'
alias ls='ls --color'
alias ll='ls -l'
alias grep='grep --color'
alias cp='cp -v'
alias mv='mv -v'
alias dv='dirs -v'

shopt -s autocd
shopt -s cdspell

# record history in every console
shopt -s histappend
PROMPT_COMMAND='history -a'
