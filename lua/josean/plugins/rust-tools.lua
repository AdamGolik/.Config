return {
  -- Rust tools plugin
  "simrat39/rust-tools.nvim",
  ft = { "rust" },
  config = function()
    local rt = require("rust-tools")

    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          local map = vim.keymap.set
          local opts = { buffer = bufnr }
          map("n", "<leader>ca", rt.code_action_group.code_action_group, opts)
          map("n", "<leader>rr", rt.runnables.runnables, opts)
          map("n", "<leader>dm", rt.debuggables.debuggables, opts)
        end,
      },
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(
          "/path/to/codelldb",
          "/path/to/liblldb.dylib" -- albo .so na Linuxie
        ),
      },
    })
  end,
}
