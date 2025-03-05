local M = {}

-- List all snippet files here (without `.lua` extension)
local snippet_files = {
  'hox.react', -- This will load `hox/component.lua`
  'typescript.log',
}

-- Load each snippet file
for _, file in ipairs(snippet_files) do
  local ok, err = pcall(require, 'custom.snippets.' .. file)
  if not ok then
    vim.notify('Error loading snippet: ' .. file .. '\n' .. err, vim.log.levels.ERROR)
  end
end

return M
