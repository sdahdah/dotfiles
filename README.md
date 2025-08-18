# dotfiles

My Linux configuration files, organized using
[GNU Stow](https://www.gnu.org/software/stow/).

## Instructions

To deploy a set of dotfiles (*e.g.*, `.tmux.conf`) run

```sh
$ stow tmux
```

from the repository root. This will symlink `./tmux/.tmux.conf` to `~/.tmux.conf`.

If any of the configuration files already exist, you will have to delete them
first.

## Reference

[Using GNU Stow to manage your dotfiles, by Brandon Invergo](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
