return {}
-- return {
--   "jose-elias-alvarez/null-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--
--     null_ls.setup({
--       sources = {
--         null_ls.builtins.formatting.stylua.with({
--           command = "/home/mono/.nix-profile/bin/stylua",
--           extra_args = { "--stdin-filepath", "$FILENAME" },
--         }),
--       },
--     })
--
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "lua",
--       callback = function()
--         vim.lsp.buf.format { async = false }
--       end,
--     })
--   end,
-- }
