return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    mappings = {
      ask = "<leader>ag",
    },
    provider = "openai",
    debounce = 800, -- delay before sending input after idle (ms)
    throttle = 1500, -- minimum time between consecutive requests (ms)
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "o4-mini", -- your desired model (or use gpt-4o, etc.)
      timeout = 45000, -- Timeout in milliseconds, increase this for reasoning models
      temperature = 0.3, -- balance between creativity and consistency
      max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      top_p = 1,
      frequency_penalty = 0,
      presence_penalty = 0,
      --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
