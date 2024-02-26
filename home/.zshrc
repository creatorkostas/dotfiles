# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
neofetch
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#source ~/.local/share/icons-in-terminal/icons_bash.sh
export GUI_EDITOR=code
export TERMINAL_EDITOR=nano

alias ytdlp='yt-dlp --playlist-random --write-thumbnail --write-subs --extract-audio --audio-format mp3 --embed-metadata --download-archive ~/Downloads/mps/archive -o "%(title)s.%(ext)s" --no-keep-fragments --retries 1 --no-keep-video'
alias rebuild='sudo nixos-rebuild switch'
alias ls='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias vim='vim'
alias vi='vim'
alias edit-zsh='vim ~/.zshrc'
alias grep='grep --color'
alias pgadmin4='sudo python3 -s /usr/pgadmin4/web/pgAdmin4.py'
alias upgrade='sudo nixos-rebuild switch --upgrade'
alias optimaze='nix-collect-garbage; nix-store --gc; nix-store --optimize;'
alias powersave='sudo powerprofilesctl set power-saver';
alias performance='sudo powerprofilesctl set performance';
alias balanced='sudo powerprofilesctl set balanced';
alias make_changes='sudo nano /etc/nixos/configuration.nix'
# alias stop-all='sudo ~/Desktop/Apps/stop_all.sh'
#alias powersave='sudo tlp bat';
#alias performance='sudo tlp ac'
#alias cat='cat -n'

bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey '^H' backward-kill-word


# Set up the prompt
#neofetch
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
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
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
#[ -s "/home/kostas/.bun/_bun" ] && source "/home/kostas/.bun/_bun"

# bun
#export BUN_INSTALL="$HOME/.bun"
#export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2023-11-27 14:26:59
export PATH="$PATH:/home/kostas/.local/bin"

export repos="/home/kostas/gitSoftware"
