## PATH
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_STATE_HOME="$HOME/.local/state/"
export DOTFILES="$HOME/.dotfiles"

## zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000

####### External Tool #######

## editor
export EDITOR="nvim"
export VISUAL="nvim"

## fzf
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --highlight-line --info=inline-right --ansi \
  --color=bg+:#002c38 \
  --color=bg:#001419 \
  --color=border:#063540 \
  --color=fg:#9eabac \
  --color=gutter:#001419 \
  --color=header:#c94c16 \
  --color=hl+:#c94c16 \
  --color=hl:#c94c16 \
  --color=info:#637981 \
  --color=marker:#c94c16 \
  --color=pointer:#c94c16 \
  --color=prompt:#c94c16 \
  --color=query:#9eabac:regular \
  --color=scrollbar:#063540 \
  --color=separator:#063540 \
  --color=spinner:#c94c16 \
"

## bat
export BAT_THEME='Solarized (dark)'
