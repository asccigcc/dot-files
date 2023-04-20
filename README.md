# DotFiles

This is my personal Dotfiles that I use. Feel free to download or clone if you like it.

## Content

This repository contains the following dot files:

- Github
- Vim
- Zsh
- Tmux

## Usage

The dotfiles provides two bash commands `install.sh` and `sync.sh` that helps to setup your
computer terminal.

The command supports MacOS and Linux.

### Installation

Just only run:

```
./install
```

And this will setup your dot files locally.

### Sync

You can sync your dot-files repo using the following command

```
./sync
```

This is useful in case that you did changes on your host computer that want to update into
your dot-files repo.

### Publish

This command will prepare your local changes and publish on Github.

```
./publish
```

This update `VERSION` file, create a `tag` and push to Github.

## License

This is released under the MIT License.
