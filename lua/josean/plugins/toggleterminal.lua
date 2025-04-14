return -- Terminal: Toggleterm
{
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]], -- Ustawienia klawisza otwierania terminala
      direction = "float", -- Typ terminala (może być 'horizontal', 'vertical', 'float')
      shade_filetypes = {},
      transparent = true,
      shade_terminals = true, -- Ciemne tło dla terminala
      highlights = {
        border = "Normal", -- Kolor granicy terminala
        background = "Normal", -- Kolor tła
      },
    })
  end,
}
