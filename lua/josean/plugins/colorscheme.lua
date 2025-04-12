local themes = {
  "dracula",
  "rose-pine",
  "catppuccin",
  "tokyonight",
  "everforest",
}

local current = 1

vim.api.nvim_create_user_command("ToggleTheme", function()
  current = current % #themes + 1
  vim.cmd("colorscheme " .. themes[current])
end, {})

vim.keymap.set("n", "<leader>th", "<cmd>ToggleTheme<CR>", { desc = "Toggle Theme" })

return {
  -- Dracula (różowo-fioletowy)
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = true,
        overrides = function(colors)
          return {
            Normal = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            FloatBorder = { bg = "NONE" },
            StatusLine = { bg = "NONE" },
          }
        end,
      })
    end,
  },

  -- Rose Pine (pastelowy róż)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
      })
    end,
  },

  -- Catppuccin (styl pastelowy z profilami)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- mocha = dark
        transparent_background = true,
      })
    end,
  },

  -- TokyoNight (ładny niebieski)
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
      })
    end,
  },

  -- Everforest (zielony, miękki)
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "soft"
      vim.g.everforest_transparent_background = 2
    end,
  },
}
