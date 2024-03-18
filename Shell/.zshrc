#
# .zshrc
#


#
# Prompting
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#Prompting
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
#

setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT

PROMPT="%S%n@%M (ret: %?, %j jobs)%s
%~ %# "
#export REPORTTIME=0


#
# History
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#History
#

setopt EXTENDED_HISTORY
unsetopt HIST_BEEP
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000


#
# Job Control
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#Job-Control
#

unsetopt BG_NICE
unsetopt HUP
setopt LONG_LIST_JOBS


#
# Printing and Editing
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#Input_002fOutput
# http://zsh.sourceforge.net/Doc/Release/Options.html#Expansion-and-Globbing
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
#

unsetopt CLOBBER
setopt CORRECT
unsetopt FLOW_CONTROL
setopt INTERACTIVE_COMMENTS
setopt PRINT_EIGHT_BIT

unsetopt BEEP

setopt APPEND_CREATE

bindkey -e
bindkey '^[[5D' beginning-of-line # Ctrl-Left
bindkey '^[[1;5D' beginning-of-line # Ctrl-Left with "Natural Text Editing" in iTerm2
bindkey '^[[5C' end-of-line # Ctrl-Right
bindkey '^[[1;5C' end-of-line # Ctrl-Right with "Natural Text Editing" in iTerm2
bindkey '^[^[[D' backward-word # Alt-Left
bindkey '^[^[[C' forward-word # Alt-Right

WORDCHARS=" $%&@+*|/\\\"'\`~=-;:,.!?{}[]()"
autoload -U select-word-style
select-word-style normal
zstyle ':zle:*' word-style unspecified

export CLICOLOR=1
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export ZLS_COLORS=$LS_COLORS


#
# Completion, Expansion and Globbing
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#Completion-2
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html
#

typeset -U fpath
fpath=(
  ~/.local/share/zsh/site-functions(/N)
  ~/.local/share/zsh/vendor-completions(/N)
  ~/.local/share/zsh/zsh-completions(/N)
  /opt/homebrew/share/zsh/site-functions(/N)
  /usr/local/share/zsh/site-functions(/N)
  /usr/local/share/zsh/vendor-completions(/N)
  /usr/local/share/zsh-completions(/N)
  /usr/share/zsh/site-functions(/N)
  /usr/share/zsh/vendor-completions(/N)
  /usr/share/zsh/zsh-completions(/N)
  $fpath
)

setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt GLOB_COMPLETE
unsetopt LIST_BEEP
setopt LIST_PACKED
setopt MARK_DIRS
setopt MENU_COMPLETE

setopt EXTENDED_GLOB
setopt MAGIC_EQUAL_SUBST

autoload -Uz compinit
compinit -u
#autoload -U predict-on
#predict-on

zstyle ':completion:*' completer _expand _complete _match _prefix _ignored _correct _approximate _list _history
zstyle ':completion:*' description true
zstyle ':completion:*' extra-verbose true
zstyle ':completion:*' file-list true
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu yes select
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' separate-sections true
#zstyle ':completion:*' show-ambiguity true # buggy with file-list true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute false
zstyle ':completion:*' use-cache true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

autoload -U history-search-end
zle -N history-beginning-search-backward-end \
    history-search-end
zle -N history-beginning-search-forward-end \
    history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end


#
# Working Directory
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#Changing-Directories
#

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

function chpwd() { ls --color=always }


#
# Basic Commands Support
#

alias sudo='sudo -E ' # make aliases work with sudo
alias ps="ps -w"
alias pp="ps -A -ww -o user,pid,stat,lstart,%cpu,%mem,vsz,rss,nice,class,tty,command"

alias lsof-long="lsof +c 0"
alias lsof-ports="lsof-long -i -n -P"

alias ls="ls --color=always"
alias ll="ls -lhAF"
alias cp="cp -vi"
alias mv="mv -vi"
alias rm="rm -vi"
alias ln="ln -vi"
alias mkdir="mkdir -v"
alias rmdir="rmdir -v"
alias chown="chown -v"
alias chgrp="chgrp -v"
alias chmod="chmod -v"
alias chcon="chcon -v"
alias chattr="chattr -V"

alias untar="tar -vxf"
function mktar () { tar -vczf $@[-1] $@[1,-2] }
function mkzip () { zip -v $@[-1] $@[1,-2] }
function unzipjp () { unzip -O ms932 $@ }

alias rsync="rsync -vzaP --inplace --append --sparse"
alias curl-download="curl -OJRL --compressed"
function wget () {
  if type -p wget &> /dev/null
  then
    command wget $@
  else
    echo "!!WARNING!! cURL is used instead."
    echo
    curl-download $@
  fi
}

#
# Viewers & Editors Support
#

export EDITOR=vim
export PAGER=less
export LESS="--RAW-CONTROL-CHARS"

alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias fgrep="fgrep --color=always"
alias diff="diff --color=always"

if type -p vim &> /dev/null
then
  alias vi="vim"
else
  alias vim="vi"
fi

#
# Containers Support
#

if type -p docker &> /dev/null
then
  alias docker-compose="docker compose"
  function docker-run-here () { docker run -v $(pwd):$(pwd) -w $(pwd) $@ }
fi

if type -p podman &> /dev/null
then
  function podman-run-here () { podman run -v $(pwd):$(pwd) -w $(pwd) $@ }
fi


#
# Development Tools Support
#

if type -p python3 &> /dev/null
then
  export PATH="$HOME/.local/bin:$PATH"
  export MANPATH="$HOME/.local/share/man:$MANPATH"
  alias python=python3
  alias pydoc=pydoc3
  alias pip=pip3
  alias wheel=wheel3
  alias idle=idle3
  if type -p ipython3 &> /dev/null
  then
    alias ipython=ipython3
  fi
  if (type -p pyenv || type $HOME/.pyenv/bin/pyenv) &> /dev/null
  then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
    #eval "$(pyenv init -)"
    export PYENV_SHELL=zsh
    [ -f $PYENV_ROOT/completions/pyenv.$PYENV_SHELL ] && source $PYENV_ROOT/completions/pyenv.$PYENV_SHELL
    pyenv() {
      local command
      command="${1:-}"
      if [ "$#" -gt 0 ]; then
        shift
      fi
    
      case "$command" in
      activate|deactivate|rehash|shell)
        eval "$(pyenv "sh-$command" "$@")"
        ;;
      *)
        command pyenv "$command" "$@"
        ;;
      esac
    }
  fi
fi

if type -p javac &> /dev/null
then
  if [ -x /usr/libexec/java_home ]
  then
    # macOS
    export JAVA_HOME=$(/usr/libexec/java_home)
  else
    # Linux
    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))
  fi
fi

if type -p rustc &> /dev/null || [ -d $HOME/.cargo/bin ]
then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if type -p go &> /dev/null || [ -d $HOME/go/bin ]
then
  export PATH="$HOME/go/bin:$PATH"
fi

if type -p cabal &> /dev/null || [ -d $HOME/.cabal/bin ]
then
  export PATH="$HOME/.cabal/bin:$PATH"
fi

if type -p opam &> /dev/null || [ -d $HOME/.opam/default/bin ]
then
  export PATH="$HOME/.opam/default/bin:$PATH"
  alias opam-env-activate="eval $(opam env)"
fi

#
# Terminal-specific
#

case $TERM in
screen*)
  function preexec() { echo -ne "\ek${1%% *}\e\\" }
  function precmd() { echo -ne "\ek${SHELL:t}\e\\" }
  ;;
*)
  ;;
esac


#
# Environment-specific
#

case $OSTYPE in
linux*)
  alias lll="ll --time-style '+%Y-%m-%d %H:%M:%S'"
  if type -p xdg-open &> /dev/null
  then
    alias open=xdg-open
  elif type -p gnome-open &> /dev/null
  then
    alias open=gnome-open
  fi
  if type -p wslview &> /dev/null
  then
    alias open=wslview
  fi

  if type -p xsel &> /dev/null
  then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    function pbpopd() { cd `pbpaste` }
    function pbpushd() { pwd | pbcopy; cd $@ }
    alias pbcd=pbpopd
  fi
  if type -p wsl.exe &> /dev/null
  then
    function pbcopy() { cat | clip.exe }
    alias pbpaste='powershell.exe -c Get-Clipboard'
    function pbpopd() { cd `pbpaste` }
    function pbpushd() { pwd | clip.exe; cd $@ }
    alias pbcd=pbpopd
  fi

  #if [ -d "~/.linuxbrew" ]
  #then
  #  eval "$(~/.linuxbrew/bin/brew shellenv)"
  #elif [ -d "/home/linuxbrew" ]
  #then
  #  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  #fi
  #if [ -f /etc/zsh_command_not_found ]
  #then
  #  source /etc/zsh_command_not_found &> /dev/null
  #fi
  ;;
darwin*)
  alias lll="ll -D '%Y-%m-%d %H:%M:%S'"
  function pbpopd() { cd "`pbpaste`" }
  function pbpushd() { pwd | pbcopy; cd $@ }
  alias pbcd=pbpopd

  #if [ -d "/opt/homebrew" ]
  #then
  #  eval "$(/opt/homebrew/bin/brew shellenv)"
  #fi
  #if [ -f /opt/homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh ]
  #then
  #  HB_CNF_HANDLER="/opt/homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
  #  if [ -f "$HB_CNF_HANDLER" ]; then
  #    source "$HB_CNF_HANDLER";
  #  fi
  #fi
  ;;
*)
  ;;
esac

#if type -p wsl.exe &> /dev/null
#then
#  export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')   
#  export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
#fi


#
# Includes
#

# include_files=(
#   ~/.zsh.d/zshrc/*(-.N)
#   ~/.zshrc.*(-.N)
#   ~/.zshrc_*(-.N)
#   ~/.zshrc-*(-.N)
# )

# for include_file in $include_files
# do
#     source $include_file
# done
