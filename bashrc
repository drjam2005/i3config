#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ff='fastfetch --color "#ffb0ce" --color-output "#bbbbbb" --config ~/.config/i3/fastfetch/config.jsonc'
alias nvimConfig='nvim ~/.config/nvim'
alias grep='grep --color=auto'
alias cmus='~/.Scripts/cmus_notif.sh & cmus'
alias y='yazi'
ff
PS1='[\u@\h \W]\$ '

export GTK_THEME="oomox-Gigavolt"
export EDITOR=nvim
eval "$(starship init bash)"
