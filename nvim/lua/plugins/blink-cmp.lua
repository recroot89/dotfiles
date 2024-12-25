return {
  "saghen/blink.cmp",
  enabled = true,
  opts = {
    completion = {
      list = {
        selection = "auto_insert",
      },
    },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
  },
}
