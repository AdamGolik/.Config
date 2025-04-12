return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
  config = function()
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#5c6370" }) -- dodajesz kolor jeśli używasz scope

    require("ibl").setup({
      indent = { char = "│" },
      scope = { enabled = false }, -- lub true jeśli chcesz
    })
  end,
}
