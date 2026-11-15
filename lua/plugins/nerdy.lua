return {
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
        opts = {
            max_recents = 30, -- Configure recent icons limit
            copy_to_clipboard = false, -- Copy glyph to clipboard instead of inserting
            copy_register = '+', -- Register to use for copying (if `copy_to_clipboard` is true)
            picker = 'auto', -- 'auto' (default) | 'snacks' | 'fzf-lua' | 'telescope' | 'select'
        },
        keys = {
            { '<leader>nl', '<cmd>Nerdy list<CR>', desc = "Browse nerd icons" },
            { '<leader>nn', '<cmd>Nerdy recents<CR>', desc = "Browse recent nerd icons" },
        },
    }
}
