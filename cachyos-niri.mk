# INSTALLATION

fisher-install:
	fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'

niri-install:
	mkdir -p $(HOME)/.config/niri
	ln -sf $(CURDIR)/cachyos-niri/config/niri/local.kdl $(HOME)/.config/niri/local.kdl
	grep -qxF 'include "local.kdl"' $(HOME)/.config/niri/config.kdl || \
		printf '\ninclude "local.kdl"\n' >> $(HOME)/.config/niri/config.kdl

packages-install:
	sudo pacman -Syu --needed \
		fish mise usage ghostty fzf bat fd \
		ripgrep lazygit nmap k9s neovim curl \
		postgresql-libs zip unzip wl-clipboard \
		docker docker-compose ansible \
		lua51-dkjson zoxide eza btop dust \
		ttf-jetbrains-mono-nerd ttf-roboto-mono-nerd noto-fonts noto-fonts-emoji \
		gnome-disk-utility nwg-look papirus-icon-theme

# CONFIGURATION

DOTFILES_DIR := $(CURDIR)/cachyos-niri
CONFIG_DIR := $(HOME)/.config

mise-config:
	mkdir -p $(CONFIG_DIR)/mise
	ln -sf $(DOTFILES_DIR)/config/mise/config.toml $(CONFIG_DIR)/mise/config.toml

fish-config:
	mkdir -p $(CONFIG_DIR)/fish/conf.d
	ln -sf $(DOTFILES_DIR)/config/fish/config.fish $(CONFIG_DIR)/fish/config.fish
	ln -sf $(DOTFILES_DIR)/config/fish/fish_plugins $(CONFIG_DIR)/fish/fish_plugins
	ln -sf $(DOTFILES_DIR)/config/fish/conf.d/aliases.fish $(CONFIG_DIR)/fish/conf.d/aliases.fish
	ln -sf $(DOTFILES_DIR)/config/fish/conf.d/git.fish $(CONFIG_DIR)/fish/conf.d/git.fish
	ln -sf $(DOTFILES_DIR)/config/fish/conf.d/theme.fish $(CONFIG_DIR)/fish/conf.d/theme.fish

ghostty-config:
	mkdir -p $(CONFIG_DIR)/ghostty
	ln -sf $(DOTFILES_DIR)/config/ghostty/config $(CONFIG_DIR)/ghostty/config

setup-configs: mise-config fish-config ghostty-config
