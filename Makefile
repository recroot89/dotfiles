dotfiles-install:
	touch $(PWD)/files/my_aliases
	ln -snf $(PWD)/files/aliases ~/.aliases
	ln -snf $(PWD)/files/my_aliases ~/.my_aliases
	ln -snf $(PWD)/files/zshrc ~/.zshrc
	ln -snf $(PWD)/files/pryrc ~/.pryrc
	ln -snf $(PWD)/files/deps.edn ~/.clojure/

nvim-clean:
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0

lazyvim-install:
	mkdir -p ~/.config && ln -snf $(PWD)/nvim ~/.config/

nvim-setup: nvim-clean lazyvim-install

setup-mcp:
	ln -snf $(PWD)/files/mcp/mcpservers.json ~/.config/mcphub/servers.json
	ln -snf $(PWD)/files/mcp/rails_mcp_projects.yml ~/.config/rails-mcp/projects.yml

setup-lazygit:
	@if [ "$$(uname)" = "Linux" ]; then \
		ln -snf $(PWD)/files/lazygit_config.yml $$HOME/.config/lazygit/config.yml; \
	elif [ "$$(uname)" = "Darwin" ]; then \
		ln -snf $(PWD)/files/lazygit_config.yml "$$HOME/Library/Application Support/lazygit/config.yml"; \
	else \
		echo "Unsupported OS: $$(uname)"; \
	fi

asdf-install:
	asdf plugin add nodejs
	asdf plugin add ruby
	asdf install nodejs 22.14.0
	asdf set nodejs 22.14.0
	asdf install ruby 3.2.2
	asdf set ruby 3.2.2

deps-gem:
	gem install neovim
	# RuboCop and extensions
	gem install rubocop rubocop-rspec rubocop-rails rubocop-performance
	gem install rubocop-rake rubocop-minitest
	# Interactivity
	gem install pry pry-theme awesome_print coderay
	# Testing and profiling
	gem install test-prof
	# Code analysis
	gem install brakeman reek
	# LSP + types
	gem install sorbet sorbet-runtime ruby-lsp
	asdf exec gem install ruby-lsp

deps-yarn:
	yarn global add neovim
	# Eslint and plugins
	yarn global add eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y
	yarn global add eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-promise eslint-config-prettier
	yarn global add eslint-plugin-prettier @typescript-eslint/eslint-plugin @typescript-eslint/parser prettier
	# Stylelint
	yarn global add stylelint stylelint-config-recommended stylelint-config-standard markuplint
	# LSP and utilities
	yarn global add typescript typescript-language-server yaml-language-server bash-language-server
	yarn global add vscode-langservers-extracted jsonlint markdownlint-cli

deps-pip:
	python -m venv .venv
	.venv/bin/pip install --upgrade pip
	# Neovim integration
	.venv/bin/pip install pynvim
	# Linting and formatting
	.venv/bin/pip install vim-vint yamllint codespell autopep8 flake8
	# Security and type checking
	.venv/bin/pip install bandit pytype
	# Spell checking
	.venv/bin/pip install spellcheck
	# Infrastructure as code
	.venv/bin/pip install ansible-lint

deps: deps-gem deps-yarn deps-pip

bat-catppuccin:
	mkdir -p ~/.config/bat/themes \
	&& git clone https://github.com/catppuccin/bat ~/.config/bat/themes/catppuccin \
	&& bat cache --build

old-nvim-install:
	mkdir -p ~/.config/nvim
	ln -snf $(PWD)/files/vimrc ~/.config/nvim/init.vim
	ln -snf $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json
