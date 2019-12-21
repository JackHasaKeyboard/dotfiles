trap "source ~/.zshrc" USR1 # source whenever zsh receives a USR1 signal

# oh-my-zsh default {{{
export UPDATE_ZSH_DAYS=7
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR="vim"
else
	export EDITOR="nvim"
fi
# }}}

# general {{{
export PS1="%d%% "

setopt NO_BEEP

set -o vi
# }}}

# syntax {{{
export TERM=xterm-256color
# }}}

# history {{{
# export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
# export HISTSIZE=10000
# export HISTFILE=~/.zsh_history
# export SAVEHIST=10000
# setopt INC_APPEND_HISTORY
# setopt HIST_IGNORE_ALL_DUPS
# setopt HIST_IGNORE_SPACE
# setopt HIST_REDUCE_BLANKS
# setopt HIST_VERIFY
# }}}

# compilation flags {{{
export ARCHFLAGS="-arch x86_64"
# }}}

# ssh {{{
export SSH_KEY_PATH="~/.ssh/dsa_id"
# }}}

# alias, function {{{
alias sudo='nocorrect sudo '

alias add-jquery="curl -O https://code.jquery.com/jquery-3.1.0.min.js"

alias vim="nvim -u ~/.nvimrc"

alias tmux="tmux -2"

alias td="vim ~/Dropbox/note/todo.org"

alias restart-pg="sudo pg_ctlcluster 9.5 main restart"

alias init-git="
git init;
git add .;
git commit -m 'Init commit'
"

alias rm-deleted="git ls-files --deleted -z | xargs -0 git rm"
# }}}

alias psql="sudo -u postgres psql"
alias start-pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

alias rm-pid="kill -9 $(lsof -i tcp:3000 -t)"

alias hamlize="
find . -name \*.erb -print | sed 'p;s/.erb$/.haml/' | xargs -n2 html2haml;
rm **/*.erb
"

alias mk-env="
git clone -C ~/ https://github.com/jackhasakeyboard/dotfiles
for f ('zshrc' 'tmux.conf' 'gitconfig' 'vimrc' 'nvimrc'); do ln -s ~/dotfiles/.$f/.$f ~/.$f; done
# }}}
# zsh {{{
# }}}
# tmux {{{
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# }}}
# vim {{{
# }}}
# }}}
# todo curl install neovim {{{
# }}}
# curl install xdotool {{{
"

alias sess="
tmuxinator
"

function cmd() {
google-chrome cmd.jackhasakeyboard.co/"$1"
}

# breadcrumb trail
function ..() {
for i in `seq "$1"`; do cd ..; done
}

function con-do {
if [ "$1" = "cmd" ]; then
	addr = "159.203.184.27"
elif [ "$1" = "myde" ]; then
	addr = "192.81.211.248"
elif [ "$1" = "jhak" ]; then
	addr = "192.81.211.248"
fi

ssh root@addr
}

function mk-remote() {
curl -u 'jackhasakeyboard' https://api.github.com/user/repos -d '{"name": "'$1'"}'
}

function mk-remote-scrap() {
curl -u 'jack-scrap' https://api.github.com/user/repos -d '{"name": "'$1'"}'
}

function note() {
if [ "$1" != "" ]; then
	vim ~/Dropbox/note/"$1".org
else
	vim ~/Dropbox/note/
fi
}

function ref() {
if [ "$1" != "" ]; then
	vim ~/Dropbox/ref/"$1".org
else
	vim ~/Dropbox/ref/
fi
}

function url {
if [ "$1" =~ "." ]; then
	google-chrome "$1"
else
	google-chrome "$1".com
fi
}

function cmd() {
google-chrome "cmd.jackhasakeyboard.co/$1"
}

function ror-temp() {
git -C ~/ror/ clone https://github.com/jackhasakeyboard/ror-template "$1"
}

function temp() {
git clone -C ~/"$1"/ https://github.com/jackhasakeyboard/"$1"-template
}

function add-gem() {
echo "gem '$1'" >> Gemfile
}

function clone-github() {
git clone https://github.com/"$1"
}
# }}}

# quick access {{{
function rc() {
if [ "$1" = "" ]; then
	vim ~/dotfiles
elif [ "$1" = "tmux" ]; then
	vim ~/.tmux.conf
else
	vim ~/."$1"rc
fi
}
# }}}

# personal settings {{{
plugins=(
git
rails
colored-man-pages
colorize
github
jira
vagrant
virtualenv
pip
python
brew
osx
zsh-syntax-highlighting
)

source $HOME/.zshenv

source ~/.bin/tmuxinator.zsh
# }}}

# plugin {{{
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# }}}
