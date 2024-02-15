#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias grep='grep --color=auto'

# want to customize PS, see: https://wiki.archlinux.org/title/Bash/Prompt_customization
PS1='\w]$ '

# stop logging of consecutive identical commands.
# export HISTCONTROL=ignoredups
# avoid saving commands that start with a space
# export HISTCONTROL=ignorespace
export HISTCONTROL=ignoreboth

# Todo: install shellcheck package for Checking errors by analyzing scripts
# Todo: install bash-completion

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
