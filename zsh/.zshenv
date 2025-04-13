## XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config"
## zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=200
export SAVEHIST=200

## path
export PATH="$PATH:$HOME/.script"       # For custom script
export PATH="$PATH:$HOME/.cargo/bin"	  # For rust

####### External Tool #######

## editor
export EDITOR="nvim"
export VISUAL="nvim"

## fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

## bat
export BAT_THEME='Solarized (dark)'
