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

-- Configure diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "Error",
      [vim.diagnostic.severity.WARN] = "Warn",
      [vim.diagnostic.severity.INFO] = "Info",
      [vim.diagnostic.severity.HINT] = "Hint",
    },
  },
  virtual_text = true,
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

vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("nil_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("clangd")
vim.lsp.enable("jdtls")
vim.lsp.enable("java-test")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Create buffer-local keymappings for common LSP actions.
    -- See `:help vim.lsp.buf` for more.
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<Leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     -- Check if Neovim was started with one or more file arguments
--     if vim.fn.argc() > 0 then
--       -- If so, this is the fix for the LSP autostart timing issue.
--       -- It re-triggers the FileType event for the initially loaded buffer.
--       if vim.bo.filetype ~= "" then
--         vim.cmd.doautocmd("FileType")
--       end
--     else
--       -- If Neovim was started without any file arguments (e.g., just `nvim`),
--       -- open the Oil file explorer in the current directory.
--       require("oil").open()
--     end
--   end,
-- })
require("config.keymaps")
require("config.init")
