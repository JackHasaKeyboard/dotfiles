# general {{{
export PS1="%d%% "

setopt autocd

set -o vi

# alias, function {{{
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias td="vim ~/Dropbox/note/TODO.org"

function note() {
	if [ "$1" != ""  ]; then
		vim ~/Dropbox/note/"$1".org
	else
		vim ~/Dropbox/note/
	fi
}

function ref() {
	if [ "$1" != ""  ]; then
		vim ~/Dropbox/ref/"$1".org
	else
		vim ~/Dropbox/ref/
	fi
}
# }}}
# }}}

# script {{{
# autosuggestions {{{
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^I' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='underline'
# }}}
# }}}

# history {{{
HISTFILE=~/.zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY
# }}}

# editor {{{
alias vim="nvim -u ~/.nvimrc"
# }}}

# Tmux {{{
alias tmux="tmux -2"
alias sess="tmuxinator"
# }}}

# LaTeX {{{
PATH=$PATH:/usr/local/texlive/2020/bin/x86_64-darwin

alias pdflatex="pdflatex -output-directory ~/out"

function vu {
	zathura ~/out/"$1".pdf
}
# }}}

set -g default-terminal "rxvt-unicode-256color"
