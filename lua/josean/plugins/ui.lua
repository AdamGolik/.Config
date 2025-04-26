return {
  -- Wymagane wtyczki
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- Konfiguracja snacks.nvim
  {
    "folke/snacks.nvim",
    opts = {
      -- Skrócenie czasu powiadomień
      notify = {
        timeout = 2000, -- 2 sekundy
        background_colour = "#000000",
        render = "wrapped-compact",
      },
    },
  },

  -- Konfiguracja noice
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = opts.routes or {}

      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      opts.presets = opts.presets or {}
      opts.presets.lsp_doc_border = true

      -- Skrócenie czasu wyświetlania informacji LSP
      opts.views = {
        hover = {
          timeout = 2000, -- 2 sekundy
        },
        cmdline_popup = {
          timeout = 2000, -- 2 sekundy
        },
        notify = {
          timeout = 2000, -- 2 sekundy
        },
      }
    end,
  },

  -- Konfiguracja nvim-notify
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000, -- 2 sekundy
      background_colour = "#000000",
      render = "wrapped-compact",
      stages = "fade_in_slide_out",
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
  },

  -- Konfiguracja bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
}
