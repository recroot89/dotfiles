## Requirements

* [Nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

#### Global

* [Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher)
* [fzf](https://github.com/junegunn/fzf)
* [bat](https://github.com/sharkdp/bat)
* [fd](https://github.com/sharkdp/fd)

#### Recommendations

* [Oh My Zsh!](https://github.com/ohmyzsh/ohmyzsh)

### Setup

```sh
$ git clone git@github.com:recroot89/dotfiles.git ~/dotfiles
$ cd dotfiles
$ make nvim-install
# install dotfiles for zsh and tmux
$ make dotfiles-install
# install additional packages for some languages (see Makefile)
$ make deps-all
# install asdf with plugins (see Makefile)
$ make asdf-install
```

### VIM

#### Main

* Switch ctrl and caps lock
* Use <kbd>ctrl + [</kbd> instead of <kbd>esc</kdb>

#### Moving between visible buffers

* `ctrl h` - move left or open new left split
* `ctrl l` - move right or open new right split
* `ctrl k` - move up or open new top split
* `ctrl j` - move down or open new bottom split
* `<leader> b` - show buffer list
* `ctrl 6` - switch between two nearby buffers

#### File Tree

* `<leader><leader>` - toggle filetree

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
* `]<leader>` and `[<leader>` – add  empty line  above and under cursor
* `<leader> d` – coc diagnostic
* `<leader> f` – format in visual mode (prettier)
* `<leader> fr` – search & replace
* `<leader> rn` – replace word under cursor in current file


#### Misc

* `:checkhealth provider` - Nvim health check
* `:PlugUpdate` - update plugins
* `:PlugUpgrade` - update Plug
* `:Gblame` - run git blame
* `:CocCommand java.updateLanguageServer` - coc-pyright
