local M = {}

local snippet_files = {
  'hox.react',
  'typescript.log',
}

-- Load each snippet file
for _, file in ipairs(snippet_files) do
  local ok, err = pcall(require, 'snippets.' .. file)
  if not ok then
    vim.notify('Error loading snippet: ' .. file .. '\n' .. err, vim.log.levels.ERROR)
  end
end

return M
