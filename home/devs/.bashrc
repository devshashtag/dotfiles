# If not running interactively, don't do anything
# [[ $- != *i* ]] && exit

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# colors
function getColor() { echo "$(tput setaf $1)"; }

# 30 range -> dark colors
# 90 range -> light colors
black="$(getColor 8)"
red="$(getColor 9)"
green="$(getColor 10)"
yellow="$(getColor 11)"
blue="$(getColor 12)"
magenta="$(getColor 13)"
cyan="$(getColor 14)"
white="$(getColor 15)"

# random colors
randColors=(\
6 7 9 10 11 12 13 14 15 27 28 29 30 31 32 33 34 35 36 37 38
39 40 41 42 43 44 45 46 47 48 49 50 51 65 66 67 68 69 70 71
72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 93 94 95 96
97 98 99 101 102 103 104 105 106 107 108 109 110 111 112 113
114 115 116 117 118 119 120 121 122 123 125 126 127 128 129
130 131 132 133 134 135 136 137 138 139 140 141 142 143 144
145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
160 161 162 163 164 165 166 167 168 169 170 171 172 173 174
175 176 177 178 179 180 181 182 183 184 185 186 187 188 189
190 191 192 193 194 195 196 197 198 199 200 201 202 203 204
205 206 207 208 209 210 211 212 213 214 215 216 217 218 219
220 221 222 223 224 225 226 227 228 229 230 231)

randLen="${#randColors[@]}"
# reset colors for output
PS0='\[$(tput init)\]'

# prompt
PS1='$(
randColor="\[$(getColor "${randColors[$((RANDOM % $randLen))]}")\]"

# variables
dirColor="\[$(getColor 157)\]"
gitColor="\[$yellow\]"
sepColor="\[$red\]"
inputColor="$randColor"

# path separator
sep="$sepColor ⇢ $dirColor"

# git branch
gitBranch="$(git branch --show-current 2>/dev/null)"

[[ ! -z "$gitBranch" ]] && {
    gitSec=" $randColor⚞$gitColor $gitBranch $randColor⚟"
}

# prompt
prompt="$gitSec$randColor ⚛ $inputColor"

# get current path
dir="$(sed "s|$HOME|~/|g" <<< "$(dirs)")"
SPWD="${dir#"${dir%/*/*/*}/"}"

# style current path
pathStyled="$dirColor $(
    sed "s|\(.\)/|\1$sep|g" <<< "$SPWD"| # normal path
    sed "s|^/\([^$]\)|/$sep\1|g"         # root path
)"

# display prompt message
printf "%s%s" "$pathStyled" "$prompt")'

# executable scripts
if [ -e ~/.local/bin ]; then
    export PATH="$PATH:$HOME/.local/bin/"
fi

#--------------------------------#
#         MAN PAGE COLOR         #
#--------------------------------#
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[31m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTIGNORE="clear :history :top :ps "

alias gcc='gcc -Wall -Wextra -Wpedantic -Wunused'

# default editor
export EDITOR="nvim"

# tools auto color
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# fix git problem with gpgp
# export GPG_TTY="$(tty)"

# clean swap
alias boost='sudo swapoff -a; sleep 5; sudo swapon -a'

#--------------------------------#
#              git               #
#--------------------------------#
# show diff for staged files
alias gds="git diff --staged"
# commit staged files
alias gcm="git commit -m"
# display status
alias gs="git status"
# display logs
alias gl="git log"
# staged a file
alias ga="git add"
# amend a commit
alias gam="git commit --amend"
# staged all changed files
alias gaa="git add ."
# show current and all branches
alias gb="git branch -a"
# remove a branch
alias gbd="git branch -d"
# change working branch
alias gc="git checkout"
# create and checkout a branch
alias gcn="git checkout -b"
# merge a branch
alias gm="git merge"
# fix last commit msg
alias gf="git log --follow --"
# unstage staged files
alias gu="git reset HEAD --"
# reset a file to last commit
alias grh="git reset --hard"
# get changes from git
alias gpull="git pull origin"
# send commits to git
alias gpush="git push origin"

