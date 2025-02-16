unsetopt BEEP
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=screen-256color
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time to update oh-my-zsh
plugins=(git
	fzf
	fzf-tab
	zsh-autosuggestions
	zsh-completions
	command-not-found
	sudo
	archlinux)

# User configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

EDITOR='nvim'
# For a full list of active aliases, run `alias`.
# Keybingings
bindkey -v

source ~/dotfiles/zsh/.zsh_aliases

# really cool fzf history search one
fzh() {
  local selected_command
  selected_command=$(history | fzf  --height 40% --reverse --query="$LBUFFER" | sed 's/^[ ]*[0-9]\+[ ]*//')
  if [ -n "$selected_command" ]; then
    eval "$selected_command"
  fi
}
