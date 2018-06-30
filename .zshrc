# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_hist
HISTSIZE=1000
SAVEHIST=100000
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aysh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#PROMPT
# change color -> "%{$fg[<colorname>]%}XXXX{$reset_color%}
# values: [[[
#     %n : user name
#     %m : machine name
#     %# : user種別(# or %)
#     %y : login terminal name (pts/0)
#     %l : login terminal name (pts/0 but tty* then * ("tty" is cutted))
#     %? : return of previous command ( normally ended then 0 )
#     %h : history num
#     %d : currnt dir (full path)
#     %/ : same as above
#     %~ : same as above but home dir replace to ~ (related path)
#     %C : current dir name
#     %c : same as above but home dir replace to ~
#     %D : date (yy-mm-dd)
#     %W : date (mm/dd/yy)
#     %w : date (day dd)
#     %* : time (hh:mm:ss)
#     %T : time (hh:mm)
#     %t : time (hh:mm(am/pm)) ]]]
# load colors
autoload -Uz colors
colors
# setting
PROMPT="
%{$fg[blue]%}{%?}%{$reset_color%}%{$fg[red]%}%n@%m%{$reset_color%}%{$fg[blue]%}[%~]%{$reset_color%}"
RPROMPT="%{$fg[green]%}%D %*%{$reset_color%}"
# git 対応
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%uが使用可能
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中、merge コンフリクト等formats 外の表示
precmd () { vcs_info }
PROMPT=$PROMPT"${vcs_info_msg_0_}"
# 最終改行
PROMPT=$PROMPT"
%{${fg[red]}%}%# %{${reset_color}%}"

#alias
alias h='history '
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias ggl='w3m http://www.google.co.jp/'

