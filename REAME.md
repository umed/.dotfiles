# home
## How to init your own dotfiles

```sh
cd $HOME
git init --bare .dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

## How to install on a new system

```sh
cd $HOME
git clone --bare git@github.com:umed/home.git .dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no

dotilfes checkout # checkout files into home directory
```