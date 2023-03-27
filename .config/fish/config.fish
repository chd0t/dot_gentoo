

set fish_greeting ""

set -gx TERM xterm-256color
set -g fish_autosuggestion_enabled 1


# theme
scheme set dracula
set -g theme_color_scheme dracula
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# colored man pages
set -gx LESS_TERMCAP_mb \e'[1;32m'
set -gx LESS_TERMCAP_md \e'[1;32m'
set -gx LESS_TERMCAP_me \e'[0m'
set -gx LESS_TERMCAP_se \e'[0m'
set -gx LESS_TERMCAP_so \e'[01;33m'
set -gx LESS_TERMCAP_ue \e'[0m'
set -gx LESS_TERMCAP_us \e'[1;4;31m'

# fish
#navi widget fish | source
export MOZ_ENABLE_WAYLAND=1

# aliases
#https://news.ycombinator.com/item?id=32632533
#https://www.atlassian.com/git/tutorials/dotfiles


#alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias ctm "commit -a -u -m" 
alias neo "neovide --multigrid"
alias l lvim
alias v nvim
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR neovide

#LunarVim
set -gx PATH ~/.local/bin $PATH

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH


function rbg
    $argv &>/dev/null &
end

#set -gx PATH /usr/bin/env
# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias lsla "exa -a --icons"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# The base environment is activated by default
conda config --set auto_activate_base True

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/dot/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

