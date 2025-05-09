all: install nvim-install deps

TAGS := all

dotfiles-install:
	touch $(CURDIR)/files/my_aliases
	ln -snf $(PWD)/files/aliases ~/.aliases
	ln -snf $(PWD)/files/my_aliases ~/.my_aliases
	ln -snf $(PWD)/files/tmux.conf ~/.tmux.conf
	ln -snf $(PWD)/files/zshrc ~/.zshrc
	ln -snf $(PWD)/files/pryrc ~/.pryrc
	ln -snf $(PWD)/files/deps.edn ~/.clojure/

nvim-install:
	mkdir -p ~/.config/nvim
	ln -snf $(PWD)/files/vimrc ~/.config/nvim/init.vim
	ln -snf $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json

nvim-clean:
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0

lazyvim-install:
	ln -snf $(PWD)/nvim ~/.config/nvim

reinstall: nvim-clean lazyvim-install

setup-lazygit:
	ln -snf $(PWD)/files/lazygit/config.yml ~/.config/lazygit/config.yml

deps: deps-gem deps-npm

deps-gem:
	gem install neovim
	gem install rubocop rubocop-rspec rubocop-rails rubocop-performance rubocop-rake
	gem install pry pry-theme awesome_print coderay
	gem install test-prof
	gem install brakeman reek
	gem install sorbet sorbet-runtime
	asdf exec gem install ruby-lsp

deps-npm:
	npm install -g neovim
	npm install -g eslint
	npm install -g eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-hooks
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard
	npm install -g yaml-language-server markuplint markdownlint-cli bash-language-server jsonlint
	# npm install -g prettier eslint eslint-plugin-import eslint-plugin-node
	# npx install-peerdeps -yg eslint-config-airbnb
	# npm install -g dockerfile-language-server-nodejs

# deprecated for Manjaro/Arch
deps-pip:
	pip3 install --upgrade pynvim
	pip3 install --upgrade vim-vint spellcheck yamllint codespell ansible-lint
	pip3 install --upgrade autopep8 flake8 bandit pytype

asdf-install:
	asdf update
	asdf plugin update --all
	asdf install nodejs 18.20.2
	asdf global nodejs 18.20.2
	asdf install ruby 3.2.2
	asdf global ruby 3.2.2
	asdf install yarn 1.22.19
	asdf global yarn 1.22.19
