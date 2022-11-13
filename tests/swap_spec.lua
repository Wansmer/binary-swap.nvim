local u = require('tests.utils')

local PATH_JS = './tests/langs/index.js'
local PATH_CSS = './tests/langs/index.css'
local PATH_LUA = './tests/langs/index.lua'

local test_data = {
  {
    desc = 'lang "%s", func "%s", "||" operator',
    path = PATH_JS,
    func = 'swap_operands',
    lang = 'javascript',
    cursor = { 2, 20 },
    expected = { 2, 3 },
    result = { 1, 2 },
  },
  {
    desc = 'lang "%s", func "%s", "===" operator',
    path = PATH_JS,
    func = 'swap_operands',
    lang = 'javascript',
    cursor = { 5, 12 },
    expected = { 5, 6 },
    result = { 4, 5 },
  },
  {
    desc = 'lang "%s", func "%s", "+" operator with funcs',
    path = PATH_JS,
    func = 'swap_operands',
    lang = 'javascript',
    cursor = { 8, 10 },
    expected = { 8, 9 },
    result = { 7, 8 },
  },
  {
    desc = 'lang "%s", func "%s", "+" operator with func and CONSTANT',
    path = PATH_JS,
    func = 'swap_operands',
    lang = 'javascript',
    cursor = { 11, 10 },
    expected = { 11, 12 },
    result = { 10, 11 },
  },
  {
    desc = 'lang "%s", func "%s", ">=" operator with func and CONSTANT',
    path = PATH_JS,
    func = 'swap_operands',
    lang = 'javascript',
    cursor = { 14, 0 },
    expected = { 14, 15 },
    result = { 13, 14 },
  },
  {
    desc = 'lang "%s", func "%s", "||" operator',
    path = PATH_JS,
    func = 'swap_operands_with_operator',
    lang = 'javascript',
    cursor = { 18, 20 },
    expected = { 18, 19 },
    result = { 17, 18 },
  },
  {
    desc = 'lang "%s", func "%s", ">=" operator',
    path = PATH_JS,
    func = 'swap_operands_with_operator',
    lang = 'javascript',
    cursor = { 21, 20 },
    expected = { 21, 22 },
    result = { 20, 21 },
  },
  {
    desc = 'lang "%s", func "%s", "+" operator',
    path = PATH_LUA,
    func = 'swap_operands',
    lang = 'lua',
    cursor = { 2, 25 },
    expected = { 2, 3 },
    result = { 1, 2 },
  },
  {
    desc = 'lang "%s", func "%s", ">" operator',
    path = PATH_LUA,
    func = 'swap_operands',
    lang = 'lua',
    cursor = { 5, 14 },
    expected = { 5, 6 },
    result = { 4, 5 },
  },
  {
    desc = 'lang "%s", func "%s", ">" operator',
    path = PATH_LUA,
    func = 'swap_operands_with_operator',
    lang = 'lua',
    cursor = { 9, 14 },
    expected = { 9, 10 },
    result = { 8, 9 },
  },
  {
    desc = 'lang "%s", func "%s", ">" operator',
    path = PATH_LUA,
    func = 'swap_operands_with_operator',
    lang = 'lua',
    cursor = { 12, 14 },
    expected = { 12, 13 },
    result = { 11, 12 },
  },
  {
    desc = 'lang "%s", func "%s", "+" operator',
    path = PATH_CSS,
    func = 'swap_operands',
    lang = 'css',
    cursor = { 3, 19 },
    expected = { 5, 6 },
    result = { 2, 3 },
  },
}

describe('Binary-swap: ', function()
  for _, value in ipairs(test_data) do
    u._test(value)
  end
end)
