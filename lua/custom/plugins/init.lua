-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Git gud
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
  },
  { -- Typescript tools
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      require('typescript-tools').setup {
        settings = {
          tsserver_plugins = {
            -- for TypeScript v4.9+
            '@styled/typescript-styled-plugin',
          },
        },
      }
    end,
  },
  {
    'styled-components/vim-styled-components',
    branch = 'main',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  },
  { -- Markdown preview
    'OXY2DEV/markview.nvim',
    lazy = false,
    config = function()
      -- Set a keymap for toggling Markview
      vim.keymap.set('n', '<leader>mt', ':Markview Toggle<CR>', { desc = 'Toggle Markview Preview' })
    end,
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
  { -- Start Screen
    'goolord/alpha-nvim',
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.theta').config)
    end,
  },
  { -- Fancy Autocomplete
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },

  { -- A useless plugin that might help you cope with stubbornly broken tests or overall lack of sense in life
    'Eandrju/cellular-automaton.nvim',
    config = function()
      vim.keymap.set('n', '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>')
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
