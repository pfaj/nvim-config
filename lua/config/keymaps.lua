-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Normal mode mappings
map("n", "J", "mzJ`z")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-h>", ":BufferFirst<CR>")
map("n", "<C-l>", ":BufferLineCyclePrevious<CR>")
map("n", "<C-k>", ":BufferLineCycleNext<CR>")
map("n", "<C-j>", ":BufferLineCyclePrev<CR>")
map("n", "<C-Tab>", ":BufferLineClose<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<F8>", ":TagbarToggle<CR>")
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>")
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>")
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=r<CR>")
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>")
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>")
map("n", "<F5>", ":UndotreeToggle<CR>")
map("n", "<C-t>", ":FloatermToggle<CR>")
map("n", "<F9>", ":LazyGit<CR>")

-- Visual mode mappings
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
