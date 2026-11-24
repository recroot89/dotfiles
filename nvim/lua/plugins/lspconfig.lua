local function project_cmd(command)
  return function(dispatchers, config)
    local argv = { vim.fn.exepath("mise") ~= "" and vim.fn.exepath("mise") or "mise", "exec", "--" }
    vim.list_extend(argv, command)
    return vim.lsp.rpc.start(
      argv,
      dispatchers,
      config and config.root_dir and { cwd = config.cmd_cwd or config.root_dir }
    )
  end
end

-- Prefer gems belonging to the project's selected Ruby. Isolated global
-- tools are a fallback for projects whose Ruby has no server gem installed.
local function ruby_project_cmd(gem, executable, args)
  local script = [[
local_gem, executable = ARGV.shift(2)
path = begin
  Gem.bin_path(local_gem, executable)
rescue Gem::GemNotFoundException
  exec(executable, *ARGV)
end
load path
]]
  local command = { "ruby", "-rrubygems", "-e", script, gem, executable }
  vim.list_extend(command, args or {})
  return project_cmd(command)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      diagnostics = {
        underline = true,
        virtual_text = true,
        float = {
          border = "rounded",
        },
      },
      servers = {
        lua_ls = { mason = false, cmd = project_cmd({ "lua-language-server" }) },
        bashls = { mason = false, cmd = project_cmd({ "bash-language-server", "start" }) },
        jsonls = { mason = false, cmd = project_cmd({ "vscode-json-language-server", "--stdio" }) },
        yamlls = { mason = false, cmd = project_cmd({ "yaml-language-server", "--stdio" }) },
        dockerls = { mason = false, cmd = project_cmd({ "docker-langserver", "--stdio" }) },
        docker_compose_language_service = {
          mason = false,
          cmd = project_cmd({ "docker-compose-langserver", "--stdio" }),
        },
        ansiblels = { mason = false, cmd = project_cmd({ "ansible-language-server", "--stdio" }) },
        marksman = { mason = false, cmd = project_cmd({ "marksman", "server" }) },
        ruby_lsp = {
          mason = false,
          cmd = ruby_project_cmd("ruby-lsp", "ruby-lsp"),
          init_options = {
            addonSettings = {
              ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
              },
            },
          },
          on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = false
          end,
        },
        rubocop = {
          mason = false,
          cmd = ruby_project_cmd("rubocop", "rubocop", { "--lsp" }),
        },
        phpactor = { mason = false, cmd = project_cmd({ "phpactor", "language-server" }) },
        elixirls = { mason = false, cmd = project_cmd({ "elixir-ls" }) },
        tailwindcss = { mason = false, cmd = project_cmd({ "tailwindcss-language-server", "--stdio" }) },
        eslint = { mason = false, cmd = project_cmd({ "vscode-eslint-language-server", "--stdio" }) },
        vtsls = { mason = false, cmd = project_cmd({ "vtsls", "--stdio" }) },
        ltex = {
          mason = false,
          cmd = project_cmd({ "ltex-ls" }),
          settings = {
            ltex = {
              language = "ru-RU",
            },
          },
        },
        gopls = {
          mason = false,
          cmd = project_cmd({ "gopls" }),
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
    },
  },
}
