return {
    "L3MON4D3/LuaSnip",
    version = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
