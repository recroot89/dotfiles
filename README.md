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
* [Nerd Fonts](https://www.nerdfonts.com/) (fonts and icons for LazyVim)

### Setup configuration

```sh
$ git clone git@github.com:recroot89/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
# install dotfiles, oh-my-zh and asdf with plugins
$ make install
# install packages for Arch/Manjaro
$ make prepare-os
# install additional packages (see Makefile)
$ make deps
# nvim with old configuration (Plug)
$ make nvim-install
# nvim with new configuration (LazyVim)
$ make lazyvim-install
```

### LazyVim (New configuration)

* [Keymaps](https://www.lazyvim.org/keymaps)

### Vim (Old configuration)

#### Main

* Switch `ctrl` and `caps lock`
* Use <kbd>ctrl + [</kbd> instead of <kbd>esc</kdb>

#### Moving between visible buffers

* `<ctrl> h` - move left or open new left split
* `<ctrl> l` - move right or open new right split
* `<ctrl> k` - move up or open new top split
* `<ctrl> j` - move down or open new bottom split
* `<leader> b` - show buffer list
* `<ctrl> 6` - switch between two nearby buffers

#### File Tree

* `<leader><leader>` - toggle filetree
* `<ctrl> n` - run NERDTreeFind

#### Searching

* `<leader> o` - fuzzy search (files under git)
* `<leader> ff` - fuzzy search (all files)
* `<leader> fa` - fuzzy search (content in files)
* `<leader> fc` - fuzzy search (git commits)

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
* `]<leader>` and `[<leader>` – add empty line above and under cursor
* `<leader> d` – coc diagnostic
* `<leader> f` – format in visual mode (prettier)
* `<leader> fr` – search & replace
* `<leader> rn` – replace word under cursor in current file

#### Misc

* `:checkhealth provider` - nvim health check
* `:PlugUpdate` - update plugins
* `:PlugClean | PlugUpdate` - cleanup and update plugins (if errors appear)
* `:PlugUpgrade` - update Plug
* `:CocCommand java.updateLanguageServer` - coc-pyright
* `<leader> gb` – Git blame
* `<ctrl> p` – run Markdown preview
