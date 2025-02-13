#!/usr/bin/env bash

ZSH_PATH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

if [ ! -d ${ZSH_PATH} ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
fi
make dotfiles-install

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting || echo 0
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions || echo 0

git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.13.1 || echo 0

asdf plugin add ruby
asdf plugin add nodejs

make asdf-install

sudo pacman -S fzf the_silver_searcher bat fd postgresql-libs
sudo pacman -S zip unzip xclip ripgrep lazygit
sudo pacman -S nmap
