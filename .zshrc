[[ $TERM = linux ]] && export LC_MESSAGES="C"

umask 022

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

bindkey -v

# Zsh options (See man zshoptions)

setopt                      \
    always_to_end           \
    append_create           \
    auto_cd                 \
    auto_continue           \
    auto_pushd              \
    auto_menu               \
    auto_list               \
    auto_param_slash        \
 no_bang_hist               \
 no_bare_glob_qual          \
 no_beep                    \
    cbases                  \
    cdable_vars             \
    combining_chars         \
    complete_in_word        \
    correct                 \
    extended_glob           \
 no_flow_control            \
 no_glob_dots               \
 no_global_rcs              \
    hash_list_all           \
 no_hup                     \
    ignore_close_braces     \
    interactive_comments    \
    ksh_zero_subscript      \
    list_packed             \
    local_loops             \
    long_list_jobs          \
    magic_equal_subst       \
 no_menu_complete           \
 no_multi_funcdef           \
    multios                 \
    notify                  \
 no_null_glob               \
    numeric_glob_sort       \
    octalzeroes             \
    path_dirs               \
    posix_identifiers       \
    posix_strings           \
    pushd_ignore_dups       \
    rm_star_silent          \
    rc_expand_param         \
    sh_null_cmd             \
    short_loops             \
 no_sh_file_expansion       \
 no_sh_word_split           \
 no_single_line_zle         \
    warn_create_global      \
    unset

HISTFILE=${XDG_CACHE_HOME}/history/zsh
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
#zstyle ":mime:*" current-shell true
#zsh-mime-setup

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
    $ZDOTDIR/{.local/,}share/man/(N)
    /usr/{,local/,}share/man(N)
    $manpath[@]
    )


# Prompt

autoload -Uz promptinit && promptinit
[[ `id -u` == 0 ]] && prompt wandsas || prompt wandsas2


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
zstyle ':completion:*:descriptions'     format ' %F{cyan}-- %d% --%f'

# Messages/Warnings format
zstyle ':completion:*:messages'         format ' %F{cyan} -- %d --%f'
zstyle ':completion:*:warnings'         format ' %F{red}-- no matches found --%f'

# Expand partial paths
zstyle ':completion:*'                  expand yes
zstyle ':completion:*'                  squeeze-slashes yes

# Docker completion
zstyle ':completion:*:*:docker:*'       option-stacking yes
zstyle ':completion:*:*:docker:-*:*'    option-stacking yes

# When completing inside array, the array elements are more useful
# than parameters so complete them first
zstyle ':completion:*:*:-subscript-:*'  tag-order indexes parameters

# Completion Caching
zstyle ':completion:*'                  use-cache  yes
zstyle ':completion:*:complete:*'       cache-path ${ZDOTDIR:-$HOME}/.cache

# .. as a completion
zstyle ':completion:*' special-dirs ..

# Add a special SUDO_PATH for completion of sudo & friends:
[[ $UID -eq 0 ]] || () {
zstyle ":completion:*:(sudo|sudox):*"   command-path \
                                        /root/bin \
                                        /home/wandsas/bin \
                                        /usr/local/{bin,sbin} \
                                        /usr/{bin,sbin} \
                                        /{bin,sbin}
}

for sh in ${XDG_CONFIG_HOME}/zsh/rc.d/*.zsh ${XDG_CONFIG_HOME}/.aliases.sh; do
    [[ -r "$sh" ]] && source $sh
done

# vim:fenc=utf-8:ft=zsh:
