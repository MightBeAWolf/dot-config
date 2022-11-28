
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Initialize the keychain
eval $(keychain --eval --nogui --noask --quiet \
  --dir "${HOME}/.local/keychain" \
  "$(find ~/.ssh -name 'id_rsa*' ! -name '*.pub')" \
)
# Load the prompt if one is found in the 
# home directory. If starship is found on 
# the system then the prompt will be 
# overwritten later. 
if [[ -f "${HOME}/.bash_prompt" ]]; then 
  source "${HOME}/.bash_prompt"
fi
# Enable thefuck command correction utility.
# To use this run the command 'fuck' after
# an invalid command.
eval $(thefuck --alias)
# Add alias for commands that have either been
# replaced with an alternative, or just need
# some default options or flags
alias ls='exa'
alias grep='grep --color=auto'
alias du='dust'
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
# Enable starship prompt for bash
if which starship >/dev/null 2>/dev/null; then 
  eval "$(starship init bash)"
fi
