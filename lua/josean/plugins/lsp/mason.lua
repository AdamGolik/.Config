return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    -- Initialize Mason
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local null_ls = require("null-ls")

    -- Setup Mason UI
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Setup Mason LSP configuration
    mason_lspconfig.setup({
      ensure_installed = {
        -- Web Development
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "prismals",
        "graphql",
        
        -- JavaScript/TypeScript
        "tsserver",
        "eslint",
        "svelte",
        
        -- Backend
        "rust_analyzer",
        "gopls",
        "pyright",
        
        -- Other
        "lua_ls",
        "jsonls",
        "yamlls",
      },
      automatic_installation = true,
    })

    -- Setup Mason Tool Installer
    mason_tool_installer.setup({
      ensure_installed = {
        -- Formatters
        "prettier",
        "stylua",
        "rustfmt",
        "gofumpt",
        "goimports",
        "golines",
        "black",
        "isort",
        "clang-format",
        
        -- Linters
        "eslint_d",
        "golangci-lint",
        "pylint",
        
        -- Debuggers
        "codelldb",
        
        -- Language Servers
        "typescript-language-server",
      },
      auto_update = true,
      run_on_start = true,
    })

    -- Setup Null-LS
    null_ls.setup({
      sources = {
        -- Go
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        
        -- Rust
        null_ls.builtins.formatting.rustfmt,
        
        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.pylint,
        
        -- JavaScript/TypeScript
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint_d,
        
        -- Lua
        null_ls.builtins.formatting.stylua,
        
        -- C/C++
        null_ls.builtins.formatting.clang_format,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
