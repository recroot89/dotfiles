# Exceptions and migration status

These entries retain their current manager or project dependency files. “Unverified” means the migration has not been
validated; it does not mean mise cannot support the software. Existing installations are retained unless a verified replacement
is recorded below.

## Project dependencies and language additions

| Addition | Why it stays outside the global mise tool list |
| --- | --- |
| `awesome_print`, `coderay`, `test-prof`, `sorbet-runtime` | Libraries loaded by applications belong in their Gemfile; isolated CLI installations do not make them importable by the project's Ruby. |
| `rubocop-rspec`, `rubocop-rails`, `rubocop-performance`, `rubocop-rake`, `rubocop-minitest` | Keep RuboCop and its plugins together in the project's Gemfile. The official gem backend documentation recommends `bundle exec rubocop` for this case. |
| ESLint configs/plugins: Airbnb, import, jsx-a11y, React, React Hooks, promise, Prettier, TypeScript ESLint/parser | Keep the compatible module group in the project's package.json. Separate native npm entries do not create the project's module environment. Global ESLint stays at 8.57.1 for existing Airbnb 19 projects. |
| `stylelint-config-standard`, `stylelint-config-recommended` | Configuration modules belong in the project's package.json alongside Stylelint. |
| Hex, Phoenix `phx_new`, Sobelow, `mix_audit` | Keep the existing Mix setup. No native archive/escript installer has been verified. Elixir, Erlang and Rebar3 are managed by mise; Mix uses the selected Rebar3 through `MIX_REBAR3`. |
| TLint (`tightenco/tlint`) | Keep its current Composer installation. A native Composer backend or appropriate standalone TLint artifact has not been verified. It is not recreated by a PHP installation hook. |
| Fisher and Fish plugins | Keep Fisher's plugin management. The optional mise environment links Fish configuration; a fresh Fish setup still needs [Fisher](https://github.com/jorgebucaran/fisher#installation), followed by `fisher update`. |

The [gem backend](https://mise.jdx.dev/dev-tools/backends/gem.html) isolates each tool's gems and recommends Bundler for project plugins.
The [npm backend](https://mise.jdx.dev/dev-tools/backends/npm.html) likewise isolates CLI tools and recommends project dependency files
for an application's modules. Neither documents a shared extra-dependencies option comparable to the Python backend's `with`.

The [Elixir documentation](https://mise.jdx.dev/lang/elixir.html#hex-rebar-and-mix-archives) describes per-version `MIX_HOME`,
`MIX_ARCHIVES` and escript paths. It describes installing Hex and Rebar after changing Elixir versions, but this setup now supplies Rebar3
natively. No native archive/escript installation option is documented. The remaining additions are not automatically recreated after an upgrade.
[Mix supports `MIX_REBAR3`](https://mix.hexdocs.pm/Mix.html#module-environment-variables) to select an external Rebar executable.

## Existing applications and services

| Software | Remaining migration work |
| --- | --- |
| Bitwarden, CodexBar, Maccy, existing fonts | Native mise installation is declared; existing Homebrew ownership has not been transferred. |
| PHP-FPM | PHP/Composer CLI is managed by mise; the launchd service retains its original Homebrew configuration/extensions. |
| PostgreSQL 14/15, Redis | Migrate data, extensions and services separately. PostgreSQL 15 was running when this inventory was taken. |
| Homebrew JDK | mise selects Java 21; system Java/IDE integration needs checking before the old JDK can be removed. |
| Git, Python 3.12, native libraries | Their existing system/dependency roles need checking before removal; these are not the selected development runtimes. |
| `gnu-sed`, `nmap`, `p7zip`, `rlwrap`, `tesseract`, `vips`, `luarocks` | Keep the existing manager until binary compatibility, dependencies and installation have been validated. See native candidates below. |
| Fish, Niri, SDDM, desktop utilities and fonts on Linux | Keep system shell/session integration and distribution packages with the OS manager. |
| Other prior setup packages: `gnupg`, `imagemagick`, `automake`, `gcc`, `make`, `zsh`, `zip`, `unzip`, `xclip`, `libpq` | Their OS/build, shell, desktop, database-client or native-library roles have not all been migrated. Keep existing installations; native CLI alternatives need separate compatibility and dependent-library checks. |
| Other DMG applications | Retain the existing installation until the native installer has been checked. |

The [native cask installer](https://mise.jdx.dev/bootstrap/packages/brew-cask.html#casks-installed-by-homebrew) leaves Homebrew-owned
casks alone. Declaring an app differs from transferring ownership. The first-party
[CodexBar cask](https://github.com/Homebrew/homebrew-cask/blob/master/Casks/c/codexbar.rb) declares an app and helper binary;
the [Maccy cask](https://github.com/Homebrew/homebrew-cask/blob/master/Casks/m/maccy.rb) declares an app with its own updater.
These artifact types are supported by mise. Linux installation has not been run on a Linux host.

## System prerequisites

Build dependencies supply compiler/linker inputs or host integration. Installing a mise runtime does not eliminate those host
requirements. The [gem backend requirements](https://mise.jdx.dev/dev-tools/backends/gem.html#requirements) explicitly include native
build dependencies when needed.

On macOS, install the fallback file directly:

```sh
brew bundle --file=Brewfile
```

`Brewfile` is not called by a mise task or hook. It records host libraries and source-build tools,
including libyaml and libffi, that retain their Homebrew role.

On Linux, install system shells, compilers, native libraries and desktop components through the distribution.
For example, Ruby/PHP source-build prerequisites on Arch/CachyOS:

```sh
sudo pacman -Syu --needed base-devel autoconf bison re2c pkgconf \
  libxml2 openssl icu libzip oniguruma freetype2 libjpeg-turbo libpng \
  libwebp gmp libsodium readline bzip2 libyaml zlib xz tk ncurses
```

Debian/Ubuntu:

```sh
sudo apt install build-essential autoconf bison re2c pkg-config \
  libxml2-dev libssl-dev libicu-dev libzip-dev libonig-dev libcurl4-openssl-dev \
  libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev libgmp-dev libsodium-dev \
  libreadline-dev libbz2-dev libyaml-dev zlib1g-dev libffi-dev libsqlite3-dev
```

Fedora:

```sh
sudo dnf install gcc gcc-c++ make autoconf bison re2c pkgconf \
  libxml2-devel openssl-devel libicu-devel libzip-devel oniguruma-devel libcurl-devel \
  libpng-devel libjpeg-turbo-devel freetype-devel libwebp-devel gmp-devel \
  libsodium-devel readline-devel bzip2-devel libyaml-devel zlib-devel libffi-devel
```

## Linux desktop prerequisites

Install the distribution components directly on Arch/CachyOS when needed:

```sh
sudo pacman -Syu --needed niri wl-clipboard docker docker-compose \
  ttf-jetbrains-mono-nerd ttf-roboto-mono-nerd noto-fonts noto-fonts-emoji \
  gnome-disk-utility nwg-look papirus-icon-theme cliphist
```

Install `sddm-astronaut-theme` through your AUR helper before applying `mise -E linux,sddm bootstrap files apply`.
The optional `sddm` environment manages the two `/etc/sddm.conf.d/` files natively; it does not install the theme or restart the session.
The [upstream metadata](https://github.com/Keyitdev/sddm-astronaut-theme/blob/master/metadata.desktop) already selects
`Themes/astronaut.conf`, so no vendor-file rewrite is needed for a default theme installation. If a previous manual customization
selected another variant in that metadata, it remains selected. Fish itself comes from the OS package manager.
Niri settings use `us,ru`, Ctrl+Space, Caps as Ctrl and per-window layout. Ghostty on Linux uses a community AppImage from
[pkgforge-dev](https://github.com/pkgforge-dev/ghostty-appimage), linked by
[Ghostty's installation documentation](https://ghostty.org/docs/install/binary); macOS uses mise's native app installer.

## Native capabilities verified

Checked with mise 2026.11.5 on macOS ARM64, 2026-11-15:

| Capability | Result and source |
| --- | --- |
| Native bootstrap | `mise -E macos bootstrap` applies declared repositories, dotfiles and tools; its final task rebuilds bat's cache. No installation wrapper is needed. [Bootstrap order](https://mise.jdx.dev/bootstrap.html#how-it-runs). |
| Private configuration | `create_if_missing` seeds aliases and MCP paths. It leaves existing files, contents, permissions and symlinks alone. Existing private repository files remain ignored and linked; fresh machines keep private files at their user paths. [Managed files](https://mise.jdx.dev/dotfiles/managed.html#create-a-file-only-if-it-is-missing). |
| System configuration | The optional `mise.sddm.toml` declares directories and files with Linux selectors and permissions, replacing shell commands. Temporary-directory creation and repeat application were verified; Linux session behavior remains untested. [System files](https://mise.jdx.dev/bootstrap/files.html). |
| Rebar3 | `rebar` installs `github:erlang/rebar3` 3.28.0. The deferred env value `MIX_REBAR3` uses the selected tool path; Mix availability and execution were checked on OTP 29. [Tool paths in env](https://mise.jdx.dev/environments/#use-values-that-tools-set), [Mix override](https://mix.hexdocs.pm/Mix.html#module-environment-variables), [releases](https://github.com/erlang/rebar3/releases). |
| Native conda tools | `conda:ncdu` 2.9.2, `conda:wget` 1.25.0 and macOS `conda:btop` 1.4.8 were installed and their commands executed. The old Homebrew ncdu/wget copies were removed after checking dependents. The existing Linux btop declaration remains on its release backend. mise solves/downloads conda packages itself without installing or invoking conda, mamba or Homebrew. [Native backend](https://mise.jdx.dev/dev-tools/backends/conda.html), [ncdu builds](https://anaconda.org/conda-forge/ncdu), [wget builds](https://anaconda.org/conda-forge/wget), [btop builds](https://anaconda.org/conda-forge/btop). |
| GNU commands and editor search | `conda:gnu-coreutils` 9.12 on macOS preserves `gdate`, `greadlink`, `grealpath`, `gtimeout` and the other GNU-prefixed commands. Standard BSD names still resolve to `/bin`. `conda:the_silver_searcher` 2.2.0 provides `ag`; search output was compared with the old version. Both Homebrew copies were removed after checking installed dependents. [GNU recipe](https://github.com/conda-forge/coreutils-feedstock/blob/main/recipe/recipe.yaml), [ag builds](https://anaconda.org/conda-forge/the_silver_searcher/files). |
| Editor installers | The unused `luarocks.nvim`/dkjson setup was removed. Lazy's `rocks.enabled = false` prevents its fallback Lua/LuaRocks installer; Mason remains disabled. A headless startup with installed plugins and native providers passed. [LuaRocks plugin build](https://github.com/vhyrro/luarocks.nvim#how-it-works), [Lazy configuration](https://lazy.folke.io/configuration). |
| Clean configuration bootstrap | In a temporary checkout without global config or private files, native bootstrap cloned all four repositories, linked configs, seeded private files and built bat's theme cache. Installed runtimes were reused. The cache action is one task with native `bat:cache` alias. [Task aliases](https://mise.jdx.dev/tasks/task-configuration.html#alias). |

Further replacement candidates stay unverified:

- `7zip` resolves to `aqua:ip7z/7zip` (also `github:ip7z/7zip`). Check required `7z`/`7za`/`7zz` commands before removing p7zip.
- `conda:sed` provides GNU sed on macOS ARM64/Linux, installed as `sed`; Homebrew exposes `gsed` on macOS. Check command names
  and PATH behavior before migrating. [Conda package](https://anaconda.org/conda-forge/sed),
  [build recipe](https://github.com/conda-forge/sed-feedstock/blob/main/recipe/build.sh),
  [Homebrew naming](https://github.com/Homebrew/homebrew-core/blob/master/Formula/g/gnu-sed.rb).

Registry shorthands are listed in the [official registry](https://mise.jdx.dev/registry.html). Registry absence alone does not establish
that an explicit GitHub, HTTP, conda or plugin backend cannot install a tool. The [HTTP backend](https://mise.jdx.dev/dev-tools/backends/http.html)
requires an explicit version-list source for `latest` and version prefixes; a fixed download URL by itself does not track releases.

## ngrok migration

The macOS bootstrap installs ngrok through mise. mise 2026.11.7 fixed prefix expansion in the
[ngrok cask](https://formulae.brew.sh/cask/ngrok)'s generated completion commands. A clean installation and zsh completion were
verified on macOS ARM64 with mise 2026.11.12. [mise release notes](https://github.com/jdx/mise/releases/tag/v2026.11.7)
