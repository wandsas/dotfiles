[[ $TERM = linux ]] && export LC_MESSAGES="C"

umask 022

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

HISTFILE=${XDG_CACHE_HOME}/history/zsh
HISTSIZE=1000
PROMPT='%B%2F%n@%m%f:%4F%~%f%b$ '
SAVEHIST=1000

if test -n "$TERM"; then
  bindkey -e
  bindkey "${terminfo[khome]}" beginning-of-line
  bindkey "${terminfo[kdch1]}" delete-char
  bindkey "${terminfo[kend]}" end-of-line
  #bindkey "${terminfo[kich1]}" quoted-insert
fi

setopt \
    appendcreate \
    autocd \
    autocontinue \
    autopushd \
    automenu \
    autolist \
    autoparamslash \
 no_banghist \
 no_bareglobqual \
 no_beep
    cbases \
    cdable_vars \
    competeinword \
    correct \
    combiningchars \
    extendedglob \
 no_flowcontrol \
 no_globalrcs \
 no_globdots \
    hashlistall \
 no_hup \
    ignoreclosebraces \
    interactivecomments \
    kshzerosubscript \
    listpacked \
    localloops \
    longlistjobs \
    magicequalsubst \
 no_menucomplete \
    multios \
 no_multifuncdef \
    notify \
 no_nullglob \
    numericglobsort \
    octalzeroes \
    pathdirs \
    pushdignoredups \
    posixidentifiers \
    posixstrings \
    pushdignoredups \
    rmstarsilent \
    rcexpandparam \
    shortloops \
 no_shfileexpansion \
 no_shwordsplit \
 no_singlelinezle \
    shnullcmd \
 no_unset \
    warncreateglobal
stty -ixon
ttyctl -f

setopt \
    append_history \
    extendedhistory \
    histexpiredupsfirst \
    histfcntllock \
    histignorealldups \
    histignorespace \
    histnostore \
    histreduceblanks \
    sharehistory

ttyctl -

. "$XDG_CONFIG_HOME"/aliases
