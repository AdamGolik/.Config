local themes = {
  "dracula",
}

local current = 1

vim.api.nvim_create_user_command("ToggleTheme", function()
  current = current % #themes + 1
  vim.cmd("colorscheme " .. themes[current])
end, {})

vim.keymap.set("n", "<leader>th", "<cmd>ToggleTheme<CR>", { desc = "Toggle Theme" })

return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = true, -- Mofiqul's plugin uses this flag
        overrides = function(colors)
          return {
            Normal = { bg = "NONE" },
            NormalNC = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            FloatBorder = { bg = "NONE" },
            VertSplit = { bg = "NONE" },
            SignColumn = { bg = "NONE" },
            StatusLine = { bg = "NONE" },
            LineNr = { bg = "NONE" },
            CursorLineNr = { bg = "NONE" },
            Pmenu = { bg = "NONE" },
            PmenuSel = { bg = "NONE" },
            TelescopeNormal = { bg = "NONE" },
            TelescopeBorder = { bg = "NONE" },
          }
        end,
      })

      vim.cmd("colorscheme dracula")
    end,
  },
}
