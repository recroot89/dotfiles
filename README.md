# Dotfiles

Shared macOS/Linux config: Zsh, optional Fish, Ghostty, Niri and LazyVim.
Tools, supported apps, Git repositories and configuration are managed natively by mise.
[Exceptions and system prerequisites](EXCEPTIONS.md) are listed separately.

## Install mise

Use mise **2026.11.7+**. Choose your OS:

| OS | Install |
| --- | --- |
| macOS | `brew install mise` |
| Arch / CachyOS | `sudo pacman -S mise` |
| Debian / Ubuntu | `sudo apt install extrepo && sudo extrepo enable mise && sudo apt update && sudo apt install mise` |
| Fedora | `sudo dnf copr enable jdxcode/mise && sudo dnf install mise` |

[Official installation docs](https://mise.jdx.dev/installing-mise.html).

## Setup

Clone the repository, install any [missing prerequisites](EXCEPTIONS.md#system-prerequisites), then:

```sh
cd ~/Projects/dotfiles
mise trust
mise -E macos bootstrap --dry-run
mise -E macos bootstrap
```

Use `-E linux` on Linux. Add `desktop` for Niri or `fish` for Fish, e.g. `-E linux,desktop,fish`.
After installing SDDM and its Astronaut theme, opt in with `mise -E linux,sddm bootstrap files apply`.
The bootstrap/dotfiles features are experimental and enabled in this checkout.

Config files are symlinks into this repository; edits take effect on the next normal reload.
Private aliases and MCP paths are seeded only when missing; existing files and symlinks are preserved.
The shared tools file is also linked as the global mise config. Project configs can override tool versions.
Mason and automatic LuaRocks setup are disabled; LazyVim starts language servers with the project's mise environment.

## Maintenance

```sh
mise install                              # install declared tools
mise upgrade                              # update within declared versions
mise bootstrap repos update               # update Zsh plugins and bat theme
mise run bat:cache                         # rebuild the theme cache
mise -E macos dotfiles apply               # apply configuration links
mise -E macos bootstrap packages status    # inspect supported apps
mise -E macos bootstrap packages upgrade   # update mise-owned apps
```

## Files

- `config/` — shared config; `config/mise/config.toml` declares tools and environment.
- `mise.toml` — native bootstrap, links and repositories; `mise.*.toml` selects platform/optional config.
- `nvim/` — LazyVim configuration.
- [EXCEPTIONS.md](EXCEPTIONS.md) — software left outside mise, reasons and direct setup commands.
- [KEYBINDINGS.md](KEYBINDINGS.md) — editor shortcuts and reference links.
