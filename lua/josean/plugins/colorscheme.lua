-- ~/.config/nvim/lua/colorscheme.lua

return {
  -- Aurora (pomarańczowy, przezroczysty)
  {
    "ray-x/aurora",
    name = "aurora",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
      vim.g.aurora_darker = 1
    end,
  },

  -- Catppuccin (mocha, przezroczysty)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          treesitter = true,
          cmp = true,
          telescope = true,
          which_key = true,
        },
      })
    end,
  },

  -- Gruvbox (przezroczysty)
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({ transparent_mode = true })
    end,
  },

  -- Tokyo Night (przezroczysty)
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = { sidebars = "transparent", floats = "transparent" },
      })
    end,
  },

  -- Dracula (przezroczysty)
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({ transparent_bg = true })
    end,
  },

  -- One Dark (przezroczysty)
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({ style = "darker", transparent = true })
    end,
  },

  -- Nightfox (przezroczysty)
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({ options = { transparent = true } })
    end,
  },

  -- Kanagawa (przezroczysty)
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({ transparent = true })
    end,
  },

  -- Rose Pine (przezroczysty)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        dark_variant = "main",
        disable_background = true,
        disable_float_background = true,
      })
    end,
  },

  -- Material (przezroczysty)
  {
    "marko-cerovac/material.nvim",
    name = "material",
    lazy = false,
    priority = 1000,
    config = function()
      require("material").setup({
        contrast = true,
        italics = true,
        transparent_background = true,
      })
    end,
  },

  -- Nord (przezroczysty)
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = true
    end,
  },

  -- Monokai Pro (przezroczysty)
  {
    "loctvl842/monokai-pro.nvim",
    name = "monokai-pro",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({ transparent_background = true })
    end,
  },

  -- Everforest (przezroczysty)
  {
    "sainnhe/everforest",
    name = "everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "soft"
      vim.g.everforest_transparent_background = 2
    end,
  },

  -- Sonokai (przezroczysty)
  {
    "sainnhe/sonokai",
    name = "sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_transparent_background = 1
    end,
  },

  -- Ayu (przezroczysty)
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({ mirage = true })
      vim.cmd("let ayu_theme='mirage'")
      vim.cmd("let ayu_background='transparent'")
    end,
  },

  -- Theme Switcher
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          { name = "aurora", colorscheme = "aurora" },
          { name = "catppuccin", colorscheme = "catppuccin" },
          { name = "gruvbox", colorscheme = "gruvbox" },
          { name = "tokyonight", colorscheme = "tokyonight" },
          { name = "dracula", colorscheme = "dracula" },
          { name = "onedark", colorscheme = "onedark" },
          { name = "nightfox", colorscheme = "nightfox" },
          { name = "kanagawa", colorscheme = "kanagawa" },
          { name = "github", colorscheme = "github" },
          { name = "rose-pine", colorscheme = "rose-pine" },
          { name = "material", colorscheme = "material" },
          { name = "nord", colorscheme = "nord" },
          { name = "monokai-pro", colorscheme = "monokai-pro" },
          { name = "everforest", colorscheme = "everforest" },
          { name = "sonokai", colorscheme = "sonokai" },
          { name = "ayu", colorscheme = "ayu" },
        },
        themeConfigFile = vim.fn.stdpath("config") .. "/lua/theme.lua",
      })

      -- Skrót do przełączania motywów
      vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Przełącz motyw" })
    end,
  },
}
