# home
## How to init your own dotfiles

```sh
cd $HOME
git init --bare .dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

## How to install on a new system

Backup first
```sh
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Then the magic
```sh
cd $HOME
git clone --bare https://github.com/umed/.dotfiles.git .dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no

dotfiles checkout # checkout files into home directory
```

## Prerequisites

```
brew install --cask font-hack-nerd-font
```