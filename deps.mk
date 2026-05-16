asdf-install:
	asdf plugin add nodejs
	asdf plugin add ruby
	asdf install nodejs 22.14.0
	asdf set nodejs 22.14.0
	asdf install ruby 4.0.2
	asdf set ruby 4.0.2

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
	gem install slim_lint
	gem install rails-mcp-server

deps-npm:
	npm install -g neovim
	# Eslint and plugins
	npm install -g eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y
	npm install -g eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-promise eslint-config-prettier
	npm install -g eslint-plugin-prettier @typescript-eslint/eslint-plugin @typescript-eslint/parser prettier
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard markuplint
	# LSP and utilities
	npm install -g typescript typescript-language-server yaml-language-server bash-language-server
	npm install -g vscode-langservers-extracted jsonlint markdownlint-cli
	npm install -g mcp-hub

deps-pip:
	python -m venv .venv
	.venv/bin/pip install --upgrade pip
	.venv/bin/pip install pynvim
	.venv/bin/pip install vim-vint yamllint codespell autopep8 flake8
	.venv/bin/pip install bandit pytype spellcheck ansible-lint

deps: deps-gem deps-npm deps-pip
