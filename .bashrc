# .bashrc
# vim: noic nolist sw=4 ts=4 expandtab
shopt -s histappend

#set -o xtrace
#set -o verbose

POWERLINE_BASE_CONTINUATION=0
POWERLINE_BASH_SELECT=0


[[ -x $HOME/u/run/findutils/bin/find ]] && alias 'find'="$HOME/u/run/findutils/bin/find"

PS1='\n\e[2m\e[32m\u\e[0m@\H\n[\w]\n:# '


[[ -n $H ]] && cd $H && alias cdh="cd $H"

export EDITOR=~/u/run/neovim/bin/nvim

export GOPATH=$HOME/work/go
PATH=$PATH:$GOPATH/bin:/usr/local/node-v8.9.0-linux-x64/bin

export PYFLAKES_BUILTINS='__opts__,__salt__,__grains__,__pillar__,request'

colors(){
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}:  \\\033[0;3${i}m\n"
    done
}


DJANGO_ENVIRONMENT='local'

NATIVEPY=/usr/bin/python
[[ -d "$HOME/.local/bin" ]] && PATH=$HOME/.local/bin:$PATH

VWRAP=/usr/share/virtualenvwrapper/virtualenvwrapper.sh

# export WORKON=$HOME/pyenv

if [[ -n $TMUX ]];
then
    VIRTUALENVWRAPPER_PYTHON=$NATIVEPY && . $VWRAP
    [[ -n $VIRTUAL_ENV ]] && . $HOME/.virtualenvs/set_prompt || . $VWRAP
else
   .  $VWRAP
fi

[[ -n $VIRTUAL_ENV ]] && . $VIRTUAL_ENV/../libvw

[[ -n "$THIS" ]] && workon ${THIS} && . $HOME/.virtualenvs/set_prompt &&
    [[ -f $H/.env ]] && . $H/.env


[[ -d $HOME/u/etc/skel/*.sh ]] && . $HOME/u/etc/skel/*.sh

gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}



function watch_sphinx() {
    if [[ -d ./_build ]];
    then
        while [[ /dev/null ]];
        do
            [[ $( find . -type f -not -path "./_*/*" -mmin 0.083 ) ]] && make html
            sleep 6
        done
    else
        echo "not a sphinx directory (no _build directory)"
    fi
}

#eval "$($HOME/.pyenv/bin/pyenv init -)"

[[ -d $HOME/bin ]] && PATH=$HOME/bin:$PATH

alias iax="alias iex='rlwrap -a foo iex'"
alias wherei='curl -s api.ipify.org; echo'
alias paws="grep '^\[' ~/.aws/config"

export PATH="$HOME/git/wharton-kube/bin:$PATH"

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="false"


alias vim=$( which nvim )
alias vim=~/u/run/neovim/bin/nvim
alias nvim=~/u/run/neovim/bin/nvim

PATH=$HOME/u/bin:$HOME/.local/bin:$PATH
export NO_OVERRIDE=1

[[ -f ~/.bash_kube-aliases ]] && . ~/.bash_kube-aliases

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gladiatr/git/google-cloud-sdk/path.bash.inc' ]; then source '/home/gladiatr/git/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gladiatr/git/google-cloud-sdk/completion.bash.inc' ]; then source '/home/gladiatr/git/google-cloud-sdk/completion.bash.inc'; fi

#. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
#
# [[ -z $MAIN_ADDR ]] &&
#     export MAIN_ADDR=$(
#         ip a ls $(
#             ip r ls default |
#             sed -nEe '/^default/s/^.*dev (.*)/\1/p'
#             ) |
#         sed -nEe 's/[[:blank:]]+inet ([^/]+).*/\1/p'
#     )
#
# [[ -z $PKG_PROXY ]] &&
# 	nc -w 1 -z 10.129.1.1 3128  &&
# 	export PKG_PROXY=http://10.129.1.1:3128
#
# [[ -z $PYPROXY ]] &&
#     nc -w 1 -z ${MAIN_ADDR} 3141 &&
#     export PYPROXY=${MAIN_ADDR} &&
#     export PIP_INDEX_URL=http://${PYPROXY}:3141/root/pypi/+simple/ &&
#     export PIP_TRUSTED_HOST=${PYPROXY}
#
# export PIP_RESPECT_VIRTUALENV=true
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
#

exit_session() {
    [[ -n $H ]] && stop_pg
    . "$HOME/.bash_logout"
}
trap exit_session SIGHUP


[[ -n $VIRTUAL_ENV ]] && ( [[ -n $LD_LIBRARY_PATH ]] && export LD_LIBRARY_PATH=$VIRTUAL_ENV/lib:${LD_LIBRARY_PATH} || export LD_LIBRARY_PATH=$VIRTUAL_ENV/lib )


PATH=/usr/lib/postgresql/9.6/bin:$PATH

complete -C '/home/gladiatr/.virtualenvs/awscli/bin/aws_completer' aws


complete -C /usr/local/bin/terraform terraform

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -d $HOME/.rvm ]] && RVM=$HOME/.rvm &&
    . $RVM/scripts/rvm;
    . $RVM/scripts/completion

[[ -f $HOME/.bash_tmux ]] && . $HOME/.bash_tmux

. /etc/bash_completion

alias ="exit"
alias un='unset LDFLAGS MANPATH GOPATH CFLAGS LD_LIBRARY_PATH PKG_CONFIG_PATH ORIGINAL_PATH; PATH=/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'

export AWS_SDK_LOAD_CONFIG=1

unset PKG_PROXY
#export PYENV_ROOT=$HOME/.pyenv

source <( _kubectl-v1.9.10 completion bash )
