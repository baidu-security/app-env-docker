export PS1="\[\033[01;32m\][OpenRASP] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] # "
export PATH=$PATH:/jdk/bin

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lah --color=auto'
alias l='ll'

shopt -s autocd
