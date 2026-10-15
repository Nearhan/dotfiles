# CLAUDE.md

Personal macOS (Apple Silicon) dotfiles. Branch `mac` is the main branch.

## How it works
- `bootstrap.sh` installs Homebrew + `Brewfile` and **symlinks** repo files into `$HOME`.
  The repo is the source of truth: `~/.zshrc`, `~/.zprofile`, `~/.tmux.conf`,
  `~/.config/nvim` and `~/.config/kitty` all point back here.
- `./bootstrap.sh link` re-creates only the symlinks. When adding a new config file,
  add a `link` line in `link_all` and a row in the README table.

## Rules
- **This repo is public. Never commit secrets.** API keys/tokens belong in
  `~/.zshrc.local` (untracked, sourced at the end of `.zshrc`). Installers that append
  `export FOO_TOKEN=...` to `~/.zshrc` will write into this repo: move those lines to
  `~/.zshrc.local` before committing. Check with
  `git diff | grep -E 'sk-ant-|ghp_|glpat-|AIza|TOKEN=|KEY='`.
- Use `$HOME` / `${HOMEBREW_PREFIX:-/opt/homebrew}` instead of hard-coded `/Users/...` or `/usr/local` paths.
- Don't run one-off commands (`git config --global`, `defaults write`) from `.zshrc`;
  they run on every shell start. Put them in `bootstrap.sh`.
- `kitty/kitty.conf` only holds overrides, not the full default config.
  `kitten themes` rewrites `current-theme.conf` and the `BEGIN_KITTY_THEME` block.
- Refresh the Brewfile with `brew bundle dump --file=Brewfile --force`.

## Verify changes
- `zsh -i -c exit` starts with no errors, and `time zsh -i -c exit` stays well under 1s.
- `bash -n bootstrap.sh`
- kitty: `kitty +runpy "from kitty.config import load_config; load_config('kitty/kitty.conf')"`
  prints no new warnings (the `f9+o has unknown modifier` warning is pre-existing).
