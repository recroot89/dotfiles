TAGS := all

nvim-install:
	ansible-playbook nvim.yml -i local -vvv -e curdir=$(CURDIR) -K

dotfiles-install:
	ansible-playbook dotfiles.yml -i local -vvv -e curdir=$(CURDIR) -K

deps-all: deps-gem deps-npm deps-pip

deps-gem:
	gem install solargraph rubocop neovim
	gem install rubocop-rspec rubocop-rails rubocop-performance

deps-npm:
	npm install -g neovim
	npm install -g prettier eslint babel-eslint eslint-plugin-import eslint-plugin-node
	npx install-peerdeps -g eslint-config-airbnb
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard

deps-pip:
	pip2 install --upgrade pynvim
	pip3 install --upgrade pynvim

asdf-install:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 || echo 0
	asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git || echo 0
	asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git || echo 0
	asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git || echo 0
	asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git || echo 0
	asdf plugin-add java https://github.com/halcyon/asdf-java.git || echo 0
	asdf plugin-add clojure https://github.com/halcyon/asdf-clojure.git || echo 0

	bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
	asdf install nodejs 14.10.0
	asdf global nodejs 14.10.0

	asdf install erlang 23.0.4
	asdf global erlang 23.0.4

	asdf install elixir 1.10.4-otp-23
	asdf global elixir 1.10.4

	asdf install ruby 2.7.2
	asdf global ruby 2.7.2

	asdf install java openjdk-15
	asdf global java openjdk-15

	asdf install clojure 1.10.1
	asdf global clojure 1.10.1
