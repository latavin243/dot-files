export ZSH="/Users/qiguo/.oh-my-zsh"

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

ZSH_THEME="frisk" # -_-

# refer to https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
plugins=(
    git
    virtualenv

    extract
    z
    sudo
    rand-quote
    command-not-found
    colored-man-pages
    sudo
    web-search
    copypath
    copyfile
    copybuffer # may conflict with vi-mode
    jsontools
    # tmux # use zellij instead
    # vi-mode
)
source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.local
source $HOME/.zsh_profile

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# ===
# === zplug
# ===

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lukechilds/zsh-nvm"
zplug "denisidoro/navi", defer:2
zplug "paulirish/git-open", as:plugin
zplug "MichaelAquilina/zsh-you-should-use"

export YSU_MESSAGE_POSITION="after"

# Install plugins if there are plugins that have not been installed
function zplugrefresh {
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi
}

# Then, source plugins and add commands to $PATH
zplug load

# ===
# === alias
# ===

alias sourcezsh="source $HOME/.zshrc"

# short alias
alias c=clear
alias s=fastfetch # or neofetch, screenfetch
alias l='ll -al'
alias e='emacs -nw'
alias emmm='emacsclient -a ""'
alias emacsfs='emacs -fs'
# alias tmux=zellij
# alias eserver='emacs --daemon &'
# alias eserver='brew services start d12frosted/emacs-plus/emacs-plus@28'
alias eclient="emacsclient -a 'emacs' &"
alias d='fanyi'
alias ts='date -r' # -d on linux
alias r='ranger'
alias weather='curl wttr.in'
alias rm='trash -F' # only useful under macOS
alias penguinsay='cowsay -f tux'
alias scala-cli="amm"
alias stree='open -a SourceTree .'

alias ls="eza --icons"
alias ll="eza --icons --long --header"
# alias la="eza --icons --long --header --all"
# alias lg="eza --icons --long --header --all --git"
alias tree="eza --tree --icons"

# brew
alias brewup='brew update; brew upgrade; brew cleanup'
alias mysqlup='brew services start mysql'
alias redisup='brew services start redis'

# editing
alias vim=nvim
alias vimclean='vim -u NONE'
alias vimzsh='vim $HOME/.zshrc; source $HOME/.zshrc'
alias vimprofile="vim $HOME/.profile; source $HOME/.profile"
alias vimjump="vim $HOME/Library/autojump/autojump.txt"
alias vimssh="vim $HOME/.ssh/config"
alias vimtmux="vim $HOME/.tmux.conf.local"
alias vimhistory="vim $HISTFILE"
alias vihistory="vi $HISTFILE"
alias vimranger='vim $HOME/.config/ranger/rc.conf'

export NVIMPATH="$HOME/.config/nvim"
# alias vimvim="vim $NVIMPATH/init.vim"
alias vimvim="cd $NVIMPATH; vim init.lua"
alias vimwez="cd $HOME/workspace/dot-files; vim $HOME/.config/wezterm/wezterm.lua"
alias vimtmp="vim /tmp/tmp.txt"
alias vimmd="vim /tmp/tmp.md"
alias vivim="vi $NVIMPATH/init.lua"
alias vimideavim="vim $HOME/.ideavimrc"
alias vimspell="vim $NVIMPATH/spell/en.utf-8.add"

alias vimtmux="vim $HOME/.tmux.conf.local"
alias vimtmuxori="vim $HOME/.tmux.conf"
alias vimgitconf="git config --global --edit"

# ===
# === git
# ===
alias gs='git show --ext-diff'
alias gsubupdate='git submodule foreach git pull --rebase origin master'
alias gupori='gup; gfa'
alias gupup='git pull --rebase upstream master; gfa'
alias gdt='git difftool'
alias gup='gpr'

# git & vim
alias gstvim="gst | vim -"

# git & fzf
alias fzfp="fzf --preview 'cat {}'"
alias gbf='gb | fzf -m'
alias gbrf='gb -r | fzf -m'
alias gcof='gco $(gb | fzf)'
alias gaf="git status -s | awk '{print $2}' | fzf -m | xargs git add"
alias gafc="git status -s | awk '{print $2}' | fzf -m | xargs git add && git commit --verbose"
alias gbdf='gbd $(gb | fzf -m)'
alias grbf='grb $(gb | fzf)'
alias gcbrf='gfa; gco --track $(gb -r | fzf)'
alias gblf='gbl $(fzf)'
alias gcm='git checkout master || git checkout main'
alias gstam='git stash push -m'
alias grso='git remote show origin'
alias glhead='gfa; glod $(gb -r | fzf) | head -1 | tee >(pbcopy)'
alias gbcp="gb --show-current | tee >(pbcopy)"
# alias gdf="git diff $(git diff $@ --name-only | fzf -m)"

gdp() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# ===
# === tmux
# ===
alias tnew="tmux new -s"
alias tlist="tmux list-session"

# ===
# === dict
# ===
function dict {
    str=''
    arr=("$@")
    for (( i=1; i<=$#arr; i++ )); do
        if [ "$i" -eq 1 ]; then
            str+="${arr[$i]}"
        else
            str+="%20${arr[$i]}"
        fi
    done
    curl "https://d.supjohn.com/$str"
}

tere() {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

# ===
# === fzf
# ===
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.vscode,node_modules,build} --type f"

# trigger sequence, e.g. ssh **<TAB>
# export FZF_COMPLETION_TRIGGER='~~' # default **

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_COMMAND="find . -maxdepth 1"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# fzf alias
alias psf='ps -ef | fzf -m'
alias vimf='nvim $(fzf -m)'
alias smclsf='smc -e test services ls | fzf'
alias hf='history | fzf -m'
alias lf='ls -al | fzf -m'
alias lsf='ls -al | fzf -m'
alias aliasf='alias | fzf -m'
alias cdf='cd $(fd -t d | fzf)'
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"


# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    # ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

# for macOS
[ $(uname -s | grep -c CYGWIN) -eq 1 ] && OS_NAME="CYGWIN" || OS_NAME=`uname -s`

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ===
# === python
# ===
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# history
export HISTCONTROL=ignoreboth # ignoreups
export HISTSIZE=10000 # Increases size of history
export SAVEHIST=10000
export HISTORY_IGNORE="(pwd|ls|ll|la|l|e|exit|clear|c|fg|glod|gsta|gstp|gd|gup|gst|glog|gcof|gbf|gp|gca|gc|ga|vim|vimvim|vimzsh|vimhistory|brewup|gpcutf)"

# ranger editor
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

# s3cmd
alias vims3cfg='vim $HOME/.s3cfg'

# called before add history
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

alias yaml2toml='yj -yt'

# spex
export SP_UNIX_SOCKET=$HOME/spex/spex.sock

# live es tunnel
# alias estunnel='ssh -NfL 9200:<ip1>:9200 <ip2>'
# alias estunnelliveish='ssh -NfL 9201:<ip1>:9201 <ip2> &'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit

# anaconda
# export PATH="/Users/qiguo/opt/anaconda3/bin:$PATH"
# conda deactivate

# bob (for nvim)
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# nvm (for node)
export PATH="$HOME/.nvm/versions/node/v20.16.0/bin:$PATH"

# go bin
export GOPATH=$HOME/go # put in .zprofile
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin

# brew
export PATH="/usr/local/sbin:$PATH"

alias cheat='sh $HOME/workspace/dot-files/scripts/cheat_sheet.sh'

# alias flinktunnel='ssh -Cxxx -D 9876 jump_server'

export PATH="$PATH:$HOME/scripts"

function vimconflict {
    # gst | grep "both modified" | awk '{print $3}' | xargs nvim
    files=$(gst | grep "both modified" | awk "{print $3}")
    nvim $files
}

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# ===
# === funcs
# ===

function sshf {
  SERVER=$(rg Host ~/.ssh/config | awk '{print $2}' | fzf)
  echo $SERVER
  ssh $SERVER
}

# fuzzy find and copy file
# # need xclip installed (for linux)
# function ffc {
#     local cli=`fd $* | fzf | xargs echo -n`;
#     case "${cli##*.}" in
#         "png")
#             echo -n ${cli} | xargs -I{} xclip -selection clipboard -t image/png -i {}
#             ;;
#         "jpeg" | "jpg")
#             echo -n ${cli} | xargs -I{} xclip -selection clipboard -t image/jpeg -i {}
#             ;;
#         "sql")
#             echo -n ${cli} | xargs -I{} xclip -selection clipboard -t text/sql -i {}
#             ;;
#         "py" | "go" | "yaml" | "yml" | "txt" )
#             echo -n ${cli} | xargs -I{} xclip -selection clipboard -i {}
#             ;;
#         "json")
#             echo -n ${cli} | xargs -I{} xclip -selection clipboard -i {}
#             ;;
#         *)
#             echo "unsupported type"
#     esac
# }

function pclip {
    if [ $OS_NAME == CYGWIN ]; then
        putclip $@;
    elif [ $OS_NAME == Darwin ]; then
        pbcopy $@;
    else
        if [ -x /usr/bin/xsel ]; then
            xsel -ib $@;
        else
            if [ -x /usr/bin/xclip ]; then
                xclip -selection c $@;
            else
                echo "Neither xsel or xclip is installed!"
            fi
        fi
    fi
}

function ffc {
    local cli=`fd $* | fzf | xargs echo -n`;
    case "${cli##*.}" in
        "png")
            echo -n ${cli} | pclip
            ;;
        "jpeg" | "jpg")
            echo -n ${cli} | pclip
            ;;
        "sql")
            echo -n ${cli} | xargs -I{} xclip -selection clipboard -t text/sql -i {}
            ;;
        "py" | "go" | "yaml" | "yml" | "txt" )
            echo -n ${cli} | xargs -I{} xclip -selection clipboard -i {}
            ;;
        "json")
            echo -n ${cli} | xargs -I{} xclip -selection clipboard -i {}
            ;;
        *)
            echo "unsupported type"
    esac
}

function countcode {
    find . -name "*.$1" | xargs grep -v "^$" | wc -l
}

# ===
# === smc
# ===
function smcenter {
    # NAME=$(smc -e $1 services ls | awk '{print $2}' | grep mydata | fzf)
    NAME=$(smc -e $1 services ls | awk '{print $2}' | fzf)
    echo ${NAME}
    smc -e $1 services enter ${NAME}
}

function smclogfetch {
    NAME=$(smc -e $1 services ls | awk '{print $2}' | grep mydata | fzf)
    echo ${NAME}
    smc -e $1 services logs ${NAME}
}

function smcpanic {
    NAME=$(smc -e $1 services ls | awk '{print $2}' | grep mydata | fzf)
    echo ${NAME}
    smc -e $1 service run ${NAME} 'grep -C 10 "panic recovered" log/daemon.log' | less
    # smc -e $1 service run ${NAME} 'grep -C 10 "panic recovered" log/daemon.log' | less
}

# ===
# === s3
# ===
function s3test(){ s3cmd -c ~/.s3cfg_test -H "$@" }
function s3live(){ s3cmd -c ~/.s3cfg_live -H "$@" }
function s3usstest(){ s3cmd -c ~/.s3cfg_uss_test -H "$@" }
function s3usslive(){ s3cmd -c ~/.s3cfg_uss_live -H "$@" }

# ===
# === docker
# ===
function dockerfindkill {
    containter_id=$(docker ps | fzf | awk '{print $1}')
    echo ${containter_id}
    docker kill ${containter_id}
}

# === develop
function build-scp {
    export GOOS='linux'
    server=$2

    case "$1" in
        "mydata" | "localsc")
            go build -o mydata.bo interface/mydata/cmd/main.go
            scp ./mydata.bo ${server}:/home/toc/SDE/qi.guo/workspace/seller-mydata-be
            export GOOS='darwin'
            ;;
        "cbsc")
            go build -o cbsc.bo interface/cbsc/cmd/main.go
            scp ./cbsc.bo ${server}:/home/toc/SDE/qi.guo/workspace/seller-cbsc-be
            export GOOS='darwin'
            ;;
        *)
            echo "invalid 1st arg, should be 'mydata' or 'cbsc', arg=$1"
            ;;
    esac
}

function govet-mydata-all {
    cgo=$CGO_ENABLED

    export CGO_ENABLED=0
    go vet -printfuncs="Infof,Errorf,Warningf" interface/mydata/cmd/main.go
    if [ $? -ne 0 ]; then
        echo "mydatabo failed"
        return
    fi

    export CGO_ENABLED=$cgo
    echo "success"
}

function gpcut {
    count=$1
    git push origin HEAD~${count}:$(git_current_branch)
}

function gpcutf {
    count=$1
    git push -f origin HEAD~${count}:$(git_current_branch)
}

function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

function mvnpkg {
    cmd="mvn clean install"
    for module in $(ls -d */ | grep -vE "docs|target" | sort | fzf -m); do cmd="$cmd -pl $module"; done
    cmd="$cmd $(echo "-am\n# no am\n" | fzf)"
    echo "$cmd"
    eval "$cmd"
}

function gbprune {
    # git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
    gfa | git branch --merged | egrep -v "(^\*|master|main|release|uat)" | xargs git branch -d
}

function ask_yes_or_no() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

export SP_UNIX_SOCKET="/tmp/spex.sock"

# ===
# === language
# ===

# === ruby
# If you need to have ruby first in your PATH, run:
PATH="$PATH:/opt/homebrew/opt/ruby/bin"

# For compilers to find ruby you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# For pkg-config to find ruby you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# === perl
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# bash funcs
function split() {
   # Usage: split "string" "delimiter"
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}

# spark
export SPARK_HOME=/Users/qiguo/try-spark/spark-3.5.1-bin-hadoop3
export PATH=$PATH:$SPARK_HOME/bin


# mvnf
mvnf() {
  local add_am=""
  local selected_dirs=""

  # echo " -am ? (y/n)"
  # read -r add_am_input
  # if [[ $add_am_input == "y" || $add_am_input == "Y" ]]; then
  #   add_am="-am"
  # fi
  if [[ "$*" == *"-am"* ]]; then
    add_am="-am"
  fi

  selected_dirs=$(find . -maxdepth 1 -type d | fzf --multi --preview "ls -l {}")

  local pl_args=""
  for dir in $selected_dirs; do
    pl_args+=" -pl $dir"
  done

  echo "mvn clean package ${pl_args} ${add_am}"
  eval "mvn clean package ${pl_args} ${add_am}"
}
export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
