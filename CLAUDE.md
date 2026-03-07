# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **dotfiles repository** managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory (e.g., `git/`, `zsh/`, `ghostty/`, `karabiner/`) is a "stow package" — its contents mirror the home directory structure and get symlinked into `$HOME` when stowed.

## How Stow Works Here

- `.stowrc` sets `--target=$HOME`, so running `stow <package>` from the repo root symlinks that package's contents into the home directory.
- `.stow-local-ignore` excludes `.git`, `.idea`, `scripts/`, `README`, and `LICENSE` files from being stowed.

## Commands

```bash
# Symlink a package (e.g., git configs) into $HOME
stow git

# Symlink all packages at once
stow */

# Remove symlinks for a package
stow -D git

# Preview what stow would do (dry run)
stow -n -v git
```

## Package Structure

Each package directory mirrors the home directory layout:

- **`git/`** — `.gitconfig` (root-level) and `.config/git/ignore` (XDG-style global gitignore)
- **`zsh/`** — `.zshrc` (oh-my-zsh with agnoster theme)
- **`ghostty/`** — `.config/ghostty/config` (Ghostty terminal config)
- **`karabiner/`** — `.config/karabiner/karabiner.json` (keyboard remapping, caps lock as modifier key)
- **`scripts/`** — Utility scripts (not stowed; has its own `.stow-local-ignore` that ignores all files, plus excluded at repo level). Contains `bootstrap` for new machine setup.

## Conventions

- Root-level dotfiles (like `.gitconfig`) go directly in the package directory: `git/.gitconfig`
- XDG-style configs go under `.config/` within the package: `ghostty/.config/ghostty/config`
- When adding a new application's config, create a new top-level directory named after the application
