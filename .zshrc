# general {{{
export PS1="%d%% "

setopt autocd

set -o vi

# alias, function {{{
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

# editor {{{
alias vim="nvim -u ~/.nvimrc"
# }}}

# LaTeX {{{
PATH=$PATH:/Library/TeX/texbin

alias pdflatex="pdflatex -output-directory ~/out"

function vu {
	zathura ~/out/"$1".pdf
}
# }}}
