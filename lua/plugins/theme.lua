return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = true, -- enable highlight compilation
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = false },
        transparent = false, -- use a background color
        terminalColors = true, -- define terminal colors
        theme = 'wave', -- choose theme variant
      }
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
