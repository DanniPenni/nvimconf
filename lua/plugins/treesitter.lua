return {
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate',
      config = function()
        require('nvim-treesitter').setup({
                ensure_installed = {'python', 'cpp', 'c', 'rust', 'javascript', 'lua', 'zsh', 'editorconfig', 'dockerfile' },
                sync_install = false,
                auto_isntall = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
        })
      end,
    },
}
