export PS1="%d%% "

export ZSH_CUSTOM="~/.oh-my-zsh/custom"

plugins=(
	zsh-autosuggestions
)

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
