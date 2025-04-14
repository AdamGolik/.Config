return {
  "iabdelkareem/csharp.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "Tastyep/structlog.nvim",
  },
  config = function()
    require("mason").setup()
    require("csharp").setup()

    local map = vim.keymap.set

    -- LSP keybinds
    map("n", "<leader>cngd", vim.lsp.buf.definition, { desc = "C#: Go to definition" })
    map("n", "<leader>cngr", vim.lsp.buf.references, { desc = "C#: Find references" })
    map("n", "<leader>cngi", vim.lsp.buf.implementation, { desc = "C#: Go to implementation" })
    map("n", "<leader>cnK", vim.lsp.buf.hover, { desc = "C#: Hover documentation" })
    map("n", "<leader>cnrn", vim.lsp.buf.rename, { desc = "C#: Rename symbol" })
    map("n", "<leader>cnca", vim.lsp.buf.code_action, { desc = "C#: Code actions" })
    map("n", "<leader>cnf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "C#: Format document" })

    -- DAP keybinds
    map("n", "<leader>cn<F5>", function()
      require("dap").continue()
    end, { desc = "C#: Debug: Continue" })
    map("n", "<leader>cn<F10>", function()
      require("dap").step_over()
    end, { desc = "C#: Debug: Step over" })
    map("n", "<leader>cn<F11>", function()
      require("dap").step_into()
    end, { desc = "C#: Debug: Step into" })
    map("n", "<leader>cn<F12>", function()
      require("dap").step_out()
    end, { desc = "C#: Debug: Step out" })
    map("n", "<leader>cnbp", function()
      require("dap").toggle_breakpoint()
    end, { desc = "C#: Toggle breakpoint" })
    map("n", "<leader>cnbc", function()
      require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "C#: Conditional breakpoint" })

    -- dotnet CLI commands
    map("n", "<leader>cnb", function()
      vim.cmd("!dotnet build")
    end, { desc = "C#: dotnet build" })
    map("n", "<leader>cnt", function()
      vim.cmd("!dotnet test")
    end, { desc = "C#: dotnet test" })
    map("n", "<leader>cnr", function()
      vim.cmd("!dotnet run")
    end, { desc = "C#: dotnet run" })

    -- Optional: notify after command
    -- (You can also wrap dotnet commands with vim.notify if you want to show results in Neovim)
  end,
}
