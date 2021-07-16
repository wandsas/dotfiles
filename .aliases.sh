alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias  l='ls -lha'

alias df='grc df -hPT'
alias du='grc du'
alias dus='du -sh'
alias free='grc free -h'

alias cls='tput reset'
alias res='cd && reset -Q'
alias dt='cd ~/desktop'


# Search
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pgrep='pgrep --color=auto'

# Tmux
alias  tma='tmux attach'
alias  tmd='tmux detach-client'
alias tmls='tmux list-sessions'
alias tmks='tmux kill-session -t'
tmx () {
    tmux list-sessions | awk -F':' '{print $1}' | xargs -n 1 tmux kill-session -t; 
}


# Git
alias d=diff
alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -am' 
alias gp='git push'
alias gpom='git push origin master'
alias gplm='git push local master'
alias gpl='git pull'
alias gplom='git pull origin master'
alias gpllm='git pull local master'
alias gr='git remote -v'
alias grhh='git reset HEAD --hard'
alias gst='git status -v'
alias gb='git branch'
alias gd='git diff'
alias gl='git l'
gcd () { cd `git rev-parse --show-toplevel`; }


# Network
alias ip='ip --color=auto'
alias ps='grc ps'
alias ss='grc ss'
alias dig='grc dig'
alias nmap='grc nmap'
alias netstat='grc netstat'
alias portscan='nmap -Pn'
alias portsopen='netstat -anpu'
alias wanip='curl ipinfo.io/ip'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

alias dnvim='docker run -it -v $(pwd):/home/spacevim/src nvim'
