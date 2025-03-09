return {
  {
    'folke/snacks.nvim',
    priority = 1001,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      image = {
        enabled = true,
        force = true, -- force rendering even if terminal detection fails
        doc = {
          enabled = true,
          inline = true, -- render images inline in the buffer
          float = true, -- fallback to floating window if inline fails
          max_width = 80,
          max_height = 40,
        },
      },

      indent = { enabled = false },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      git = { enabled = false },
      words = { enabled = true },
      env = {
        GHOSTTY = true,
      },
    },
  },
}
