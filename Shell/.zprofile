#
# .zshenv
#


#
# Development Tools
#

if (type python3 || type python2 || type python) &> /dev/null
then
  export PYTHONIOENCODING=UTF-8
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

# include_files=(
#   ~/.zsh.d/zprofile/*(-.N)
#   ~/.zprofile.*(-.N)
#   ~/.zprofile_*(-.N)
#   ~/.zprofile-*(-.N)
# )

# for include_file in $include_files
# do
#   source $include_file
# done
