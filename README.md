# My Fav Set up

## ---Git configuration---
make git-config

### Or pass values directly:
make git-config GIT_USER="<your_user>" GIT_EMAIL="<your_email>"

## Tmux config
echo "set -g mouse-on > ~/.tmux.conf"
tmux source-file ~/.tmux.conf

## ZSH installation and plugins

```sh
make zsh-install

# Change plugins inside ~/.zshrc to include new plugins, for example:
# plugins=(
#     git
#     zsh-autosuggestions
#     zsh-syntax-highlighting
#     zsh-history-substring-search
# )
```
