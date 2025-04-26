return {
  -- Rust tools plugin
  "simrat39/rust-tools.nvim",
  ft = { "rust" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    local rt = require("rust-tools")
    local mason_registry = require("mason-registry")

    -- Get the path to codelldb from Mason
    local codelldb_path = mason_registry.get_package("codelldb"):get_install_path()
    local liblldb_path = vim.fn.has("mac") == 1
        and vim.fn.glob(codelldb_path .. "/extension/adapter/*")
        or vim.fn.glob(codelldb_path .. "/extension/adapter/codelldb")

    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          local map = vim.keymap.set
          local opts = { buffer = bufnr, silent = true }

          -- LSP keymaps
          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "<leader>ca", rt.code_action_group.code_action_group, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
          map("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
          map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
          map("n", "<leader>dl", vim.diagnostic.setloclist, opts)
          map("n", "[d", vim.diagnostic.goto_prev, opts)
          map("n", "]d", vim.diagnostic.goto_next, opts)

          -- Rust specific keymaps
          map("n", "<leader>rr", rt.runnables.runnables, opts)
          map("n", "<leader>dm", rt.debuggables.debuggables, opts)
          map("n", "<leader>rc", rt.crate_graph.view_crate_graph, opts)
          map("n", "<leader>rm", rt.expand_macro.expand_macro, opts)
          map("n", "<leader>ro", rt.open_cargo_toml.open_cargo_toml, opts)
          map("n", "<leader>rp", rt.parent_module.parent_module, opts)
          map("n", "<leader>rj", rt.join_lines.join_lines, opts)
          map("n", "<leader>rh", rt.hover_actions.hover_actions, opts)
          map("n", "<leader>rH", rt.hover_range.hover_range, opts)
          map("n", "<leader>ri", rt.inlay_hints.set, opts)
          map("n", "<leader>rI", rt.inlay_hints.unset, opts)
          map("n", "<leader>rd", rt.debuggables.debuggables, opts)
        end,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            inlayHints = {
              enable = true,
            },
          },
        },
      },
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(
          liblldb_path,
          vim.fn.has("mac") == 1
              and vim.fn.glob(codelldb_path .. "/extension/lldb/lib/liblldb.dylib")
              or vim.fn.glob(codelldb_path .. "/extension/lldb/lib/liblldb.so")
        ),
      },
      tools = {
        inlay_hints = {
          auto = true,
          show_parameter_hints = true,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = "=> ",
        },
        hover_actions = {
          auto_focus = true,
        },
      },
    })
  end,
}
