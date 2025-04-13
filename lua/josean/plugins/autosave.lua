{
  "autofmt-save-on-esc",
  lazy = false,
  config = function()
    -- Autocmd po wyjściu z trybu insert (czyli jak wciśniesz ESC)
    vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
        -- Sprawdza, czy bufor jest zapisywalny
        if vim.bo.modified and vim.bo.modifiable and vim.bo.readonly == false then
          vim.cmd("silent! write")          -- Zapisuje plik
          vim.lsp.buf.format({ async = true })  -- Formatuje (wymaga działającego LSP)
        end
      end,
    })
  end,
}

