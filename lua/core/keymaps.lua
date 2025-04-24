-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>yd', function()
  local diagnostics = vim.diagnostic.get()
  if diagnostics and diagnostics[1] then
    vim.fn.setreg('+', diagnostics[1].message)
    vim.notify('Diagnostic copied to clipboard', vim.log.levels.INFO)
  end
end, { desc = 'Yank diagnostic message' })

vim.keymap.set('n', '<leader>yh', function()
  -- Trigger the hover popup
  vim.lsp.buf.hover()

  -- Give it time to render before extracting the content
  vim.defer_fn(function()
    -- Search for the hover float window
    local hover_buf = nil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= '' and config.focusable == false then
        local buf = vim.api.nvim_win_get_buf(win)
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        if #lines > 0 then
          hover_buf = buf
          break
        end
      end
    end

    -- Yank contents if found
    if hover_buf then
      local lines = vim.api.nvim_buf_get_lines(hover_buf, 0, -1, false)
      local text = table.concat(lines, '\n')
      vim.fn.setreg('+', text)
      vim.notify('Hover contents yanked to clipboard', vim.log.levels.INFO)
    else
      vim.notify('No hover content found', vim.log.levels.WARN)
    end
  end, 100) -- delay in ms
end, { desc = 'Yank LSP Hover to Clipboard' })
