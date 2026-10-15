# macOS Dotfiles

## Tools
- [kitty](https://sw.kovidgoyal.net/kitty/) (terminal)
- zsh + [Antigen](https://github.com/zsh-users/antigen) (oh-my-zsh, syntax highlighting, autosuggestions)
- [pure](https://github.com/sindresorhus/pure) prompt
- NeoVim (text editor, `vim`/`vi` are aliased to it)
- tmux
- Remap keys https://pqrs.org/osx/karabiner/

Everything installable is listed in the `Brewfile`.

## Setup
```
./bootstrap.sh
```
Installs Homebrew and the `Brewfile`, then symlinks the configs into place:

| Repo         | Linked to          |
|--------------|--------------------|
| `.zshrc`     | `~/.zshrc`         |
| `.zprofile`  | `~/.zprofile`      |
| `.tmux.conf` | `~/.tmux.conf`     |
| `nvim/`      | `~/.config/nvim`   |
| `kitty/`     | `~/.config/kitty`  |

Because they are symlinks, editing `~/.zshrc` (etc.) edits this repo, so commit as you go.
Run `./bootstrap.sh link` to re-create just the links. Any existing file is moved to `<name>.backup.<timestamp>` first.

## Secrets
API keys and tokens go in `~/.zshrc.local` (sourced at the end of `.zshrc`, `chmod 600`).
It is **not** in this repo. This repo is public, so never put secrets in a tracked file.

To refresh the `Brewfile` after installing something: `brew bundle dump --file=Brewfile --force`.

# Important Reads
- Tmux copy paste setup:
https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

- Tmux window dimensions

First setup your window the way you want, your panes the sizes etc etc. Then 
```
$ tmux list-windows
1: ~* (4 panes) [208x59] [layout 3682,208x59,0,0[208x29,0,0{95x29,0,0,0,112x29,96,0[112x22,96,0,1,112x6,96,23,2]},208x29,0,30,3]] @0 (active)
```
Add that Take everything in layout and add that to your tmux managment

More reading here:
https://fabianfranke.de/2013/11/19/use-tmuxinator-to-recreate-tmux-panes-and-windows/
