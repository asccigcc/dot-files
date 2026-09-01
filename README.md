# DotFiles

This is my personal Dotfiles that I use. Feel free to download or clone if you like it.

## Content

This repository contains the following dot files:

- Github
- Vim
- Zsh
- Tmux

## Usage

The dotfiles provide bash commands that help you set up your computer terminal.

The commands support MacOS and Linux.

### Installation

Just run:

```
./install
```

This copies the dot files into `$HOME` (backing up anything it overwrites) and
bootstraps tmux. Pass `--yes` to skip the overwrite prompts.

### Sync

Sync copies dotfiles in either direction:

```
./sync push   # local -> repo (and scrub secrets)
./sync pull   # repo  -> local (backs up existing files)
```

Use `push` when you changed files on your host computer and want them in the
repo; use `pull` to apply the repo's files to your host. Add `--yes` to skip the
confirmation prompts.

### Publish

This command will prepare your local changes and publish on Github.

```
./publish
```

This update `VERSION` file, create a `tag` and push to Github.

### Diff

This command shows if we have diff between local and git directory files/dirs

```
./diff
```

Returns data in case of differences.

## License

This is released under the MIT License.
