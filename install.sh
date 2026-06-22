#!/usr/bin/env bash

set -Eeuo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly DOTFILES_DIR
readonly ZSH_DIR="$HOME/.oh-my-zsh"
readonly ZSH_CUSTOM_DIR="$ZSH_DIR/custom"

log() {
  printf '\n==> %s\n' "$*"
}

warn() {
  printf 'Warning: %s\n' "$*" >&2
}

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

as_root() {
  if (( EUID == 0 )); then
    "$@"
  elif command -v sudo >/dev/null 2>&1; then
    sudo "$@"
  else
    die "sudo is required to install system packages"
  fi
}

install_macos_packages() {
  local formulae=(
    actionlint ansible automake awscli bat bison checkmake cmake composer
    coreutils fd fzf gcc gh git git-delta git-filter-repo gnu-sed gnupg
    hadolint htop httpie imagemagick kubernetes-cli lazygit libffi libiconv
    libsass luarocks mise ncdu neovim nmap openjdk pandoc php@8.3 pkgconf
    postgresql@14 postgresql@15 re2c redis ripgrep rlwrap tesseract
    the_silver_searcher tldr tmux wget
    zsh make curl autoconf openssl@3 readline libyaml gmp
  )
  local casks=(
    font-inconsolata
    font-roboto-mono-nerd-font
    font-symbols-only-nerd-font
    ghostty
    localsend
    maccy
    ngrok
    qview
    visual-studio-code
  )

  if ! command -v brew >/dev/null 2>&1; then
    log "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ -x /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  fi

  log "Installing macOS packages"
  brew install "${formulae[@]}"
  brew install derailed/k9s/k9s
  brew install --cask "${casks[@]}"
}

install_arch_packages() {
  log "Installing Arch Linux packages"
  as_root pacman -Syu --needed --noconfirm \
    zsh git make curl base-devel mise \
    fzf the_silver_searcher bat fd ripgrep lazygit nmap k9s \
    postgresql-libs zip unzip xclip \
    autoconf openssl readline libyaml zlib xz tk ncurses
}

install_apt_packages() {
  log "Installing Debian/Ubuntu packages"
  as_root apt-get update
  as_root apt-get install -y \
    zsh git make curl ca-certificates build-essential \
    fzf silversearcher-ag bat fd-find ripgrep nmap \
    postgresql-client zip unzip xclip \
    autoconf libssl-dev libreadline-dev libyaml-dev zlib1g-dev \
    libffi-dev libgdbm-dev libdb-dev libsqlite3-dev libbz2-dev \
    liblzma-dev tk-dev libncurses-dev

  if apt-cache show lazygit >/dev/null 2>&1; then
    as_root apt-get install -y lazygit
  else
    warn "lazygit is unavailable in this apt repository; skipping"
  fi

  warn "k9s is not installed automatically on apt-based systems"
}

install_dnf_packages() {
  log "Installing Fedora/RHEL packages"
  as_root dnf install -y \
    zsh git make curl gcc gcc-c++ patch autoconf \
    fzf the_silver_searcher bat fd-find ripgrep nmap \
    postgresql zip unzip xclip \
    openssl-devel readline-devel libyaml-devel zlib-devel \
    libffi-devel gdbm-devel libdb-devel sqlite-devel bzip2-devel \
    xz-devel tk-devel ncurses-devel

  warn "lazygit and k9s are not installed automatically on dnf-based systems"
}

install_system_packages() {
  case "$(uname -s)" in
    Darwin)
      install_macos_packages
      ;;
    Linux)
      if command -v pacman >/dev/null 2>&1; then
        install_arch_packages
      elif command -v apt-get >/dev/null 2>&1; then
        install_apt_packages
      elif command -v dnf >/dev/null 2>&1; then
        install_dnf_packages
      else
        die "supported Linux package manager not found (pacman, apt, or dnf)"
      fi
      ;;
    *)
      die "unsupported operating system: $(uname -s)"
      ;;
  esac
}

install_mise() {
  export PATH="$HOME/.local/bin:$PATH"

  if command -v mise >/dev/null 2>&1; then
    return
  fi

  log "Installing mise"
  curl -fsSL https://mise.run | sh
  command -v mise >/dev/null 2>&1 || die "mise installation failed"
}

install_oh_my_zsh() {
  if [[ ! -d "$ZSH_DIR" ]]; then
    log "Installing Oh My Zsh"
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
      "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
      "" --unattended
  fi
}

install_zsh_plugin() {
  local name="$1"
  local repository="$2"
  local target="$ZSH_CUSTOM_DIR/plugins/$name"

  if [[ -d "$target" ]]; then
    log "$name is already installed"
    return
  fi

  log "Installing $name"
  git clone --depth 1 "$repository" "$target"
}

create_debian_command_aliases() {
  [[ "$(uname -s)" == Linux ]] || return
  command -v apt-get >/dev/null 2>&1 || return

  mkdir -p "$HOME/.local/bin"
  if command -v batcat >/dev/null 2>&1; then
    ln -snf "$(command -v batcat)" "$HOME/.local/bin/bat"
  fi
  if command -v fdfind >/dev/null 2>&1; then
    ln -snf "$(command -v fdfind)" "$HOME/.local/bin/fd"
  fi
}

main() {
  install_system_packages
  install_mise
  install_oh_my_zsh

  mkdir -p "$ZSH_CUSTOM_DIR/plugins"
  install_zsh_plugin \
    zsh-syntax-highlighting \
    https://github.com/zsh-users/zsh-syntax-highlighting.git
  install_zsh_plugin \
    zsh-autosuggestions \
    https://github.com/zsh-users/zsh-autosuggestions.git

  create_debian_command_aliases

  log "Linking dotfiles"
  mkdir -p "$HOME/.clojure"
  make -C "$DOTFILES_DIR" dotfiles-install

  log "Installing mise tools"
  make -C "$DOTFILES_DIR" mise-install

  log "Installation completed"
  printf 'Restart the terminal or run: exec zsh\n'
}

main "$@"
