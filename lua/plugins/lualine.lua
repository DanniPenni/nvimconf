return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = {
          require("noice").api.statusline.mode.get,
        },
      },
    })
  end,
}
