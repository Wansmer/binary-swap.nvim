local M = {}

M.swap_operands_with_operator = function()
  require('binary-swap.swap').format_and_replace(true)
end

M.swap_operands = function()
  require('binary-swap.swap').format_and_replace()
end

return M
