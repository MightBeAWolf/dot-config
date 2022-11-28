# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/tgreyw/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.local/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# Initialize the keychain 
eval $(keychain --eval --nogui --noask --quiet \
  --dir "${HOME}/.local/keychain" \
  "$(find ~/.ssh -name 'id_rsa*' ! -name '*.pub')" \
)
# Add alias for commands that have either been
# replaced with an alternative, or just need
# some default options or flags
alias ls='exa'
alias grep='grep --color=auto'
alias du='dust'
# Enable thefuck command correction utility.
# To use this run the command 'fuck' after
# an invalid command. 
eval $(thefuck --alias) 
# Add the pip user bin directory
if [[ -d "${HOME}/.local/bin" ]]; then
  export PATH="${PATH}:${HOME}/.local/bin"
fi
# Load the cargo environment
if [[ -e "${HOME}/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi
# Select the default editor
export EDITOR="/bin/nvim"
export VISUAL="/bin/nvim"
# Use vivid to set ls/tree/fd/dust colors
export LS_COLORS="$(vivid generate nord)"
# Keep less from storing history, I hate
# the clutter in home
export LESSHISTFILE=/dev/null
# Load the zsh keybindings 
bindkey -- "^R" history-incremental-search-backward 
bindkey -- "^F" end-of-line
# Load the zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Enable starship prompt for zsh
if which starship >/dev/null 2>/dev/null; then
  eval "$(starship init zsh)"
fi
# Enable fuzzy finder
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
