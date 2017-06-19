#
# .zshrc
#


# general
#

PROMPT="%S%n@%M (ret: %?, %j jobs)%s
%~ %# "

setopt PROMPT_SUBST
setopt PRINT_EIGHT_BIT
setopt TRANSIENT_RPROMPT

unsetopt BG_NICE
unsetopt HUP
setopt NOTIFY


# history
#

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000

setopt EXTENDED_HISTORY
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS


# editor/viewer
#

export EDITOR=vim
export PAGER=less
export LESS="--RAW-CONTROL-CHARS"


# line editor
#

unsetopt FLOW_CONTROL
setopt INTERACTIVE_COMMENTS

bindkey -e

bindkey '^[[5D' beginning-of-line # Ctrl-Left
bindkey '^[[5C' end-of-line # Ctrl-Right
bindkey '^[^[[D' backward-word # Alt-Left
bindkey '^[^[[C' forward-word # Alt-Right

autoload -U select-word-style
select-word-style bash
zstyle ':zle:*' word-chars " $%&@+*|/\\\"'\`~=-;:,.!?{}[]()"
zstyle ':zle:*' word-style unspecified

autoload -U history-search-end
zle -N history-beginning-search-backward-end \
       history-search-end
zle -N history-beginning-search-forward-end \
       history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end


# completion
#

autoload -U compinit
compinit
#autoload -U predict-on
#predict-on
autoload -Uz colors
colors

unsetopt LIST_BEEP
setopt LIST_PACKED
setopt LIST_TYPES

setopt EXTENDED_GLOB
setopt MAGIC_EQUAL_SUBST

setopt CORRECT

zstyle ':completion:*' rehash true

zstyle ':completion:*' verbose yes
#zstyle ':completion:*' extra-verbose true
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate

zstyle ':completion:*' menu
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' select-prompt ''


# commands
#

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

unsetopt CLOBBER

alias sudo='sudo ' # enable aliases in sudo
alias rm="rm -vi"
alias mv="mv -vi"
alias cp="cp -vi"
alias vi="vim"
alias untar="tar -xvf"
function mktar () { tar -czvf $@[-1] $@[1,-2] }
alias rsync="rsync -v --progress -a --inplace --append --partial"
alias sshfs="sshfs -C -o"


# environment-specific
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

  alias rsync="rsync -v --progress -a --inplace --append --partial --iconv=UTF8-MAC,UTF-8"
  alias sshfs="sshfs -C -o modules=iconv,from_code=UTF-8,to_code=UTF-8-Mac"
  function pbpopd() { cd `pbpaste` }
  function pbpushd() { pwd | pbcopy; cd $@ }
  alias pbcd=pbpopd

  if brew command command-not-found-init &> /dev/null
  then
    eval "$(brew command-not-found-init)"
  fi
  source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
  ;;
linux*)
  alias ll="ls -lhAF --color"
  function chpwd() { ls --color }
  alias pp="ps -A -w -o user,pid,%cpu,vsz,nice,stat,tty,command"

  alias open=xdg-open
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  function pbpopd() { cd `pbpaste` }
  function pbpushd() { pwd | pbcopy; cd $@ }
  alias pbcd=pbpopd

  source /etc/zsh_command_not_found &> /dev/null
  source /etc/bash_completion.d/git-prompt &> /dev/null
  source /usr/share/git-core/contrib/completion/git-prompt.sh &> /dev/null
  ;;
*bsd)
  alias ll="ls -lhAF -G"
  function chpwd() { ls -G }
  alias pp="ps -A -o user,pid,pcpu,vsz,nice,s,tty,args"

  if which xdg-open &> /dev/null
  then
    alias open=xdg-open
  else
    alias open=gnome-open
  fi
  ;;
solaris*)
  alias ll="ls -lhAF -G"
  function chpwd() { ls -G }
  alias pp="ps -A -o user,pid,pcpu,vsz,nice,s,tty,args"

  if which xdg-open &> /dev/null
  then
    alias open=xdg-open
  else
    alias open=gnome-open
  fi
  ;;
cygwin*)
  alias ll="ls -lhAF --color"
  function chpwd() { ls --color }
  alias pp="ps -A -w -o user,pid,%cpu,vsz,nice,stat,tty,command"

  alias open=cygstart
  alias sudo="cygstart --action=runas"
  alias ping="cocot /cygdrive/c/Windows/System32/PING.EXE"
  alias ipconfig="cocot /cygdrive/c/Windows/System32/ipconfig.exe"
  alias netstat="cocot /cygdrive/c/Windows/System32/NETSTAT.EXE"
  alias netsh="cocot /cygdrive/c/Windows/System32/netsh.exe"
  alias nslookup="cocot /cygdrive/c/Windows/System32/nslookup.exe"
  alias traceroute="cocot /cygdrive/c/Windows/System32/tracert.exe"
  alias route="cocot /cygdrive/c/Windows/System32/ROUTE.EXE"
  alias arp="cocot /cygdrive/c/Windows/System32/ARP.EXE"
  alias cscript="cocot /cygdrive/c/Windows/System32/cscript.exe"
  ;;
*)
  alias ll="ls -lhAF"
  function chpwd() { ls }
  alias pp="ps -A -o user,pid,pcpu,vsz,nice,s,tty,args"
  ;;
esac


# development
#

if __git_ps1 &> /dev/null
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

if type python3 &> /dev/null
then
  alias python=python3
  alias pip=pip3
fi


# misc
#

#export REPORTTIME=0


# includes
#

include_files=(~/.zshrc.*(N))
for include_file in $include_files
do
    source $include_file
done
