# stole from dreamsofautonomy/zensh/blob/main/.zshrc
#plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
#plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light MichaelAquilina/zsh-you-should-use
zinit light zsh-users/zsh-autosuggestions
# zinit light jeffreytse/zsh-vi-mode
zi ice lucid wait has'fzf'
zi light Aloxaf/fzf-tab
zi ice lucid wait as'completion' blockf has'wl-copy'
zi snippet https://github.com/bugaevc/wl-clipboard/blob/master/completions/zsh/_wl-copy

zi ice lucid wait as'completion' blockf has'wl-paste'
zi snippet https://github.com/bugaevc/wl-clipboard/blob/master/completions/zsh/_wl-paste
zi ice lucid wait as'completion' blockf has'rg' mv'rg.zsh -> _rg'
zi snippet https://github.com/BurntSushi/ripgrep/blob/master/crates/core/flags/complete/rg.zsh

#snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit #load completions
zinit cdreplay -q
#keybinds
bindkey -v
bindkey -M viins '^Y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^H' backward-kill-word
bindkey '^[w' kill-region
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
