return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerToggle", "OverseerRun" },
  keys = {
    { "<leader>rr", function() require("overseer").run_template({ name = "Cargo run" }) end, desc = "Run Rust App" },
    { "<leader>rb", function() require("overseer").run_template({ name = "Cargo build" }) end, desc = "Build Rust App" },
    { "<leader>rt", function() require("overseer").run_template({ name = "Cargo test" }) end, desc = "Test Rust App" },
    { "<leader>ro", "<cmd>OverseerToggle<CR>", desc = "Toggle Task Output" },
  },
  opts = {},
  config = function()
    local overseer = require("overseer")
    overseer.setup()

    -- Rust-specific tasks
    overseer.register_template({
      name = "Cargo run",
      builder = function()
        return {
          cmd = { "cargo" },
          args = { "run" },
          components = { "default" },
        }
      end,
    })

    overseer.register_template({
      name = "Cargo build",
      builder = function()
        return {
          cmd = { "cargo" },
          args = { "build" },
          components = { "default" },
        }
      end,
    })

    overseer.register_template({
      name = "Cargo test",
      builder = function()
        return {
          cmd = { "cargo" },
          args = { "test" },
          components = { "default" },
        }
      end,
    })
  end,
}

