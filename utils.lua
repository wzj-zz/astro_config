local M = {}

function M.new_term_cmd_vertical(opts)
  local term = require("toggleterm.terminal").Terminal:new(opts)
  term:toggle(80, "vertical")
end

return M
