return {
  {
    'styled-components/vim-styled-components',
    branch = 'main',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  },
  { -- Terminal in nvim
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
        shade_terminals = true,
        persist_size = true,
        persist_mode = true,
        open_mapping = [[<C-\>]], -- Default keybinding to toggle
        direction = 'horizontal',
        position = 'right',
        close_on_exit = true, -- Close terminals when the process exits
      }

      -- Automatically close all terminals when exiting Neovim
      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
          require('toggleterm').toggle_all()
        end,
      })

      vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'Vertical Split Terminal' })
    end,
  },

  -- Auto rename tags
  {
    'AndrewRadev/tagalong.vim',
    event = 'InsertEnter',
    config = function()
      vim.g.tagalong_verbose = 1
      vim.g.tagalong_additional_filetypes = { 'tsx' }
    end,
  },
}
