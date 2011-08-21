#
# Tureba's base bashrc
#
#   To use it, source this from .bashrc, followed by
#   the local machine's definitions. This should be
#   located in ~/.config/vim/bashrc
#
# who: Arthur Nascimento <tureba@gmail.com>
# where: github.com/tureba/myconfigfiles
#

# useful stuff
shopt -sq autocd cdspell cmdhist dirspell extglob histappend
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# audio/visual bell be gone
xset -b &>/dev/null

export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

export LC_ALL=C
export LANG=pt_BR.UTF-8
export LANGUAGE=pt_BR.UTF-8

export HISTSIZE=1000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth

export GREP_OPTIONS='--color=auto'
export PAGER=less
export EDITOR=vim

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export INPUTRC=~/.inputrc
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

### setup the key agent ###
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
	echo "Initializing new SSH agent..."
	ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	ps -p ${SSH_AGENT_PID} -ef | grep -e 'ssh-agent$' > /dev/null || {
		start_agent;
	}
else
	start_agent;
fi

. "${SSH_ENV}" &>/dev/null
ssh-add -l &>/dev/null || ssh-add &>/dev/null

