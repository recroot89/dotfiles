return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
        },
      },
      filesystem = {
        bind_to_cwd = true,
        commands = {
          avante_add_files = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local relative_path = require('avante.utils').relative_path(filepath)

            local sidebar = require('avante').get()
            local open = sidebar:is_open()

            if not open then
              require('avante.api').ask()
              sidebar = require('avante').get()
            end

            sidebar.file_selector:add_selected_file(relative_path)

            if not open then
              sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
            end
          end,
        },
        window = {
          mappings = {
            ["/"] = "none",
            ["oa"] = "avante_add_files",
          },
        },
        -- follow_current_file = { enabled = true },
      },
    },
  },
}

