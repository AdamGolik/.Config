return {
  "stevearc/aerial.nvim",
  opts = {
    backends = { "lsp", "treesitter", "markdown" },
    layout = {
      max_width = { 40, 0.2 },
      default_direction = "right",
    },
    show_guides = true,
    filter_kind = false,
    highlight_on_hover = true,
    autojump = false,
  },
  cmd = { "AerialToggle", "AerialOpen", "AerialNavOpen" },
  keys = {
    { "<leader>cs", "<cmd>AerialToggle<CR>", desc = "Code Structure (Symbols)" },
    { "<leader>co", "<cmd>AerialOpen<CR>", desc = "Open Aerial (Symbols)" },
    { "<leader>cn", "<cmd>AerialNavOpen<CR>", desc = "Open Aerial Nav (Floating)" },
    { "[a", "<cmd>AerialPrev<CR>", desc = "Previous symbol" },
    { "]a", "<cmd>AerialNext<CR>", desc = "Next symbol" },
    { "<leader>cf", "<cmd>AerialFocus<CR>", desc = "Focus Aerial window" },
    { "<leader>cc", "<cmd>AerialClose<CR>", desc = "Close Aerial" },
  },
  config = function(_, opts)
    require("aerial").setup(opts)

    local ok, lualine = pcall(require, "lualine")
    if ok then
      lualine.setup({
        sections = {
          lualine_x = {
            { require("aerial").get_location, cond = require("aerial").is_available },
          },
        },
      })
    end
  end,
}
