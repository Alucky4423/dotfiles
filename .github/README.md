# Alucky4423's dotfiles

## Installation

```
git clone --bare https://github.com/Alucky4423/dotfiles.git $HOME/.dotfiles.git

# initialize
alias config="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
config config --local status.showUntrackedFiles no
config checkout
```


## References

- https://www.atlassian.com/git/tutorials/dotfiles

