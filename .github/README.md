<br />
<div align="center">
  <img src="./assets/dotfiles-logo.svg"
       alt="logo"
       width="80"
       height="80" />

  <h3>Aleucky's dotfiles ☕</h3>
</div>

## Usage

```
git clone --bare https://github.com/Alucky4423/dotfiles.git $HOME/.dotfiles.git

# initialize
alias config="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
config config --local status.showUntrackedFiles no
config checkout
```


## Reference

- https://www.atlassian.com/git/tutorials/dotfiles

