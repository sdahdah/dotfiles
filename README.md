# dotfiles

My Linux configuration files, organized using
[GNU Stow](https://www.gnu.org/software/stow/).

## Instructions

To deploy a set of dotfiles (*e.g.*, `.bashrc` and `.bash_profile`) run

```sh
$ stow --dotfiles bash/
```

from the repository root. This will symlink `./bash/dot-bashrc` to `~/.bashrc`
and `./bash/dot-bash_profile` to `~/.bash_profile`.

If any of the configuration files already exist, you will have to delete them
first.

## Reference

[Using GNU Stow to manage your dotfiles, by Brandon Invergo](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
