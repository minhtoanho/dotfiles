#!/usr/bin/env zsh

# completion settings
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' group-name '' # grouping related matches

# options

# turn qualifiers on, turning this off will disable selecting files by type
setopt bare_glob_qual
# disable auto spliting words in variable
#use array if you want words splitting
setopt NO_sh_word_split

setopt bad_pattern
setopt bang_hist
setopt NO_beep
setopt bg_nice
setopt chase_links
setopt NO_clobber
setopt correct
setopt NO_csh_junkie_history
setopt NO_csh_junkie_loops
setopt NO_csh_junkie_quotes
setopt csh_null_glob
setopt function_arg_zero
#setopt glob #unchecked
#setopt NO_glob_assign #unchecked
#setopt glob_complete #unchecked
#setopt NO_glob_dots #unchecked
setopt NO_glob_subst
setopt hash_cmds
#setopt hash_dirs #unchecked
setopt hash_list_all
setopt hash_all
setopt NO_hup
#setopt NO_ignore_braces #unchecked
#setopt NO_ignore_eof #unchecked
setopt interactive_comments
setopt NO_ksh_glob
setopt NO_ksh_arrays
setopt NO_ksh_autoload
#setopt NO_list_ambiguous #unchecked
#setopt NO_list_beep #unchecked
#setopt list_types #unchecked
#setopt list_packed #unchecked
setopt local_options
setopt local_traps
#setopt magic_equal_subst #unchecked
#setopt NO_mail_warning #unchecked
#setopt NO_mark_dirs #unchecked
#setopt NO_menu_complete #unchecked
setopt NO_nomatch
setopt notify
#setopt NO_null_glob #unchecked
#setopt numeric_glob_sort #unchecked
#setopt NO_overstrike #unchecked
#setopt path_dirs #unchecked
#setopt posix_builtins #unchecked
setopt NO_print_exit_value
#setopt NO_prompt_cr #unchecked
setopt prompt_percent
setopt NO_pushd_minus
setopt NO_pushd_silent
setopt pushd_to_home
#setopt rc_expand_param #unchecked
#setopt NO_rc_quotes #unchecked
setopt NO_rm_star_silent
setopt NO_rm_star_wait
setopt NO_sh_file_expansion
setopt NO_sh_option_letters
#setopt short_loops #unchecked
#setopt NO_single_line_zle #unchecked
#setopt NO_sun_keyboard_hack #unchecked
#setopt unset #unchecked
setopt NO_verbose
setopt NO_xtrace
#setopt zle #unchecked


# bindkey
bindkey '' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1


# loading aliases
#alias sudo='sudo '
alias ln='nocorrect ln'
alias lsa='ls -alkiGF'
alias rm='rm -r'
alias cp='cp -vr'

# Aliases for tar command
  # create/extract/list/append tar
  alias ctar='tar -pcvf'
  alias xtar='tar -pxvf'
  alias ltar='tar -tvf'
  # create/extract/list/append tar.gz
  alias cztar='tar -pcvzf'
  alias xztar='tar -pxvzf'
  alias lztar='tar -tvzf'
  # create/extract/list/append tar.bz2
  alias cjtar='tar -pcvjf'
  alias xjtar='tar -pxvjf'
  alias ljtar='tar -tvjf'

# cleaning vim's backup
find $HOME/.vimbackup -name "*" -type f -mtime +90 -exec rm -f {} \;

typeset -U cdpath
cdpath=( . $cdpath ~ /Volumes/Haru/Users/tessa ~/Dropbox/synchronized ~/wip ~/src / )

if [[ -d $HOME/Dropbox/Public/ss ]]; then
    find $HOME/Dropbox/Public/ss \
        -name "*" -type f -mtime +10 -exec rm -f {} \;
fi

if [[ -d $HOME/Dropbox/Public/temp ]]; then
    find $HOME/Dropbox/Public/temp \
    -name "*" -type f -mtime +10 -exec rm -r {} \;
fi

# aliases for OS X system
if uname | grep Darwin >> /dev/null; then
    alias port='sudo port'
    alias sha512sum='gsha512sum'

    manpath=(/opt/local/man /usr/local/man $manpath)
    cdpath=($cdpath ~/Documents)

fi

if which fzf > /dev/null; then
    alias fzfp='fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] &&
        echo {} is a binary file ||
        (highlight -O ansi -l {} ||
        coderay {} ||
        rougify {} ||
        cat {}) 2> /dev/null | head -500'"'"
fi

export FZF_COMPLETION_TRIGGER=',,'

