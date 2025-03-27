# Dotfiles Configuration

This repository contains my personal dotfiles, including configurations for various tools and applications. It is designed to be easily managed and deployed across different systems.

## Included Configurations

- **Git**: `.gitconfig`, `.gitignore`
- **Zsh**: `.zshrc`
- **Starship**: `starship.toml` (prompt configuration)
- **Ghostty**: Terminal configuration
- **Neovim**: Custom `init.lua` and plugin settings
- **Vim**: Legacy Vim setup with plugins and keymaps
- **Tmux**: `tmux.conf`, status line, and theme settings
- **Yazi**: File manager configuration
- **Zed**: Keybindings and settings for Zed editor
- **VS Code**: Keybindings and settings
- **Custom Scripts**: Stored in `.script/`

## Installation

To set up these dotfiles on a new system, follow these steps:

1. **Clone the repository**:
   ```sh
   git clone --recursive https://github.com/your-username/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install required dependencies**:
   - `stow` (for managing symlinks)
   - `zsh`, `tmux`, `neovim`, `fzf`, `starship`, etc.

   On macOS (using Homebrew):
   ```sh
   brew install stow zsh tmux neovim fzf starship
   ```

   On Arch Linux:
   ```sh
   sudo pacman -S stow zsh tmux neovim fzf starship
   ```

3. **Use `stow` to symlink configurations** or just manually link to correct path

4. *Happy coding*!!

## To-Do List

- [x] Configure Neovim
- [x] Add Tmux configuration
- [ ] Add Karabiner configuration (for macOS key remapping)
- [ ] Write an installation script for easier setup
- [ ] Add Hyprland configuration for Arch Linux


## Additional Notes

- **Neovim**: Uses `lazy.nvim` for plugin management.
- **Tmux**: Custom themes and status bar configuration.
- **Ghostty**: Configuration for a better terminal experience.

## Contributions

Feel free to fork, modify, and contribute to this dotfile setup!

## License

WTFPL
