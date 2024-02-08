local M = {}

------------------------------------------------------------------------------
---neovim

function M.get_clip() return vim.fn.getreg "+" end
function M.set_clip(data) return vim.fn.setreg("+", data) end

function M.isdir(path) return vim.fn.isdirectory(path) == 1 end
function M.isfile(path) return vim.fn.filereadable(path) == 1 end

function M.cwd() return vim.fn.getcwd() end
function M.cd(path) vim.fn.chdir(path) end

function M.filename(path) return vim.fn.fnamemodify(path, ":t") end
function M.dirname(path) return vim.fn.fnamemodify(path, ":h") end

function M.get_buf_file_path()
  local buffer_number = vim.api.nvim_get_current_buf()
  local buffer_name = vim.api.nvim_buf_get_name(buffer_number)
  return buffer_name
end

function M.get_buf_file_relpath()
  local buf_path = vim.api.nvim_buf_get_name(0)
  local buf_relpath = vim.fn.fnamemodify(buf_path, ":.")
  return buf_relpath
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

function M.get_cursor()
  local current_window = vim.api.nvim_get_current_win()
  local current_cursor = vim.api.nvim_win_get_cursor(current_window)
  return current_cursor
end

function M.get_buf_content(line_begin, line_end)
  line_begin = line_begin or 1
  line_end = line_end or "$"
  return vim.fn.join(vim.fn.getline(line_begin, line_end), "\n")
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

function M.new_term_cmd_float(opts)
  local term = require("toggleterm.terminal").Terminal:new(opts)
  term:toggle(80, "float")
end

------------------------------------------------------------------------------

return M
