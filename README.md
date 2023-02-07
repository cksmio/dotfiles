# dotfiles
vicc (bare) dotfiles

# after a new setup:

```bash
git clone --bare https://github.com/vicc/dotfiles.git $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir -p .dotfiles-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
config checkout
config config status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.aliases
```

## inspiration
- https://www.atlassian.com/git/tutorials/dotfiles
- https://news.ycombinator.com/item?id=11070797
