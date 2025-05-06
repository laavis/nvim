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

-- Copy all diagnostics at cursor line
vim.keymap.set('n', '<leader>yd', function()
  -- current buffer & line
  local bufnr = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1

  -- fetch every diagnostic at this line
  local diags = vim.diagnostic.get(bufnr, { lnum = row })
  if vim.tbl_isempty(diags) then
    vim.notify('No diagnostics at line ' .. (row + 1), vim.log.levels.WARN)
    return
  end

  -- collect each message (with its source tag, if you like)
  local msgs = {}
  for _, d in ipairs(diags) do
    -- you can include d.source or d.code here too if you want:
    table.insert(msgs, d.message)
  end

  -- join with real newlines
  local full = table.concat(msgs, '\n')

  -- yank to '+' (system clip), char-wise so newlines stick
  vim.fn.setreg('+', full, 'c')
  vim.notify('Copied ' .. #msgs .. ' diagnostic(s)', vim.log.levels.INFO)
end, { desc = 'Yank *all* diagnostics at cursor line' })

-- Copy hover documentation at cursor line
vim.keymap.set('n', '<leader>yh', function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/hover', params, function(err, result, ctx, _)
    if err then
      vim.notify('Error fetching hover: ' .. err.message, vim.log.levels.ERROR)
      return
    end
    if not (result and result.contents) then
      vim.notify('No hover information available', vim.log.levels.WARN)
      return
    end

    -- turn whatever the server sent into markdown lines
    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)

    -- remove any truly empty or whitespace-only lines
    local cleaned = vim.tbl_filter(function(line)
      return line:match '%S'
    end, markdown_lines)

    -- reassemble, yank to clipboard
    local text = table.concat(cleaned, '\n')
    vim.fn.setreg('+', text, 'c')
    vim.notify('Hover docs copied to clipboard', vim.log.levels.INFO)
  end)
end, { desc = 'Yank LSP hover documentation' })
