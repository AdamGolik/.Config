return {
  "Saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- luasnip integration
    "rafamadriz/friendly-snippets", -- ready-to-use snippets
  },
  opts = function()
    local cmp = require("blink.cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = cmp.defaults.format,
      },
      -- W BLINK NIE MA cmp.mapping! Jeśli chcesz mapowania, musisz ustawić osobno.
    })

    -- TERAZ: osobne mapowania klawiszy dla sugestii
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, expr = true }

    map("i", "<C-k>", "pumvisible() ? '<C-p>' : '<C-k>'", opts)
    map("i", "<C-j>", "pumvisible() ? '<C-n>' : '<C-j>'", opts)
    map("i", "<C-b>", "pumvisible() ? '<PageUp>' : '<C-b>'", opts)
    map("i", "<C-f>", "pumvisible() ? '<PageDown>' : '<C-f>'", opts)
    map("i", "<C-e>", "pumvisible() ? '<C-e>' : '<C-e>'", opts)
    map("i", "<CR>", "pumvisible() ? '<C-y>' : '<CR>'", opts)
  end,
}
