
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ll='ls -lh'
alias la='ls -A'
alias  l='ls -lha'
alias df='df -hPT'
alias dus='du -sh'
alias free='free -h'
alias cls=clear
alias res='cd && reset'

alias   gaa='git add --all'
alias    gc='git commit --all'
alias   gcm='git commit --all --message'
alias   gll='git log --date=relative --decorate --graph --stat'
alias    gl="git log --abbrev-commit --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias   gpl='git pull'
alias gplom='git pull origin master'
alias  gplu='git pull upstream'
alias gplgm='git pull github master'
alias gplrm='git pull rpi master'
alias    gp='git push'
alias   gpa='git push --all'
alias  gpom='git push origin master'
alias  gpum='git push upstream master'
alias  gpgm='git push github master'
alias  gprm='git push rpi master'
alias  gpam='git push all master'
alias    gr='git remote -v'
alias grehh='git reset HEAD --hard'
alias   gst='git status'

# change to root dir of current repo
gcd () { cd `git rev-parse --show-toplevel`; }

# filter query on ghq repos and cd to selected
cdr () { cd `ghq list -p | peco`; }

alias einfo='emerge info'
alias eqf='equery f'
alias equ='equery u'
alias eqh='equery h'
alias eqa='equery a'
alias eqb='equery b'
alias eql='equery l'
alias eqd='equery d'
alias eqg='equery g'
alias eqc='equery c'
alias eqk='equery k'
alias eqm='equery m'

alias qa=qatom
alias qc=qcache
alias qd=qdepends
alias qk=qcheck
alias qf=qfile
alias qg=qgrep
alias ql=qlist
alias qo=qlop
alias qp=qpkg
alias qm=qmerge
alias qs=qsearch
alias qz=qsize
alias qt=qtbz2
alias qu=quse
alias qx=qxpak

ssh () {
case "$TERM" in
    rxvt-256color|rxvt-unicode*)
        TERM=rxvt LANG=C LC_MESSAGES=C command ssh "$@"
        ;;
    screen-256color|tmux-256color)
        TERM=screen LANG=C LC_MESSAGES=C command ssh "$@"
        ;;
    xterm-256color|xterm*|alacritty)
        TERM=xterm LANG=C LC_MESSAGES=C command ssh "$@"
        ;;
    *)
        LANG=C LC_MESSAGES=C command ssh "$@"
        ;;
esac
}

alias  tma='tmux attach'
alias  tmd='tmux detach-client'
alias tmls='tmux list-sessions'
alias tmks='tmux kill-session -t'
tmKs () { tmux list-sessions | awk -F':' '{print $1}' | xargs -n 1 tmux kill-session -t; }

# export DISPLAY=:0.0
sd () {
    source ~/.Xdisplay.${HOST%%.*}
}

# vim:fenc=utf-8:ft=sh:
