local M = {}

------------------------------------------------------------------------------
---neovim

function M.isdir(path) return vim.fn.isdirectory(path) == 1 end

function M.isfile(path) return vim.fn.filereadable(path) == 1 end

function M.cwd() return vim.fn.getcwd() end

function M.cd(path) vim.fn.chdir(path) end

function M.get_buf_file_path()
  local buffer_number = vim.api.nvim_get_current_buf()
  local buffer_name = vim.api.nvim_buf_get_name(buffer_number)
  return buffer_name
end

function M.get_buf_file_name()
  local buffer_path = M.get_buf_file_path()
  local file_name = vim.fn.fnamemodify(buffer_path, ":t")
  return file_name
end

function M.get_buf_file_dir()
  local buffer_path = M.get_buf_file_path()
  local directory = vim.fn.fnamemodify(buffer_path, ":h")
  return directory
end

function M.run(cmd, input) return vim.fn.system(cmd, input) end

------------------------------------------------------------------------------
---xtools

function M.adjust_path_from_clip() return M.run "xt -b c2V0X2NsaXAoZmwwKGdldF9jbGlwKCkpKQ==" end

------------------------------------------------------------------------------
---toggleterm

function M.new_term_cmd_vertical(opts)
  local term = require("toggleterm.terminal").Terminal:new(opts)
  term:toggle(80, "vertical")
end

------------------------------------------------------------------------------

return M
