# ---- Starship ----

# Initialize starship prompt
eval "$(starship init zsh)"

# ---- ZSH Plugins ----
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Improved History ----
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- Aliases ----
alias ll="ls -l"
alias la="ls -la"
alias vi="nvim"

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- FZF (key bindings and fuzzy completion) -----
eval "$(fzf --zsh)"

# ---- Default Editor ----
export EDITOR="nvim"
export VISUAL="nvim"
