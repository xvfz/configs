#==============================================================
#
# C O N F I G U R A T I O N  F O R  Z S H
#
#==============================================================

#=-=-=-=-=
# colors
#=-=-=-=-=

black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

#Color table
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}

#=-=-=-=-=-=-=
# load stuffs
#=-=-=-=-=-=-=

autoload -U colors && colors
autoload -U compinit && compinit
autoload -U vcs_info && vcs_info

zmodload zsh/complist
zmodload zsh/terminfo

# setopt
setopt \
  autocd \
  ksh_glob \
  extendedglob \
  prompt_subst \
  inc_append_history

bindkey -v
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Import seperate config files
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

for r in $HOME/.config/zsh/*.zsh; do
  if [[ $DEBUG > 0 ]]; then
    echo "zsh: sourcing $r"
  fi
  source $r
done

#eval $( dircolors -b $XDG_CONFIG_HOME/zsh/LS_COLORS/LS_COLORS )
#export LS_COLORS
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#toilet -f bigmono9 -F metal "Archy"
#TERM=xterm-256color
#ololo

