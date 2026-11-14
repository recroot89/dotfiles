# LazyVim compatibility review

Checked on 2026-11-15. Custom languages, plugins, formatting choices and keybindings are preserved by this review.

## Installed and released versions

| Component | Installed / lockfile | Latest released |
| --- | --- | --- |
| LazyVim | 16.0.2, `0fa4a847929fc6beae40a3063615a58115678c34` | [16.0.2](https://github.com/LazyVim/LazyVim/releases/tag/v16.0.2), same commit |
| lazy.nvim | 11.17.5, `85c7ff3711b730b4030d03144f6db6375044ae82` | [11.17.5](https://github.com/folke/lazy.nvim/releases/tag/v11.17.5), same commit |
| Neovim | 0.12.6 | Meets the installed LazyVim and Treesitter requirements |

The released LazyVim upgrade is already installed. Current unreleased `main` is
`5c26fac21fd3896024a23f2dbc62b722f9a731db`, exactly one commit ahead; it only regenerates `doc/LazyVim.txt`.
It contains no runtime migration to apply. [Exact comparison](https://github.com/LazyVim/LazyVim/compare/v16.0.2...5c26fac).
No branch snapshot or mass plugin refresh is needed.

## Required adjustments applied

1. **Go LSP attach callback uses the wrong argument order.** The custom `gopls` handler passes `(client, _)` to
   `Snacks.util.lsp.on`, whose signature is `(buf, client)`. When Go attaches, the handler indexes a buffer number as a client.
   The parameters now use `(_, client)`; the semantic-token customization is preserved.
   [Installed Snacks API](https://github.com/folke/snacks.nvim/blob/882c996cf28183f4d63640de0b4c02ec886d01f2/lua/snacks/util/lsp.lua#L4).
2. **Treesitter CLI is missing.** `tree-sitter` was absent from PATH and the mise manifest at review start. The installed
   Treesitter branch needs CLI >=0.26.1, plus a C compiler, tar and curl. LazyVim cannot install the CLI automatically while
   Mason is intentionally disabled. The native mise `tree-sitter` tool is declared and installed at 0.27.2.
   Mason stays disabled and every parser is retained.
   [Installed Treesitter requirements](https://github.com/nvim-treesitter/nvim-treesitter/blob/60c0f46/README.md#requirements),
   [LazyVim installer fallback](https://github.com/LazyVim/LazyVim/blob/v16.0.2/lua/lazyvim/util/treesitter.lua).

Existing compiled parsers can mask the second issue until `:TSUpdate` or a new language needs installation.
Verified the callback through the actual installed Snacks dispatcher: missing Go semantic-token capabilities receive the custom
fallback, while capabilities already supplied by the server remain untouched. Compiled Ruby, Go, Elixir and TypeScript parsers
with CLI 0.27.2 into a temporary directory, then loaded them in Neovim and checked parsing/highlight queries. Existing working
parsers were not replaced. Resolved LazyVim options preserve custom languages, Blink Enter/Tab/Shift-Tab mappings, Catppuccin,
formatting/animation choices, project-root behavior and disabled Mason/Rocks. No plugin lockfile entries changed.

## Changes that do not require replacing customization

- LazyVim 15 moved LSP setup to native `vim.lsp.config` and Treesitter to its rewritten `main` branch. The current LazyVim
  implementation already performs that setup. Keep the custom server options and project-root `mise exec` launchers;
  rebuilding the config with legacy `require('lspconfig').server.setup()` would move backwards.
  [Official migration notes](https://www.lazyvim.org/news),
  [released LSP configuration](https://github.com/LazyVim/LazyVim/blob/v16.0.2/lua/lazyvim/plugins/lsp/init.lua).
- TypeScript's extra now selects a nested implementation; `vtsls` remains the default. The existing `lang.typescript` import
  and `vtsls` command override remain valid. `tsgo` was renamed to `tsc`, but this config does not select it; changing servers
  would be optional and could alter behavior.
  [Released TypeScript selector](https://github.com/LazyVim/LazyVim/blob/v16.0.2/lua/lazyvim/plugins/extras/lang/typescript/init.lua).
- The Ruby extra still selects `ruby_lsp` and RuboCop by default. Preserve the project-selected Ruby/gems behavior, Rails
  migration-prompt setting and disabled Ruby semantic tokens. Elixir's current extra still uses `elixirls` and the existing
  formatter/test integration.
  [Ruby extra](https://github.com/LazyVim/LazyVim/blob/v16.0.2/lua/lazyvim/plugins/extras/lang/ruby.lua),
  [Elixir extra](https://github.com/LazyVim/LazyVim/blob/v16.0.2/lua/lazyvim/plugins/extras/lang/elixir.lua).
- Endwise at the locked commit attaches itself through FileType events on current Neovim. Its old `opts.endwise.enable`
  setting is redundant, but the plugin itself is compatible; deleting the plugin would remove wanted functionality.
  [Locked implementation](https://github.com/RRethy/nvim-treesitter-endwise/blob/8fe8a95/lua/nvim-treesitter-endwise.lua).
- LazyVim 16's breaking refactoring-plugin change concerns an extra that is not enabled here. The later patch fixes for
  TypeScript selection, nvim-lint arguments and organize-import actions are already in the installed release.
  [Released changelog](https://github.com/LazyVim/LazyVim/blob/v16.0.2/CHANGELOG.md).

## Separate existing integration checks

- `gopls` 0.24.0's own `api-json` does not advertise the configured `analyses.useany` or `codelenses.gc_details` keys.
  All other configured analyzer, hint and code-lens keys are present, including `fieldalignment`. Confirm the server's
  initialization warnings before pruning obsolete settings; this is server-version drift, not a LazyVim release migration.
  [Gopls settings](https://github.com/golang/tools/blob/gopls/v0.24.0/gopls/doc/settings.md).
- Neo-tree's custom `oa` command references Avante, which is absent from the current plugin lock/spec. That integration can
  fail independently of LazyVim updates. Preserve the binding and plugin choices until its intended action is resolved.
