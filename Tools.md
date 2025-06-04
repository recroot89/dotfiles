# Development Tools & Packages

This document provides information about all the tools and packages installed by the `install.sh` script.

## Shell Framework

### Oh My Zsh
- **Description**: A popular framework for managing Zsh configuration with themes and plugins
- **Website**: https://ohmyz.sh/
- **Purpose**: Enhances the Zsh shell experience with autocompletion, themes, and community plugins

## Zsh Plugins

### zsh-syntax-highlighting
- **Description**: Fish shell-like syntax highlighting for Zsh
- **Repository**: https://github.com/zsh-users/zsh-syntax-highlighting
- **Purpose**: Provides real-time syntax highlighting as you type commands

### zsh-autosuggestions
- **Description**: Fish shell-like fast/unobtrusive autosuggestions for Zsh
- **Repository**: https://github.com/zsh-users/zsh-autosuggestions
- **Purpose**: Suggests commands as you type based on command history

## Search & File Tools

### fzf
- **Description**: A command-line fuzzy finder
- **Repository**: https://github.com/junegunn/fzf
- **Purpose**: Interactive filtering for command-line, files, and command history

### the_silver_searcher (ag)
- **Description**: A code-searching tool similar to grep but faster
- **Repository**: https://github.com/ggreer/the_silver_searcher
- **Purpose**: Fast text searching across files with smart defaults

### ripgrep (rg)
- **Description**: A line-oriented search tool that recursively searches directories
- **Repository**: https://github.com/BurntSushi/ripgrep
- **Purpose**: Extremely fast alternative to grep with modern features

### fd
- **Description**: A simple, fast and user-friendly alternative to 'find'
- **Repository**: https://github.com/sharkdp/fd
- **Purpose**: Finding files and directories with intuitive syntax

## Text Processing & Viewing

### bat
- **Description**: A cat clone with syntax highlighting and Git integration
- **Repository**: https://github.com/sharkdp/bat
- **Purpose**: Enhanced file viewing with syntax highlighting and line numbers

## Version Management

### asdf
- **Description**: A version manager for multiple runtime languages
- **Website**: https://asdf-vm.com/
- **Purpose**: Manage multiple versions of programming languages (Ruby, Node.js, etc.)
- **Plugins**:
  - **Ruby**: For managing Ruby versions
  - **Node.js**: For managing Node.js versions

## Git Tools

### lazygit
- **Description**: A simple terminal UI for git commands
- **Repository**: https://github.com/jesseduffield/lazygit
- **Purpose**: Interactive Git interface for easier repository management

## Database

### PostgreSQL
- **Description**: Advanced open-source relational database
- **Website**: https://www.postgresql.org/
- **Purpose**: Database development and management
- **Note**: On macOS installs full PostgreSQL, on Arch Linux installs client libraries only

## Kubernetes Tools

### k9s
- **Description**: Kubernetes CLI to manage your clusters in style
- **Repository**: https://github.com/derailed/k9s
- **Purpose**: Terminal-based UI for interacting with Kubernetes clusters

## Network Tools

### nmap
- **Description**: Network Mapper - network discovery and security auditing tool
- **Website**: https://nmap.org/
- **Purpose**: Network scanning, host discovery, and security assessment

## System Utilities

### zip/unzip
- **Description**: Archive compression and extraction utilities
- **Purpose**: Creating and extracting ZIP archives
- **Note**: Linux only (macOS has these built-in)

### xclip
- **Description**: Command line interface to X11 clipboard
- **Purpose**: Copy/paste from command line to system clipboard
- **Note**: Linux only

### XQuartz
- **Description**: X11 server for macOS
- **Website**: https://www.xquartz.org/
- **Purpose**: X11 clipboard support and GUI applications
- **Note**: macOS only

## Package Managers

### Homebrew (macOS)
- **Description**: The missing package manager for macOS
- **Website**: https://brew.sh/
- **Purpose**: Installing and managing software packages on macOS

### Pacman (Arch Linux)
- **Description**: Package manager for Arch Linux
- **Purpose**: Installing and managing software packages on Arch Linux

## Installation Notes

- The script automatically detects your operating system (macOS or Arch Linux)
- All tools are installed via the appropriate package manager for your system
- The script includes error handling and checks for existing installations

