return {
  "stevearc/aerial.nvim",
  opts = {
    backends = { "lsp", "treesitter", "markdown" },
    layout = {
      max_width = { 40, 0.2 },
      default_direction = "right",
    },
    show_guides = true,
    filter_kind = false, -- pokaż wszystkie typy symboli
    highlight_on_hover = true,
    autojump = false,
  },
  cmd = { "AerialToggle", "AerialOpen", "AerialNavOpen" },
  keys = {
    { "<leader>cs", "<cmd>AerialToggle<CR>", desc = "Code Structure (Symbols)" },
  },
  config = function(_, opts)
    require("aerial").setup(opts)

    -- Opcjonalna integracja z lualine, jeśli używasz:
    local ok, lualine = pcall(require, "lualine")
    if ok then
      lualine.setup {
        sections = {
          lualine_x = {
            { require("aerial").get_location, cond = require("aerial").is_available },
          },
        },
      }
    end
  end,
}

