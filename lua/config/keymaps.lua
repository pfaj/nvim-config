local keymaps = {
  { action = "mzJ`z", key = "J", mode = "n" },
  { action = ":m '>+1<CR>gv=gv", key = "J", mode = "v" },
  { action = ":m '<-2<CR>gv=gv", key = "K", mode = "v" },
  { action = "<C-u>zz", key = "<C-u>", mode = "n" },
  { action = "<C-d>zz", key = "<C-d>", mode = "n" },
  { action = "nzzzv", key = "n", mode = "n" },
  { action = "Nzzzv", key = "N", mode = "n" },
  { action = ":BufferFirst<CR>", key = "<C-h>", mode = "n" },
  { action = ":BufferLast<CR>", key = "<C-l>", mode = "n" },
  { action = ":BufferNext<CR>", key = "<C-k>", mode = "n" },
  { action = ":BufferMoveNext<CR>", key = "<C-S-K>", mode = "n" },
  { action = ":BufferPrevious<CR>", key = "<C-j>", mode = "n" },
  { action = ":BufferMovePrevious<CR>", key = "<C-S-J>", mode = "n" },
  { action = ":BufferClose<CR>", key = "<C-Tab>", mode = "n" },
  { action = ":NvimTreeToggle<CR>", key = "<C-e>", mode = "n" },
  { action = ":Telescope find_files<CR>", key = "<leader>ff", mode = "n" },
  { action = ":Telescope live_grep<CR>", key = "<leader>fg", mode = "n" },
  { action = ":TagbarToggle<CR>", key = "<F8>", mode = "n" },
  { action = "<cmd>Trouble diagnostics toggle<CR>", key = "<leader>xx", mode = "n" },
  { action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", key = "<leader>xX", mode = "n" },
  { action = "<cmd>Trouble symbols toggle focus=false<CR>", key = "<leader>cs", mode = "n" },
  { action = "<cmd>Trouble lsp toggle focus=false win.position=r<CR>", key = "<leader>cl", mode = "n" },
  { action = "<cmd>Trouble loclist toggle<CR>", key = "<leader>xL", mode = "n" },
  { action = "<cmd>Trouble qflist toggle<CR>", key = "<leader>xQ", mode = "n" },
  { action = ":UndotreeToggle<CR>", key = "<F5>", mode = "n" },
  { action = ":FloatermToggle<CR>", key = "<C-t>", mode = "n" },
  { action = ":LazyGit<CR>", key = "<F9>", mode = "n" },
  { action = ":w<CR>", key = "<leader>w", mode = "n" },
}

for _, map in ipairs(keymaps) do
  vim.keymap.set(map.mode, map.key, map.action, map.options)
end
