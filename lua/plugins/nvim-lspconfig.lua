-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "hrsh7th/nvim-cmp",
--     "hrsh7th/cmp-nvim-lsp",
--   },
--   config = function()
--     local lspconfig = require("lspconfig")
--     local mason = require("mason")
--     local mason_lspconfig = require("mason-lspconfig")
--     local cmp = require("cmp")
--     local cmp_lsp = require("cmp_nvim_lsp")
--
--     -- Mason setup
--     mason.setup()
--     mason_lspconfig.setup({
--       ensure_installed = { "vtsls", "pyright" }, -- Add your desired servers here
--       automatic_installation = true,
--     })
--
--     -- LSP configuration
--     local servers = mason_lspconfig.get_installed_servers()
--
--     for _, server_name in ipairs(servers) do
--       lspconfig[server_name].setup({
--         capabilities = cmp_lsp.default_capabilities(),
--       })
--     end
--
--     -- Add lua_ls setup with specific command
--     lspconfig.lua_ls.setup({
--       cmd = { "/etc/profiles/per-user/mono/bin/lua-language-server" },
--       capabilities = cmp_lsp.default_capabilities(),
--     })
--
--     -- CMP setup
--     cmp.setup({
--       snippet = {
--         -- REQUIRED - you must specify a snippet engine
--         expand = function(args)
--           require("luasnip").lsp_expand(args.body)
--         end,
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.abort(),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
--       }),
--       sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--         { name = "buffer" },
--         { name = "path" },
--         { name = "luasnip" },
--       }),
--     })
--   end,
-- }

return {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings to learn the available actions

            lsp_zero.setup_servers({ 'ts_ls', 'rust_analyzer', 'clangd', 'lua_ls', 'pyright' })
            lsp_zero.default_keymaps({
                buffer = bufnr,
                preserve_mappings = false
            })
        end)

        require("lazy-lsp").setup {}
    end,
}
