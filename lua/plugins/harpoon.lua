return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup({})

    -- Harpoon keybindings
    vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file, { desc = "Add to Harpoon" })
    vim.keymap.set("n", "<leader>m", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon Menu" })
    vim.keymap.set("n", "<leader>1", function()
      require("harpoon.ui").nav_file(1)
    end, { desc = "Harpoon File 1" })
    vim.keymap.set("n", "<leader>2", function()
      require("harpoon.ui").nav_file(2)
    end, { desc = "Harpoon File 2" })
    vim.keymap.set("n", "<leader>3", function()
      require("harpoon.ui").nav_file(3)
    end, { desc = "Harpoon File 3" })
    vim.keymap.set("n", "<leader>4", function()
      require("harpoon.ui").nav_file(4)
    end, { desc = "Harpoon File 4" })
  end,
}
