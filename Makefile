all: nvim-install dotfiles-install

TAGS := all

PACKER_PATH=~/.local/share/nvim/site/pack/packer/start
ZSH_PLUGINS_PATH=~/.oh-my-zsh/plugins

prepare-nvim:
	sudo pacman -S the_silver_searcher bat fd

nvim-install:
	ansible-playbook nvim.yml -i local -vvv -e curdir=$(CURDIR) -K

nvim-clean:
	rm -rf nvim/plugin || exit 0
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0
	rm -rf $(PACKER_PATH) || exit 0

nvim-setup:
	mkdir -p $(PACKER_PATH)
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(PACKER_PATH)/packer.nvim
	ln -snf $(PWD)/nvim ~/.config/nvim
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

new-nvim-install: nvim-clean nvim-setup

dotfiles-install:
	touch $(CURDIR)/files/my_aliases
	ansible-playbook dotfiles.yml -i local -vvv -e curdir=$(CURDIR) -K

deps: deps-gem deps-npm deps-pip

deps-gem:
	gem install solargraph rubocop neovim
	gem install rubocop-rspec rubocop-rails rubocop-performance rubocop-rake
	gem install sorbet sorbet-runtime
	gem install haml_lint slim_lint
	gem install brakeman reek

deps-npm:
	npm install -g neovim
	npm install -g prettier eslint @babel/eslint-parser eslint-plugin-import eslint-plugin-node
	npx install-peerdeps -g eslint-config-airbnb
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard
	npm install -g yaml-language-server markdownlint bash-language-server
	npm install -g dockerfile-language-server-nodejs

deps-pip:
	pip3 install --upgrade pynvim
	pip3 install --upgrade vim-vint spellcheck yamllint codespell
	pip3 install --upgrade autopep8 flake8 bandit pytype

asdf-setup:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1 || echo 0
	asdf plugin add ruby
	asdf plugin add nodejs

asdf-install:
	asdf update
	asdf plugin update --all
	asdf install nodejs latest
	asdf global nodejs latest
	asdf install ruby latest
	asdf global ruby latest

zsh-setup:
	sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(ZSH_PLUGINS_PATH)/zsh-syntax-highlighting
	sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(ZSH_PLUGINS_PATH)/zsh-autosuggestions
