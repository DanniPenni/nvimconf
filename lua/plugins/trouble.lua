return {
    {
      "folke/trouble.nvim",
      cmd = "Trouble",
      opts = {

      },
      keys = {
          {
              "<leader>xx",
              "Trouble diagnostics toggle pinned=true filter.buf=0",
              desc = "Open trouble diagnostics for current buffer."
          },
          {
              "<leader>xl",
              "Trouble lsp pinned=true filter.buf=0",
              desc = "Open LSP for current buffer.",
          },
      },
    }
}
