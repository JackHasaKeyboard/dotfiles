export PS1="%d%% "

alias td="vim ~/Dropbox/note/TODO.org"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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
