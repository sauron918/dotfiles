# DotFiles

This repo contains configuration files and scripts to set up my machines.

## How to use

* Use scripts in `scripts/` to set up a new machine:
  * `bootstrap.sh` — installs required Homebrew packages/casks (`stow`, `ghostty`, etc). Run this first on a new machine, before `stow`.
  * `configure.sh` — applies macOS system tweaks (twek key repeat rate, Caps Lock delays, disables Spotlight indexing, etc).
* Use [GNU Stow](https://www.gnu.org/software/stow/) for provisioning: `cd ~/dotfiles && stow --adopt */`

