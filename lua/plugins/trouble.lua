return {
    {
      "folke/trouble.nvim",
      cmd = "Trouble",
      opts = {

      },
      keys = {
          {
              "<leader>tt",
              "<cmd>Trouble diagnostics toggle focus=true pinned=true filter.buf=0<cr>",
              desc = "Open trouble diagnostics for current buffer."
          },
          {
              "<leader>te",
              "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR focus=true pinned=true filter.buf=0<cr>",
              desc = "Open trouble diagnostics for current buffer."
          },
          {
              "<leader>tl",
              "<cmd>Trouble lsp pinned=true filter.buf=0<cr>",
              desc = "Open LSP for current buffer.",
          },
      },
    }
}
