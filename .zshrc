[[ $TERM = linux ]] && export LC_MESSAGES=C

umask 022
# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

ZSHRC_SKIP_MORPHO=
ZSHRC_SKIP_AUTOSUGGESTIONS=
ZSHRC_SKIP_FAST_SYNTAX_HIGHLIGHTING=
ZSHRC_SKIP_HISTORY_SUBSTRING_SEARCH=

# vi keybindings
bindkey -v

# Zsh options (See man zshoptions)
setopt                      \
    always_to_end           \
    auto_cd                 \
    auto_pushd              \
    auto_menu               \
    auto_list               \
    auto_param_slash        \
 no_beep                    \
    cdable_vars             \
    complete_in_word        \
    correct                 \
    extended_glob           \
 no_flow_control            \
 no_glob_dots               \
    hash_list_all           \
 no_hup                     \
    interactive_comments    \
    list_packed             \
    long_list_jobs          \
 no_menu_complete           \
    multios                 \
    notify                  \
 no_null_glob               \
    numeric_glob_sort       \
    path_dirs               \
    pushd_ignore_dups       \
    rm_star_silent          \
    short_loops             \
 no_sh_file_expansion       \
 no_sh_word_split           \
 no_single_line_zle         \
    path_dirs               \
    unset

# Zsh history
HISTFILE=${XDG_CACHE_HOME}/zshistory
HISTSIZE=10000
SAVEHIST=10000

setopt                      \
  append_history            \
  extended_history          \
  hist_ignore_all_dups      \
  hist_ignore_space         \
  hist_no_store             \
  hist_reduce_blanks        \
  share_history

stty -ixon
ttyctl -f

# Zsh modules (See man zshmodules)

# Smart pasting/escaping
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

# Smart URLs
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Helping system
(( ${+aliases[run-help]} )) && unalias run-help
autoload -Uz run-help

# Zsh mime
# For file extensions, we use the defaults of zsh-mime-setup.
# See /etc/mailcap, /etc/mime.types for system configs
# and ~/.mailcap, ~/.config/mimeapps.list for user configs.
zstyle ":mime:*" current-shell true
autoload -Uz zsh-mime-setup && zsh-mime-setup

# Environment setup
NULLCMD=:
READNULLCMD=less
# Turn off mail checking
MAILCHECK=0
# Show time/memory for commands running longer than this number of seconds:
LOGCHECK=60
WATCHFMT="[%B%t%b] %B%n%b has %a %B%l%b from %B%M%b"
REPORTTIME=5
TIMEFMT='%J  %M kB %*E (user: %*U, kernel: %*S)'
# watch for everyone but me and root
watch=(notme root)

# Infopath
typeset -U infopath
infopath=(
    $HOME/{.local/,}share/info
    /usr/{local/,}share/info
    $infopath
        )

# Manpath
typeset -U manpath
manpath=(
    $ZDOTDIR/{.local/,}share/man
    /usr/{,local/,}share/man
    $manpath[@]
    )

# Prompt
autoload -Uz promptinit && promptinit
[[ ${EUID} == 0 ]] && prompt wandsas || prompt wandsas2

# Use modern completion system
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' auto-description '%F{cyan}specify: %d'
zstyle ':completion:*' format '%F{cyan}Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Describe each match group.
zstyle ':completion:*:descriptions' format ' %F{cyan}-- %d% --%f'

# Messages/Warnings format
zstyle ':completion:*:messages' format ' %F{cyan} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# Expand partial paths
zstyle ':completion:*' expand yes
zstyle ':completion:*' squeeze-slashes yes

# Docker completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker:-*:*' option-stacking yes

# When completing inside array, the array elements are more useful
# than parameters so complete them first
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Completion Caching
zstyle ':completion:*' use-cache  yes
zstyle ':completion:*:complete:*' cache-path ${XDG_CACHE_HOME}/zsh

# .. as a completion
zstyle ':completion:*' special-dirs ..

# Add a special SUDO_PATH for completion of sudo & friends:
[[ $UID -eq 0 ]] || () {
zstyle ":completion:*:sudo:*" command-path /root/bin \
                                            /home/wandsas/bin \
                                            /usr/local/{bin,sbin} \
                                            /usr/{bin,sbin} \
                                            /{bin,sbin}
}

# Load user environment settings 
if [ -d $XDG_CONFIG_HOME/zshrc.d ]; then
  for sh in $XDG_CONFIG_HOME/zshrc.d/*.zsh; do
    [ -r "$zsh" ] && . "$zsh"
  done
fi

# Load some more local user aliases, if available.
[ -r ~/.aliases.sh ] && . ~/.aliases.sh

# vim:fenc=utf-8:ft=zsh:
