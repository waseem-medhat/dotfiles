## Installation

- Clone the contents of this repo into `~/.dotfiles`

```bash
git clone git@github.com:wipdev-tech/dotfiles.git ~/.dotfiles
```

- `cd` into the directory
- Run `stow .`

## Program-Specific Notes

### Tmux

- Run `[Prefix] I` to install Tmux plugins. They are not git-tracked.

### Neovim

- This config was initially based on [Kickstart](https://github.com/nvim-lua/kickstart.nvim)
- System-level dependencies for Neovim and plugins (e.g., Telescope):

```bash
sudo apt install gcc g++ git ripgrep curl
```

- Language-specific dependencies may be required for language servers (e.g., Go toolchain for `gopls` and Node/NPM for `tsserver`).
