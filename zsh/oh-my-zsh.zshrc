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

# For NVM
export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# MySQL and PostgreSQL
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

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

