local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require('luasnip.extras').rep -- To repeat insert values

ls.add_snippets('typescriptreact', {
  s('cb', {
    t { "import constate from 'constate';", '', '' },
    t { 'export const [' },
    i(1, 'name'),
    t { 'ContextProvider, use' },
    rep(1),
    t { 'Context] = constate(() => {})' },
  }),
  s('ctxtype', {
    t { "import constate from 'constate';", '', '' },
    t { 'type T' },
    i(1, 'name'),
    t { 'Props = {};', '', '' },
    t { 'export const [' },
    rep(1),
    t { 'ContextProvider, use' },
    rep(1),
    t { 'Context] = constate(({} : T' },
    rep(1),
    t { 'Props) => {})' },
  }),
})
