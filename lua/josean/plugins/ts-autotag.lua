return {
  {
    "windwp/nvim-ts-autotag",
    opts = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
      },
    },
    event = "InsertEnter",
  },
}