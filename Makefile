include cachyos-niri.mk
include deps.mk

dotfiles-install:
	touch $(PWD)/files/my_aliases
	ln -snf $(PWD)/files/aliases ~/.aliases
	ln -snf $(PWD)/files/my_aliases ~/.my_aliases
	ln -snf $(PWD)/files/zshrc ~/.zshrc
	ln -snf $(PWD)/files/pryrc ~/.pryrc
	ln -snf $(PWD)/files/deps.edn ~/.clojure/

nvim-clean:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim

lazyvim-install:
	mkdir -p ~/.config && ln -snf $(PWD)/nvim ~/.config/

nvim-setup: nvim-clean lazyvim-install

setup-mcp:
	ln -snf $(PWD)/files/mcp/mcpservers.json ~/.config/mcphub/servers.json
	ln -snf $(PWD)/files/mcp/projects.yml ~/.config/mcp-server/projects.yml

setup-opencode:
	ln -snf $(PWD)/files/opencode.config.json ~/.config/opencode/config.json

setup-mise:
	mkdir -p $(HOME)/.config/mise
	ln -snf $(PWD)/files/mise/config.toml $(HOME)/.config/mise/config.toml

setup-all: nvim-setup setup-mcp setup-opencode setup-mise

bat-catppuccin:
	mkdir -p ~/.config/bat/themes \
	&& git clone https://github.com/catppuccin/bat ~/.config/bat/themes/catppuccin \
	&& bat cache --build

old-nvim-install:
	mkdir -p ~/.config/nvim
	ln -snf $(PWD)/files/vimrc ~/.config/nvim/init.vim
	ln -snf $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json
