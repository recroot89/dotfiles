# Dotfiles

Personal shell, Neovim, runtime, and development-tool configuration. Shared configuration is installed with symlinks; platform-specific setup remains in separate Makefile targets.

## Requirements

- Git
- Make
- Zsh
- [mise](https://mise.jdx.dev/)

## Installation

Clone the repository:

```sh
git clone git@github.com:recroot89/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run the automated bootstrap on macOS, Arch Linux, Debian/Ubuntu, or Fedora/RHEL:

```sh
./install.sh
```

The same setup can be run manually with the targets below.

Install the shared shell configuration:

```sh
make dotfiles-install
```

Link the global `mise` configuration and install its runtimes:

```sh
make mise-install
exec zsh
```

Install Neovim and application configuration:

```sh
make nvim-setup
make setup-mcp
make setup-opencode
```

`setup-mcp` creates local MCP configuration from `files/mcp/*.example.*` only when the real files are missing. Keep real project paths and private server configuration in `files/mcp/projects.yml` and `files/mcp/mcp.json`; those files are ignored by git.

Or run all shared setup targets:

```sh
make setup-all
```

> [!WARNING]
> `nvim-setup` and `setup-all` delete the current Neovim configuration, data, state, and cache before creating the symlink.

Install language-specific packages after the `mise` runtimes are active:

```sh
make deps
```

The dependency groups can also be installed separately:

```sh
make deps-gem
make deps-npm
make deps-pip
make deps-mix
```

### CachyOS + Niri

Run the platform-specific setup individually:

```sh
make fisher-install
make packages-install
make setup-configs
```

Or run the complete setup:

```sh
make cachyos-setup
```

Current desktop overrides:

- keyboard layout: `us,ru`
- layout switch: `ctrl + space`
- `caps lock` as `ctrl`
- per-window keyboard layout tracking

## Make targets

| Target | Purpose |
| --- | --- |
| `dotfiles-install` | Link Zsh, aliases, Pry, and Clojure configuration |
| `setup-mise` | Link `~/.config/mise/config.toml` |
| `mise-install` | Link the config and install all declared runtimes |
| `nvim-setup` | Reset Neovim state and link this repository's configuration |
| `setup-mcp` | Create local MCP config from examples and link it into `~/.config` |
| `setup-all` | Run shared Neovim and application setup |
| `deps` | Install Ruby, npm, Python, and Elixir development packages |
| `cachyos-setup` | Run the complete CachyOS + Niri setup |

## Notes

- Prefer symlinks over copying config files.
- Do not commit generated files.
- Do not commit runtime state.
- Keep platform-specific setup separated by Makefile targets.
- Keep defaults from CachyOS/niri unless there is a clear reason to override them.

## Useful links

- [Used Tools](./Tools.md)
- [Git Oh My Zsh aliases](https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index)
- [LazyVim default keymaps](https://www.lazyvim.org/keymaps)
- [Telescope default mappings](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings)

## Keybindings

### Moving between visible buffers

- `<ctrl> h` — move left or open new left split
- `<ctrl> l` — move right or open new right split
- `<ctrl> k` — move up or open new top split
- `<ctrl> j` — move down or open new bottom split
- `<leader> be` — toggle buffer explorer
- `<shift> h` — previous buffer
- `<shift> l` — next buffer
- `<ctrl> 6` — switch between two nearby buffers

### Searching

- `<leader><leader>` — search files
- `<ctrl><n/p>` — next/previous item in the search window
- `<ctrl><j/k>` — next/previous item in the search window
- `<ctrl><b>` — scroll up the item preview
- `<ctrl><f>` — scroll down the item preview

### Code editing and navigation

- `gcc` — toggle comment
- `gd` — go to definition
- `]c` and `[c` — go through diagnostics
- `g;` — go to the last edited line in the current buffer
- `gS` — convert one-line expression to multiline
- `gv` — reselect last visual selection
- `<ctrl> n` — insert next matching word
- `<leader> f` — format visual selection
- `<leader> fr` — search and replace
- `<leader> rn` — rename word under cursor in current file
