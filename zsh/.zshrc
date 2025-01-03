# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
unsetopt BEEP
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# For a full list of active aliases, run `alias`.
export FZF_BASE=/usr/sbin/fzf
source $ZSH/oh-my-zsh.sh
autoload -U compinit; compinit
source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-completions/zsh-completions.plugin.zsh
eval "$(zoxide init --cmd cd zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybingings
bindkey -e

source ~/.zsh_aliases

fzh() {
  local selected_command
  selected_command=$(history | fzf -tac --height 40% --reverse --query="$LBUFFER" | sed 's/^[ ]*[0-9]\+[ ]*//')
  if [ -n "$selected_command" ]; then
    eval "$selected_command"
  fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "/home/harsh/.deno/env"

# Created by `pipx` on 2024-10-23 16:11:05
export PATH="$PATH:/home/harsh/.local/bin"
eval "$(register-python-argcomplete pipx)"

