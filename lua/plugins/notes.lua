return {
  "https://codeberg.org/ravnheim/project_notes",
  name = "project_notes",
  config = function()
    require("project_notes").setup({
      notes_path = ".notes",
      autosave = true,
      extension = ".md",
      sign = "󱞁",
      highlight = {
        fg = "#a0a0a0",
        bg = "#2e2e2e",
        bold = true,
      },
      keymaps = {
        main = "<leader>nm",
        toggle = "<leader>nt",
        list = "<leader>nl",
      },
    })
  end,
}
