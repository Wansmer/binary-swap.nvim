local query = require('vim.treesitter.query')
local ts_ok, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')

if not ts_ok then
  return
end

local M = {}

local OPPOSITES = vim.tbl_add_reverse_lookup({
  ['>='] = '<=',
  ['>'] = '<',
  ['<<'] = '>>',
})

local BINARY = 'binary_expression'
local OPERATOR_INDEX = 2

---Return TSNode with type 'binary_expression' or nil
---@param node userdata
---@return userdata|nil
local function get_binary_node(node)
  if not node then
    return
  end

  if node:type() ~= BINARY then
    node = node:parent()
    return get_binary_node(node)
  end

  return node
end

---Returned list-like table with children of node
---This function is pretty much copied from 'nvim-treesitter'
---(TSRange:collect_children)
---@param node userdata TSNode instance
---@param filter? function Function for filtering output list
---@return table
local function collect_children(node, filter)
  local children = {}

  for child in node:iter_children() do
    if not filter or filter(child) then
      table.insert(children, child)
    end
  end

  return children
end

---Returned swapped operands and opposite operator if it needs
---@param operands userdata[]
---@param swap_operator? boolean Swap operator to opposite or not
---@return table[]
local function swap_operands(operands, swap_operator)
  local replacement = {}
  for idx = #operands, 1, -1 do
    local text = query.get_node_text(operands[idx], 0, { concat = false })
    local reversed_idx = #operands - idx + 1

    if swap_operator and idx == OPERATOR_INDEX then
      local operator = OPPOSITES[text[1]]
      text = operator and { operator } or text
    end

    local range = { operands[reversed_idx]:range() }
    table.insert(replacement, { text = text, range = range })
  end
  return replacement
end

---Format and replace binary expression under cursor
---@param swap_operator? boolean Swap operator to opposite or not
function M.format_and_replace(swap_operator)
  local node = ts_utils.get_node_at_cursor(0)
  local binary_expression = get_binary_node(node)
  if binary_expression then
    local operands = collect_children(binary_expression)
    local replacement = swap_operands(operands, swap_operator)

    for i = #replacement, 1, -1 do
      local sr, sc, er, ec = unpack(replacement[i].range)
      vim.api.nvim_buf_set_text(0, sr, sc, er, ec, replacement[i].text)
    end
  end
end

return M
