#
# .zshenv
#


#
# Global
#

#if [[ ! $OSTYPE =~ "darwin" ]]
#then
#  unsetopt GLOBAL_RCS
#  emulate -L ksh
#  source /etc/profile
#  emulate zsh
#fi


#
# Paths
#

typeset -U path
path=(
  ~/.local/bin(/N)
  $PATH
)
export PATH

typeset -U manpath
manpath=(
  ~/.local/share/man(/N)
  $manpath
)

typeset -U fpath
fpath=(
  /usr/local/share/zsh/site-functions(/N)
  /usr/local/share/zsh/vendor-completions(/N)
  /usr/local/share/zsh-completions(/N)
  /usr/share/zsh/site-functions(/N)
  /usr/share/zsh/vendor-completions(/N)
  $fpath
)


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
# Development Tools
#

# typeset -TU LIBRARY_PATH library_path
# library_path=(
#   ~/.local/lib
#   $library_path
# )
# export LIBRARY_PATH

# typeset -TU LD_LIBRARY_PATH ld_library_path
# ld_library_path=(
#   ~/.local/lib
#   $ld_library_path
# )
# export LD_LIBRARY_PATH

# typeset -TU INCLUDE_PATH include_path
# include_path=(
#   ~/.local/include
#   $include_path
# )
# export INCLUDE_PATH

# typeset -TU C_INCLUDE_PATH c_include_path
# c_include_path=(
#   ~/.local/include
#   $c_include_path
# )
# export C_INCLUDE_PATH

# typeset -TU CPLUS_INCLUDE_PATH cplus_include_path
# cplus_include_path=(
#   ~/.local/include
#   $cplus_include_path
# )
# export CPLUS_INCLUDE_PATH

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
    # Others
    export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))
  fi
fi


#
# Includes
#

include_files=(
  ~/.zsh.d/zshenv/*(.N)
  ~/.zshenv.*(.N)
  ~/.zshenv_*(.N)
  ~/.zshenv-*(.N)
)

for include_file in $include_files
do
  source $include_file
done
