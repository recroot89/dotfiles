## Requirements

* [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
* [Zsh](https://wiki.archlinux.org/title/zsh)

### Global install

* [Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher)
* [fzf](https://github.com/junegunn/fzf)
* [bat](https://github.com/sharkdp/bat)
* [fd](https://github.com/sharkdp/fd)

### Recommendations

* [Oh My Zsh!](https://github.com/ohmyzsh/ohmyzsh)
* [Nerd Fonts](https://www.nerdfonts.com/)

### Getting started

```sh
git clone git@github.com:recroot89/dotfiles.git ~/dotfiles
cd ~/dotfiles
make dotfiles-install
make deps
make lazyvim-install
```

### LazyVim

* [Default keymaps](https://www.lazyvim.org/keymaps)

#### System

* Switch `ctrl` and `caps lock`
* Use <kbd>ctrl + [</kbd> instead of <kbd>esc</kdb>

#### Moving between visible buffers

* `<ctrl> h` - move left or open new left split
* `<ctrl> l` - move right or open new right split
* `<ctrl> k` - move up or open new top split
* `<ctrl> j` - move down or open new bottom split
* `<leader> be` - toggle buffer explorer
* `<shift> h` - prev buffer
* `<shift> l` - next buffer
* `<ctrl> 6` - switch between two nearby buffers

#### File Tree

* `<leader>e` - toggle neo-tree

#### Searching [Telescope default mappings](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings)

* `<leader><leader>` - search files (git files)
* `<ctrl><n/p>` - next/previous item in the search window
* `<ctrl><j/k>` - next/previous item in the search window
* `<ctrl><b>` - scroll up the item preview in the search window
* `<ctrl><f>` - scroll down the item preview in the search window

#### Code editing and navigation

* `gcc` - toggle commenting
* `gj` - navigate through blocks of code - (), {}, [], etс
* `gf` - open a file corresponding to a word under the cursor
* `gd` - go to definition
* `]с` and `[с` - go through linter errors
* `g;` – go to the last edited line in the current opened buffer
* `gS` – convert oneline expression to multiline (useful for functions, arguments, data structures)
* `gv` – reselect last visual selection
* `<ctrl> n` – insert next matching word (multicursor)
* `]g` and `[g` – go through linter errors
* `"y` & `"p` – copy text to system clipboard
* `<leader> f` – format in visual mode (prettier)
* `<leader> fr` – search & replace
* `<leader> rn` – replace word under cursor in current file

#### Misc

* `<leader>l` - toggle lazy menu

To install useful keybindings and fuzzy completion:
    $HOMEBREW_PREFIX/opt/fzf/install

To use fzf in Vim, add the following line to your .vimrc:
    set rtp+=$HOMEBREW_PREFIX/opt/fzf
