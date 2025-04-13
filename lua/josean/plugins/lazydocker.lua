return {
  "mgierada/lazydocker.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  event = "BufRead",
  keys = {
    {
      "<leader>ld",
      function()
        require("lazydocker").open()
      end,
      desc = "Open Lazydocker floating window",
    },
  },
  config = function()
    require("lazydocker").setup({
      border = "curved", -- możesz zmienić na "single", "double", itd.
    })
  end,
}
