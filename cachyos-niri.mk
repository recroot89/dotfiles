# INSTALLATION

fisher-install:
	fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'

packages-install:
	sudo pacman -Syu --needed \
		fish mise usage ghostty fzf bat fd \
		ripgrep lazygit nmap k9s neovim curl \
		postgresql-libs zip unzip wl-clipboard \
		docker docker-compose ansible \
		lua51-dkjson zoxide eza btop dust \
		ttf-jetbrains-mono-nerd ttf-roboto-mono-nerd noto-fonts noto-fonts-emoji \
		gnome-disk-utility nwg-look papirus-icon-theme \
		cliphist

# CONFIGURATION

DOTFILES_DIR := $(CURDIR)/cachyos-niri
CONFIG_DIR := $(HOME)/.config

mise-config:
	mkdir -p $(CONFIG_DIR)/mise
	ln -sf $(PWD)/files/mise/config.toml $(CONFIG_DIR)/mise/config.toml

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

niri-config:
	mkdir -p $(HOME)/.config/niri
	ln -sf $(CURDIR)/cachyos-niri/config/niri/local.kdl $(HOME)/.config/niri/local.kdl
	grep -qxF 'include "local.kdl"' $(HOME)/.config/niri/config.kdl || \
		printf '\ninclude "local.kdl"\n' >> $(HOME)/.config/niri/config.kdl

setup-configs: mise-config fish-config ghostty-config niri-config

cachyos-setup: fisher-install packages-install setup-configs

# Themes

SDDM_ASTRONAUT_THEME := Themes/astronaut.conf

sddm-astronaut-install:
	paru -S --needed sddm-astronaut-theme
	sudo mkdir -p /etc/sddm.conf.d
	printf "[Theme]\nCurrent=sddm-astronaut-theme\n" | sudo tee /etc/sddm.conf.d/theme.conf >/dev/null
	printf "[General]\nInputMethod=qtvirtualkeyboard\n" | sudo tee /etc/sddm.conf.d/virtualkbd.conf >/dev/null
	sudo sed -i 's|^ConfigFile=.*|ConfigFile=$(SDDM_ASTRONAUT_THEME)|' /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
