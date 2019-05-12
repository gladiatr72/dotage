
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh

OLDIFS=${IFS}
IFS=$'\n'
if [[ -d $HOME/u/run ]];
then
    PATH=$( find -L $HOME/u/run -maxdepth 2 -type d -name "bin" -or -name "sbin" | tr '\n' ':'| sed -e 's/:$//'):$PATH
    export MANPATH=$( find -L $HOME/u/run -type d -name "man" | tr '\n' ':' | sed -e 's/:$//'):$MANPATH

    for x in $( find -L $HOME/u/run -maxdepth 2 -type d -name "include" );
    do 
        CFLAGS+="-I$x "; 
        LDFLAGS+="-L$( echo $x | sed -e 's/include/lib/' ) "; 
        PREPATH="$( echo $x | sed -e 's/include/bin/' ):$( echo $x | sed -e 's/include/sbin/' ):"
    done 

    PKG_CONFIG_PATH=$( find -L $HOME/u/run -type d -name 'pkgconfig' | tr '\n', ':')

    PATH="$PREPATH:$PATH"
    export LD_LIBRARY_PATH=$( find -L $HOME/u/run -maxdepth 2 -type d -name "lib" | tr '\n' ':' | sed -e 's/:$//' )$LD_LIBRARY_PATH
    export CFLAGS LDFLAGS LD_LIBRARY_PATH PKG_CONFIG_PATH
fi
IFS=${OLDIFS}

case "$-" in
	*i*)
		. ~/.bashrc
		;;
esac


export PATH="$HOME/.cargo/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

