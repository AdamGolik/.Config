return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    defaults = {
      ["<leader>z"] = {
        name = "Folding",
        f = { "za", "Toggle fold" },
        o = { "zR", "Open all folds" },
        c = { "zM", "Close all folds" },
      },
      cn = {
        name = "C#",
        b = "dotnet build / breakpoint",
        t = "dotnet test",
        r = "dotnet run / rename",
        gd = "go to definition",
        gr = "references",
        gi = "implementation",
        K = "hover doc",
        f = "format",
        ca = "code action",
        rn = "rename",
      },
    },
    window = {
      border = "single", -- Ustawienie obramowania okna
      position = "top", -- Okno na górze
      winblend = 20, -- Przezroczystość okna (0 to brak przezroczystości, 100 to pełna przezroczystość)
    },
  },
}
