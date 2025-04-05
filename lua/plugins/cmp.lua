return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-calc",
    "hrsh7th/vim-vsnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      experimental = { ghost_text = true },
      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = "λ",
            vsnip = "⋗",
            buffer = "Ω",
            path = "🖫",
            codeium = "",
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
      mapping = {
        ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "vsnip" },
        { name = "luasnip" },
        { name = "calc" },
      },
    })
  end,
}
