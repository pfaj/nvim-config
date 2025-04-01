return     {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("telescope").setup({})
        local telescope_extensions = {}
        for i, extension in ipairs(telescope_extensions) do
            require("telescope").load_extension(extension)
        end
    end,
}

