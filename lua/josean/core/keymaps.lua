vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- theme
-- golang

keymap.set("n", "<leader>gm", function()
  vim.fn.jobstart("go mod tidy", {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.notify("✅ go mod tidy done", vim.log.levels.INFO)
      end
    end,
    on_stderr = function(_, err)
      if err then
        vim.notify("❌ tidy error:\n" .. table.concat(err, "\n"), vim.log.levels.ERROR)
      end
    end,
  })
end, { desc = "Silent Go mod tidy" })

keymap.set("n", "<leader>gr", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local go_run = Terminal:new({
    cmd = "go run main.go",
    hidden = true,
    direction = "float", -- albo "horizontal", "vertical", "tab"
    close_on_exit = false,
  })
  go_run:toggle()
end, { desc = "Run Go in ToggleTerm" })
-- terminal window
keymap.set("n", "<leader>tt", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local run = Terminal:new({
    cmd = "tmux new-session -s nvim",
    hidden = true,

    direction = "float", -- albo "horizontal", "vertical", "tab"
    close_on_exit = true,
    float_opts = {
      border = "curved",
      width = 100,
      height = 30,
      winblend = 3,
    },
    -- dodaj on :q to zamknie terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.cmd("setlocal nonumber")
      vim.cmd("setlocal norelativenumber")
      vim.cmd("setlocal signcolumn=no")
      vim.cmd("setlocal foldcolumn=0")
      vim.cmd("setlocal foldenable")
      vim.cmd("setlocal foldmethod=manual")
    end,
    on_close = function(term)
      vim.cmd("setlocal number")
      vim.cmd("setlocal relativenumber")
      vim.cmd("setlocal signcolumn=yes")
      vim.cmd("setlocal foldcolumn=1")
      vim.cmd("setlocal foldmethod=expr")
    end,
  })
  run:toggle()
end, { desc = "Toggle terminal" })
