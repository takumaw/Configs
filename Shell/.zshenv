#
# .zshenv
#


#
# Paths
#

typeset -U path
path=(
  ~/.local/bin(/N)
  $path
)

typeset -U manpath
manpath=(
  ~/.local/share/man(/N)
  $manpath
)


#
# Includes
#

# include_files=(
#   ~/.zsh.d/zshenv/*(-.N)
#   ~/.zshenv.*(-.N)
#   ~/.zshenv_*(-.N)
#   ~/.zshenv-*(-.N)
# )

# for include_file in $include_files
# do
#   source $include_file
# done
