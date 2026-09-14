# ~/.bashrc — interactive bash config.
#
# Primarily for the Debian boxes (which run bash via oh-my-bash); macOS uses
# zsh, so this stays harmless there. Portable: no machine-specific absolute
# paths — everything keys off $HOME.

# --- oh-my-bash (loaded only if installed) ---
export OSH="$HOME/.oh-my-bash"
if [ -d "$OSH" ]; then
    OSH_THEME="font"
    completions=(git ssh)
    plugins=(git bashmarks)
    source "$OSH/oh-my-bash.sh"
fi

# --- PATH ---
# Go toolchain + `go install` binaries (gopls, goimports, asdf, ...). Debian's
# oh-my-bash default .bashrc omits these, so `ruby`/tools wouldn't resolve.
export PATH="/usr/local/go/bin:$HOME/go/bin:$PATH"
# asdf shims (Ruby, ...).
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# User-local binaries (Claude Code, etc.).
export PATH="$HOME/.local/bin:$PATH"

# --- tools ---
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
