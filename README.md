# Dotfiles Configuration

This repository contains my dotfiles and configuration files.

## Requirements

### Install GNU Stow
[GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) is a simple and powerful symlink manager used to manage your dotfiles. You can install it using Homebrew:

```shell
brew install stow
```
## Setup
```shell
git clone git@github.com:jp-roisin/dotfiles.git
cd dotfiles
stow .
```
This will create symlinks for all the configuration files in their appropriate locations.

### Notes
- Ensure that the directory structure of this repository matches the structure expected in your home directory.
- If you want to stow specific configurations (e.g., only `alacritty`), you can run:

    ```shell
    stow alacritty
    ```
