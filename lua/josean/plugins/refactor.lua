return {
  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        desc = "Incremental rename",
        mode = "n",
        noremap = true,
        expr = true,
      },
    },
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor({
            show_success_message = true,
          })
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  -- Golang configuration
  {
    "fatih/vim-go", -- Go support
    ft = "go", -- Only load for Go files
    config = function()
      -- Add your Go-specific configurations here
      vim.g.go_fmt_command = "goimports" -- Example: use goimports for formatting
    end,
  },

  -- JavaScript/TypeScript (tsx) configuration
  {
    "pangloss/vim-javascript", -- JavaScript support
    ft = { "javascript", "typescript", "typescriptreact" }, -- JavaScript/TS/TSX support
    config = function()
      -- Add your JS/TS/TSX-specific configurations here
      vim.g.javascript_plugin_jsdoc = 1 -- Example: Enable JSDoc for JavaScript
    end,
  },

  {
    "leafgarland/typescript-vim", -- TypeScript support
    ft = { "typescript", "typescriptreact" },
    config = function()
      -- Add your TypeScript-specific configurations here
      vim.g.typescript_plugin = 1 -- Example: Enable TypeScript plugin
    end,
  },
}
