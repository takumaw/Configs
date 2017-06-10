#
# .zshenv
#


# locale
#

locales=`/usr/bin/locale -a`
LOLALE_PREFERENCES=(
    "ja_JP.UTF-8"
    "ja_JP.UTF8"
    "en_US.UTF-8"
    "en_US.UTF8"
)

LOCALE_FOUND=0
for LOLALE_PREFERENCE in $LOLALE_PREFERENCES
do
    if echo $locales | grep -i $LOLALE_PREFERENCE &> /dev/null
    then
        export LANG=$LOLALE_PREFERENCE
        export LANGUAGE=`echo $LOLALE_PREFERENCE | cut -d "_" -f 1`
        LOCALE_FOUND=1
        break
    fi
done
if test $LOCALE_FOUND -eq 0
then
    export LANG=C
    export LANGUAGE=en
fi


# paths
#

export PATH=~/.local/bin:$PATH
export MANPATH=~/.local/share/man:$MANPATH

export LIBRARY_PATH=~/.local/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=~/.local/lib:$LD_LIBRARY_PATH
export INCLUDE_PATH=~/.local/include:$INCLUDE_PATH
export C_INCLUDE_PATH=~/.local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=~/.local/include:$CPLUS_INCLUDE_PATH

export PYTHONIOENCODING=UTF-8

if type go &> /dev/null
then
    export GOPATH=~/.go
    export PATH=$GOPATH/bin:$PATH
fi


# environment-specific
#

case $OSTYPE in
darwin*)
    fpath=(
        /usr/local/share/zsh-completions
        /usr/local/share/zsh/site-functions
        /usr/local/share/zsh/vendor-completions
        $fpath
    )

    export JAVA_HOME=`/usr/libexec/java_home`
    ;;
linux*)
    unsetopt GLOBAL_RCS
    emulate -L ksh
    source /etc/profile
    emulate zsh

    if type java &> /dev/null
    then
        export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))
    fi
    ;;
*)
    unsetopt GLOBAL_RCS
    emulate -L ksh
    source /etc/profile
    emulate zsh

    if type java &> /dev/null
    then
        export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))
    fi
    ;;
esac


# includes
#

include_files=(~/.zshenv.*(N))
for include_file in $include_files
do
    source $include_file
done
