-- return { -- LSP Configuration & Plugins
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     -- Automatically install LSPs and related tools to stdpath for Neovim
--     {
--       "williamboman/mason.nvim",
--       -- NOTE: nixCats: use lazyAdd to only enable mason if nix wasnt involved.
--       -- because we will be using nix to download things instead.
--       enabled = require("nixCatsUtils").lazyAdd(true, false),
--       config = true,
--     }, -- NOTE: Must be loaded before dependants
--     {
--       "williamboman/mason-lspconfig.nvim",
--       -- NOTE: nixCats: use lazyAdd to only enable mason if nix wasnt involved.
--       -- because we will be using nix to download things instead.
--       enabled = require("nixCatsUtils").lazyAdd(true, false),
--     },
--     {
--       "WhoIsSethDaniel/mason-tool-installer.nvim",
--       -- NOTE: nixCats: use lazyAdd to only enable mason if nix wasnt involved.
--       -- because we will be using nix to download things instead.
--       enabled = require("nixCatsUtils").lazyAdd(true, false),
--     }, -- return {
--   },
-- }

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")

        -- Mason setup
        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = { "vtsls", "pyright" }, -- Add your desired servers here
            automatic_installation = true,
        })

        -- LSP configuration
        local servers = mason_lspconfig.get_installed_servers()

        for _, server_name in ipairs(servers) do
            lspconfig[server_name].setup({
                capabilities = cmp_lsp.default_capabilities(),
            })
        end

        -- Add lua_ls setup with specific command
        lspconfig.lua_ls.setup({
            cmd = { "/etc/profiles/per-user/mono/bin/lua-language-server" },
            capabilities = cmp_lsp.default_capabilities(),
        })

        lspconfig.rust_analyzer.setup({
            cmd = { "/home/mono/.nix-profile/bin/rust-analyzer" },
            capabilities = cmp_lsp.default_capabilities(),
        })

        lspconfig.clangd.setup({
            cmd = { "/home/mono/.local/share/nvim/mason/bin/clangd" },
            capabilities = cmp_lsp.default_capabilities(),
        })

        lspconfig.ruff.setup({
            cmd = { "/home/mono/.nix-profile/bin/ruff" },
            capabilities = cmp_lsp.default_capabilities(),
        })

        lspconfig.marksman.setup({
            cmd = { "/home/mono/.nix-profile/bin/marksman" },
            capabilities = cmp_lsp.default_capabilities(),
        })
        -- CMP setup
        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "luasnip" },
            }),
        })
    end,
}
