require("toggleterm").setup{
  open_mapping = [[<c-x>]],
  hide_numbers = true,
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'single',
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  }
}


