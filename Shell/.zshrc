#
# .zshrc
#


#
# Prompting
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#Prompting
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
#

PROMPT="%S%n@%M (ret: %?, %j jobs)%s
%~ %# "
#export REPORTTIME=0

setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT


#
# History
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#History
#

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY


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


#
# Completion, Expansion and Globbing
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#Completion-2
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html
#

setopt AUTO_REMOVE_SLASH
setopt GLOB_COMPLETE
unsetopt LIST_BEEP
setopt LIST_PACKED

setopt EXTENDED_GLOB
setopt MAGIC_EQUAL_SUBST

autoload -U compinit
compinit
#autoload -U predict-on
#predict-on

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#zstyle ':completion:*' extra-verbose true
#zstyle ':completion:*' file-list true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' menu
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt ''

autoload -U history-search-end
zle -N history-beginning-search-backward-end \
    history-search-end
zle -N history-beginning-search-forward-end \
    history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end


#
# Commands and Aliases
#
# http://zsh.sourceforge.net/Doc/Release/Options.html#Changing-Directories
#

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

alias sudo='sudo ' # make aliases work with sudo
alias rm="rm -vi"
alias mv="mv -vi"
alias cp="cp -vi"
alias untar="tar -vxf"
function mktar () { tar -vczf $@[-1] $@[1,-2] }
alias rsync="rsync -v --progress -a --inplace --append --partial"


#
# Viewer & Editor
#

if type vim &> /dev/null
then
  alias vi="vim"
else
  alias vim="vi"
fi

export EDITOR=vim
export PAGER=less
export LESS="--RAW-CONTROL-CHARS"
export LV="-c"


#
# Developer Tools
#

if type git &> /dev/null
then
  source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh &> /dev/null # macOS
  source /etc/bash_completion.d/git-prompt &> /dev/null # Ubuntu
  source /usr/share/git-core/contrib/completion/git-prompt.sh &> /dev/null # CentOS

  if type __git_ps1 &> /dev/null
  then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_DESCRIBE_STYLE="default"
    GIT_PS1_SHOWCOLORHINTS=1

    precmd () {
      RPROMPT='%S$(__git_ps1 "[%s]")%s'
    }
  fi
fi

if type python3 &> /dev/null
then
  alias python=python3
  alias pydoc=pydoc3
  alias pip=pip3
  alias idle=idle3
  alias ipython=ipython3
fi


#
# Environment-specific
#

case $TERM in
screen*)
  function preexec() { echo -ne "\ek${1%% *}\e\\" }
  function precmd() { echo -ne "\ek${SHELL:t}\e\\" }
  ;;
esac

case $OSTYPE in
darwin*)
  alias ll="ls -lhAF -G"
  function chpwd() { ls -G }
  alias pp="ps -A -w -o user,pid,%cpu,vsz,nice,stat,tty,command"

  function pbpopd() { cd "`pbpaste`" }
  function pbpushd() { pwd | pbcopy; cd $@ }
  alias pbcd=pbpopd

  if brew command command-not-found-init &> /dev/null
  then
    eval "$(brew command-not-found-init)"
  fi
  ;;
linux*)
  alias ll="ls -lhAF --color"
  function chpwd() { ls --color }
  alias pp="ps -A -w -o user,pid,%cpu,vsz,nice,stat,tty,command"

  if type xdg-open &> /dev/null
  then
    alias open=xdg-open
  elif type gnome-open &> /dev/null
  then
    alias open=gnome-open
  fi

  if type xsel &> /dev/null
  then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    function pbpopd() { cd `pbpaste` }
    function pbpushd() { pwd | pbcopy; cd $@ }
    alias pbcd=pbpopd
  fi

  if [ -f /etc/zsh_command_not_found ]
  then
    source /etc/zsh_command_not_found &> /dev/null
  fi
  ;;
*bsd)
  alias ll="ls -lhAF -G"
  function chpwd() { ls -G }
  alias pp="ps -A -o user,pid,pcpu,vsz,nice,s,tty,args"

  if type xdg-open &> /dev/null
  then
    alias open=xdg-open
  elif type gnome-open &> /dev/null
  then
    alias open=gnome-open
  fi
  ;;
solaris*)
  alias ll="ls -lhAF -G"
  function chpwd() { ls -G }
  alias pp="ps -A -o user,pid,pcpu,vsz,nice,s,tty,args"

  if type xdg-open &> /dev/null
  then
    alias open=xdg-open
  elif type gnome-open &> /dev/null
  then
    alias open=gnome-open
  fi
  ;;
cygwin*)
  alias ll="ls -lhAF --color"
  function chpwd() { ls --color }
  alias pp="ps -A -w -o user,pid,%cpu,vsz,nice,stat,tty,command"

  alias open=cygstart
  alias sudo="cygstart --action=runas"

  if type cocot &> /dev/null
  then
    alias ping="cocot /cygdrive/c/Windows/System32/PING.EXE"
    alias ipconfig="cocot /cygdrive/c/Windows/System32/ipconfig.exe"
    alias netstat="cocot /cygdrive/c/Windows/System32/NETSTAT.EXE"
    alias netsh="cocot /cygdrive/c/Windows/System32/netsh.exe"
    alias nslookup="cocot /cygdrive/c/Windows/System32/nslookup.exe"
    alias traceroute="cocot /cygdrive/c/Windows/System32/tracert.exe"
    alias route="cocot /cygdrive/c/Windows/System32/ROUTE.EXE"
    alias arp="cocot /cygdrive/c/Windows/System32/ARP.EXE"
    alias cscript="cocot /cygdrive/c/Windows/System32/cscript.exe"
  fi
  ;;
*)
  alias ll="ls -lhAF"
  function chpwd() { ls }
  alias pp="ps -A -o user,pid,pcpu,vsz,nice,s,tty,args"
  ;;
esac


#
# Includes
#

include_files=(
  ~/.zsh.d/zshrc/*(.N)
  ~/.zshrc.*(.N)
)

for include_file in $include_files
do
    source $include_file
done
