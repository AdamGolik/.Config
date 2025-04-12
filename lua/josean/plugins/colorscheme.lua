local themes = {
  "catppuccin",
  "dracula",
  "rose-pine",
  "tokyonight",
  "everforest",
  "gruvbox",
  "nord",
  "nightfox",
  "kanagawa",
}

-- Indeks domyślnego motywu (catppuccin)
local current = 1

-- Komenda do przełączania motywu
vim.api.nvim_create_user_command("ToggleTheme", function()
  current = current % #themes + 1
  vim.cmd("colorscheme " .. themes[current])
end, {})

-- Skrót klawiszowy
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTheme<CR>", { desc = "Toggle Theme" })

return {
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
      vim.cmd.colorscheme("catppuccin") -- <-- ustawienie motywu PO załadowaniu pluginu
    end,
  },

  -- Dracula
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    config = function()
      require("dracula").setup({
        transparent_bg = true,
        overrides = function()
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

  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        disable_float_background = true,
        highlight_groups = {
          Normal = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
        },
      })
    end,
  },

  -- TokyoNight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
      })
    end,
  },

  -- Everforest
  {
    "sainnhe/everforest",
    lazy = true,
    config = function()
      vim.g.everforest_background = "soft"
      vim.g.everforest_transparent_background = 2
    end,
  },

  -- Gruvbox
  {
    "morhetz/gruvbox",
    lazy = true,
    config = function()
      vim.g.gruvbox_contrast_dark = "soft"
      vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi NormalFloat guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
      ]])
    end,
  },

  -- Nord
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalFloat guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
      ]])
    end,
  },

  -- Nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },

  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        overrides = function()
          return {
            Normal = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            FloatBorder = { bg = "NONE" },
          }
        end,
      })
    end,
  },
}
