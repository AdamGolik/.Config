return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- tutaj dodajesz swoje własne mapy pod <leader>
    defaults = {
      ["<leader>z"] = {
        name = "Folding",
        f = { "za", "Toggle fold" },
        o = { "zR", "Open all folds" },
        c = { "zM", "Close all folds" },
      },
    },
  },
}
