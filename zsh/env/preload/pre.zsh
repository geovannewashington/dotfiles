export ZSH="/usr/share/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.local/share/oh-my-zsh/custom"
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump-$HOST"

# See <https://github.com/ohmyzsh/ohmyzsh/wiki/Themes> for more themes.
# Those already come pre-installed and are located at $HOME/.oh-my-zosh:/themes

ZSH_THEME="alanpeabody"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

