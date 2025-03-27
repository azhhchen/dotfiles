# dotfiles/.config/nvim

<a href="https://dotfyle.com/azhhchen/dotfiles-config-nvim"><img src="https://dotfyle.com/azhhchen/dotfiles-config-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/azhhchen/dotfiles-config-nvim"><img src="https://dotfyle.com/azhhchen/dotfiles-config-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/azhhchen/dotfiles-config-nvim"><img src="https://dotfyle.com/azhhchen/dotfiles-config-nvim/badges/plugin-manager?style=flat" /></a>

## 🌟 Introduction

Welcome to my **Neovim Configuration**! 🚀  

This setup is designed for **modern, efficient, and minimalistic** development. With a focus on performance and usability, it provides a **lightweight yet powerful** workflow.  

### ⚡ Performance
> [!NOTE]
> **Equipment:** 2019 MacBook Pro 16' (i9-9900HK)
- **Startup Time:**  
  - **~40ms** (without opening files)  
  - **70~150ms** (depending on the file type)  

### ✨ Features
- 🎨 **Customizable Colorschemes** (Solarized Osaka, VSCode Theme)  
- ⚡ **Optimized Performance** with Lazy Loading  
- 🔥 **Fully Integrated LSP Support** (`nvim-lspconfig`)  
- 📂 **Intuitive File Navigation** (`mini.files`)  
- ✍ **Enhanced Editing Experience** (Auto-pairs, Commenting, Surround Editing)  
- 💜 **Syntax Highlighting & Code Parsing** (`nvim-treesitter`)  
- 🛠 **Easy LSP Management** with `mason.nvim`  
- 🤝 **Efficient Statusline** powered by `lualine.nvim`  
- 🎭 **Improved UI Feedback** via `noice.nvim`  


## 🛠 Installation

### **Prerequisites**
- **Neovim 0.9+**  
- **Git** installed  

> [!WARNING]
> Do not install this configuration without reviewing the code first. If you choose to proceed without verification, you do so at your own risk.

### 💽 Install & Run  
Clone the repository:  
```sh
git clone git@github.com:azhhchen/dotfiles ~/.config/azhhchen/dotfiles
```

Launch Neovim with this configuration:  
```sh
NVIM_APPNAME=azhhchen/dotfiles/.config/nvim nvim
```


## 🛆 Plugin Overview

### 🎨 Colorscheme
- [craftzdog/solarized-osaka.nvim](https://dotfyle.com/plugins/craftzdog/solarized-osaka.nvim)  
- [Mofiqul/vscode.nvim](https://dotfyle.com/plugins/Mofiqul/vscode.nvim)  

### 💬 Commenting
- [echasnovski/mini.comment](https://dotfyle.com/plugins/echasnovski/mini.comment)  
- [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)  

### ✍ Editing Support
- [folke/snacks.nvim](https://dotfyle.com/plugins/folke/snacks.nvim)  
- [echasnovski/mini.pairs](https://dotfyle.com/plugins/echasnovski/mini.pairs)  

### 📂 File Explorer
- [echasnovski/mini.files](https://dotfyle.com/plugins/echasnovski/mini.files)  

### 🔣 Icons
- [echasnovski/mini.icons](https://dotfyle.com/plugins/echasnovski/mini.icons)  

### 🚀 LSP (Language Server Protocol)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)  

### ⚙️ LSP Installer
- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)  

### 🛠 Neovim Development
- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)  

### 📦 Plugin Manager
- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)  

### ✂️ Snippets
- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)  

### 📊 Statusline
- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)  

### 💜 Syntax Highlighting
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)  
- [echasnovski/mini.surround](https://dotfyle.com/plugins/echasnovski/mini.surround)  

### 🛠 Utility
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)  


## 🌐 Language Servers

Currently Configured:
- **Lua** (using `lua-language-server`)  


## 📝 Notes & Contribution

If you have any issues or suggestions, feel free to open an **issue** or **pull request** on GitHub!  

Happy coding! 🚀✨  
