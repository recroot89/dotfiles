# Dotfiles

Personal dotfiles for my development environments.

## Getting started

Clone the repository:

```sh
git clone git@github.com:recroot89/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### CachyOS + Niri setup

```sh
make fisher-install
make packages-install
make setup-configs
```

Or at once:

```sh
make cachyos-setup
```

### Neovim setup

```sh
make nvim-setup
make setup-lazygit
make setup-mcp
make setup-opencode
```

Or at once:

```sh
make setup-all
```

### macOS setup

```sh
make dotfiles-install
```

### dependencies setup

```sh
make asdf-install # only for macOS
make deps-gem
make deps-npm
make deps-pip
```

Or at once:

```sh
make deps
```

Current local overrides:

- keyboard layout: `us,ru`
- layout switch: `ctrl + space`
- `caps lock` as `ctrl`
- per-window keyboard layout tracking

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
