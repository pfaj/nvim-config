_G.vim = vim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = false
vim.g.neovide_scale_factor = 0.75
vim.g.neovide_transparency = 0.85
vim.g.neovide_unlink_border_highlights = false
vim.g.user_emmet_leader_key = ","
vim.g.user_emmet_mode = "n"

vim.opt.colorcolumn = "120"
vim.opt.backup = false
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.expandtab = true
vim.opt.foldmethod = "manual"
vim.opt.foldopen = "all"
vim.opt.guicursor = "i:ver25-iCursor"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 12
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.conceallevel = 1

vim.opt.updatetime = 50
vim.opt.wrap = false

-- Enable vim.loader for better startup performance
vim.loader.enable()

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.nvim/undo")

local function sign(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = "",
  })
end

sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "" })

-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

require("config.keymaps")
require("config.init")
