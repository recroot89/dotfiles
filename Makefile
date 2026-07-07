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

setup-opencode:
	ln -snf $(PWD)/files/opencode.config.json ~/.config/opencode/config.json

setup-mise:
	mkdir -p $(HOME)/.config/mise
	ln -snf $(PWD)/files/mise/config.toml $(HOME)/.config/mise/config.toml

setup-mcp:
	test -f $(PWD)/files/mcp/projects.yml || cp $(PWD)/files/mcp/projects.example.yml $(PWD)/files/mcp/projects.yml
	test -f $(PWD)/files/mcp/mcp.json || cp $(PWD)/files/mcp/mcp.example.json $(PWD)/files/mcp/mcp.json
	mkdir -p $(HOME)/.config/rails-mcp
	ln -snf $(PWD)/files/mcp/projects.yml $(HOME)/.config/rails-mcp/projects.yml
	mkdir -p $(HOME)/.config/mcphub
	ln -snf $(PWD)/files/mcp/mcp.json $(HOME)/.config/mcphub/servers.json

setup-all: nvim-setup setup-opencode setup-mise setup-mcp

bat-catppuccin:
	mkdir -p ~/.config/bat/themes \
	&& git clone https://github.com/catppuccin/bat ~/.config/bat/themes/catppuccin \
	&& bat cache --build

old-nvim-install:
	mkdir -p ~/.config/nvim
	ln -snf $(PWD)/files/vimrc ~/.config/nvim/init.vim
	ln -snf $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json
