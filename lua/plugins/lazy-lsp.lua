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
      lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
      })
    end)

    require("lazy-lsp").setup {
      -- Define specific language servers to load based on filetype
      prefer_local = true,
      preffered_servers = {
        lua = { "lua_ls" },
        javascript = { "ts_ls" },
        -- typescript = { "ts_ls" },
        rust = { "rust_analyzer" },
        c = { "clangd" },
        cpp = { "clangd" },
        python = { "pyright" },
        go = { "gopls" },
        -- Add more filetype-server mappings as needed
      },
      -- Prevent lazy-lsp{
      excluded_servers = {
        "ccls",                            -- prefer clangd
        "denols",                          -- prefer eslint and ts_ls
        "docker_compose_language_service", -- yamlls should be enough?
        "flow",                            -- prefer eslint and ts_ls
        "ltex",                            -- grammar tool using too much CPU
        "quick_lint_js",                   -- prefer eslint and ts_ls
        "scry",                            -- archived on Jun 1, 2023
        "tailwindcss",                     -- associates with too many filetypes
        "biome",                           -- not mature enough to be default
        "oxlint",                          -- prefer eslint
      },
      -- on startup. Servers will now only start when a matching filetype
      -- is opened.
      auto_start = false,
    }
  end,
}
