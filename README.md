# DotFiles

This is my personal Dotfiles that I use. Feel free to download or clone if you like it.

## Content

This repository contains the following dot files:

- **Git** (`.gitconfig`) — aliases, colors, and GPG commit/tag signing. The
  signing key itself is kept out of the repo (see [Machine-local config](#machine-local-config)).
- **Vim** (`.vimrc`) — vim-plug setup with ALE-driven LSP. Ruby and Go both get
  linting, format-on-save, completion, and go-to-definition; Go uses `gopls`
  (`gd` definition, `gr` references, `gh` hover) plus `golangci-lint`.
- **Zsh** (`.zshrc`) — Oh My Zsh with a curated plugin set.
- **Bash** (`.bashrc`) — Oh My Bash (when installed) plus the Go/asdf/`~/.local/bin`
  PATH; mainly for the Debian boxes, which run bash.
- **Tmux** (`.tmux.conf`, `.tmux/scripts/`) — config plus helper scripts;
  plugins are managed by [tpm](https://github.com/tmux-plugins/tpm) at install time.
- **asdf** (`.tool-versions`) — global runtime version pins (e.g. Ruby).
- **Global git ignore** (`.config/git/ignore`) — patterns ignored across all repos.

macOS only (listed under `macos_files` in `config.txt`; skipped on other systems):

- **Zsh login** (`.zprofile`) — Homebrew `shellenv`.
- **VSCodium** (`Library/Application Support/VSCodium/User/settings.json`) — editor settings.

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

### Setup (new machine)

`./install` only places files. `./setup` also installs what the configs depend
on, dispatching to `bin/setup/<os>`:

```
./setup
```

On macOS it installs Homebrew if missing, the packages `.vimrc`/`.tmux.conf`
need (`tmux vim fzf ripgrep`), a Nerd Font for vim-devicons, then runs
`./install` and `vim +PlugInstall`. `bin/setup/ubuntu` and `bin/setup/fedora`
are unimplemented stubs.

Run this from a real terminal — the `PlugInstall` step needs a tty.

> For a full machine build (dev toolchain, Docker, GUI apps, Claude Code) use
> [os-recipies](https://github.com/asccigcc/os-recipies) instead; it clones this
> repo and runs `./install` at the end. `./setup` overlaps it and is the
> lighter, dotfiles-only path — it's also currently the only one that installs
> the vim plugins and a Nerd Font.

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

## Machine-local config

Some settings are host-specific or private and are deliberately **not tracked**:

- **`~/.gitconfig.local`** — holds `user.signingkey` for GPG signing. The tracked
  `.gitconfig` pulls it in via `[include]`, and Git silently skips it if it's
  absent. On a new machine, create it so commit signing works:

  ```
  [user]
      signingkey = <YOUR_KEY_ID>
  ```

Which files get synced is defined in `config.txt`; values to blank out on
`./sync push` are listed in `secrets`.

## License

This is released under the MIT License.
