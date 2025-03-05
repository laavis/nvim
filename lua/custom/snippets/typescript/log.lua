local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('typescriptreact', {
  s('db', {
    t { "console.debug('" },
    i(1, 'message'),
    t { "')" },
  }),
  s('terr', {
    t { "throw new Error('" },
    i(1, 'message'),
    t { "')" },
  }),
})
