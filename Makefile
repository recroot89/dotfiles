all: nvim-install dotfiles-install

TAGS := all

PACKER_PATH=~/.local/share/nvim/site/pack/packer/start

prepare-nvim:
	sudo pacman -S the_silver_searcher bat fd

old-nvim-install:
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

nvim-install: nvim-clean nvim-setup

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
	pip3 install --upgrade vim-vint
	pip3 install --upgrade autopep8 flake8 bandit pytype

asdf-install:
	asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git || echo 0
	asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git || echo 0

	asdf install nodejs 16.1.0
	asdf global nodejs 16.1.0

	asdf install ruby 2.7.6
	asdf global ruby 2.7.6

	# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 || echo 0
	# asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git || echo 0
	# asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git || echo 0
	# asdf plugin-add java https://github.com/halcyon/asdf-java.git || echo 0
	# asdf plugin-add clojure https://github.com/halcyon/asdf-clojure.git || echo 0

	# asdf install erlang 23.1.1
	# asdf global erlang 23.1.1

	# asdf install elixir 1.11.2-otp-23
	# asdf global elixir 1.11.2

	# asdf install java openjdk-15
	# asdf global java openjdk-15

	# asdf install clojure 1.10.1
	# asdf global clojure 1.10.1
