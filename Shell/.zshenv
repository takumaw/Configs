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
