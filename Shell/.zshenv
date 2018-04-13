#
# .zshenv
#


#
# Locale
#

locales=`/usr/bin/locale -a`
LOLALE_PREFERENCES=(
  "ja_JP.UTF-8"
  "ja_JP.UTF8"
  "en_US.UTF-8"
  "en_US.UTF8"
  "C"
)

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


#
# Paths
#

export PATH=~/.local/bin:$PATH
export MANPATH=~/.local/share/man:$MANPATH

export LIBRARY_PATH=~/.local/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=~/.local/lib:$LD_LIBRARY_PATH
export INCLUDE_PATH=~/.local/include:$INCLUDE_PATH
export C_INCLUDE_PATH=~/.local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=~/.local/include:$CPLUS_INCLUDE_PATH


#
# Environment-specific
#

case $OSTYPE in
darwin*)
  if type brew &> /dev/null
  then
    fpath=(
      /usr/local/share/zsh-completions
      /usr/local/share/zsh/site-functions
      /usr/local/share/zsh/vendor-completions
      $fpath
    )
  fi
  ;;
linux*)
  unsetopt GLOBAL_RCS
  emulate -L ksh
  source /etc/profile
  emulate zsh
  ;;
*)
  unsetopt GLOBAL_RCS
  emulate -L ksh
  source /etc/profile
  emulate zsh
  ;;
esac


#
# Development
#

if (type python3 || type python2 || type python) &> /dev/null
then
  export PYTHONIOENCODING=UTF-8
fi

if type go &> /dev/null
then
  export GOPATH=~/.go
  export PATH=$GOPATH/bin:$PATH
fi

if type java &> /dev/null
then
  if type /usr/libexec/java_home &> /dev/null
  then
    # macOS
    export JAVA_HOME=`/usr/libexec/java_home`
  else
    # Linux
    export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))
  fi
fi


#
# Includes
#

include_files=(
  ~/.zsh/zshenv/*(.N)
  ~/.zshenv.d/*(.N)
  ~/.zshenv.*(.N)
)

for include_file in $include_files
do
  source $include_file
done
