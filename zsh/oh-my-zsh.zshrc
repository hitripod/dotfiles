export ZSH="$HOME/.oh-my-zsh"

# Theme

# Plugins
plugins=(brew docker npm autojump zsh-completions)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh


# PATH Cleanup
export PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/go"
export PATH="$PATH:$HOME/fvm/default/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export tPATH="$PYENV_ROOT/bin:$PATH"
# MySQL and PostgreSQL
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"

# For NVM
export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use v22.13.0


# Google Cloud SDK
if [ -f "$HOME/bin/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/bin/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/bin/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/bin/google-cloud-sdk/completion.zsh.inc"
fi

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# For GCP Python
export CLOUDSDK_PYTHON="$HOME/.pyenv/shims/python"

# Autojump
if command -v autojump &> /dev/null; then
  source $(brew --prefix)/etc/profile.d/autojump.sh
fi

# Codeium Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

export PATH="$PATH:/Applications/screenpipe.app/Contents/MacOS"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Task Master aliases added on 4/23/2025
alias tm='task-master'
alias taskmaster='task-master'
