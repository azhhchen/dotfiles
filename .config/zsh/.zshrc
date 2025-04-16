## Don't let masOS Terminal.app load any setting
if [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
  alias nvim='nvim --clean'
  alias vim='vim --clean'
  return
fi

## Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '→ %b '
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='%m: %F{cyan}%~%f %F{yellow}${vcs_info_msg_0_}%f ${NEWLINE}%F{green}$%f '

## Aliases
alias ll='eza -l -g --icons=always --long --no-filesize'
alias lla='ll -a'
alias vim='nvim'
alias mv='mv -i'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

## Options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt CORRECT
setopt CDABLE_VARS
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

## Vi mode
bindkey -v
export KEYTIMEOUT=1

# Add Vi text-objects for brackets and quotes
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Emulation of vim-surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# Increment a number
autoload -Uz incarg
zle -N incarg
bindkey -M vicmd '^a' incarg

####### External Tool #######

## fzf
source <(fzf --zsh)

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

## zoxide (better cd)
eval "$(zoxide init zsh)"
