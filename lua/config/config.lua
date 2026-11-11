-- Editor setings 
vim.o.wrap = false 
vim.o.number = true

vim.o.tabstop = 4 
vim.o.softtabstop = 4 
vim.o.shiftwidth = 4
vim.opt.expandtab = true

vim.o.smartcase = true
vim.o.ignorecase = true 

vim.o.hlsearch = false 

-- Keymaps 
vim.g.mapleader = vim.keycode('<Space>')

-- Telescope 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep selected string' })
vim.keymap.set('n', '<leader>fls', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy find string in current buffer' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope old files' })

-- Treesitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'lua', 'c', 'c++' },
  callback = function()
      vim.treesitter.start()
  end,
})
