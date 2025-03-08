return {
  { -- Oil
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
          ['q'] = 'actions.close', -- Add this line to close oil with "q"
        },
        view_options = { show_hidden = true },

        -- Open parent directory in current window
        vim.keymap.set('n', '<leader>-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
        -- Open parent directory in floating window
        vim.keymap.set('n', '-', require('oil').toggle_float, { desc = 'Open parent directory' }),
      }
    end,
  },
}
