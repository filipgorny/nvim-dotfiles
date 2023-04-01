local api = vim.api

local function open_window()
  buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- get dimensions
  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")

  win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = math.floor(width * 0.8),
    height = math.floor(height * 0.8),
    row = math.floor(height * 0.1),
    col = math.floor(width * 0.1),
  })
end

local function list_files()
  local current_path = vim.fn.getcwd() .. "/*"
  local paths = vim.split(vim.fn.glob(current_path), '\n')
  local lines = {}
  for _, path in ipairs(paths) do
    table.insert(lines, path)
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

local function enable_keymaps()
    vim.api.nvim_buf_set_keymap(buf, 'bb', key, function () 
      vim.api.nvim_win_close(win, true)
    end, { noremap = true, silent = true })
end

function _G.treebrowser()
  open_window()
  enable_keymaps()
  list_files()
end

vim.api.nvim_set_keymap('n', 'ew', ':lua treebrowser()<CR>', { noremap = true, silent = true })

