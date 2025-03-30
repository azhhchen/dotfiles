## Don't let macOS Terminal.app load any setting
if [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
  alias nvim='nvim --clean' # Neovim without any configuration
  return
fi

## Variable
export EDITOR="nvim"

## PATH
export PATH="$PATH:$HOME/.script"       # For custom script
export PATH="$PATH:$HOME/.cargo/bin"	  # For rust

## History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=200
export SAVEHIST=200

## Homebrew setting
export HOMEBREW_NO_AUTO_UPDATE=1

## Aliases
alias vim='nvim'
alias mv='mv -i'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

## Syntax highlight /  Autosuggestion
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Starship
# eval "$(starship init zsh)"

## FZF
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude={.git,plugged,.vscode,.sass-cache,.zsh_sessions,node_modules,build}"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# Advanced customization
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

## Eza
alias ll='eza -l -g --icons=always --long --no-filesize'
alias lla='ll -a'

## Bat
export BAT_THEME='Solarized (dark)'

## Zoxide (better cd)
eval "$(zoxide init zsh)"
