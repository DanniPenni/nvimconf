-- Editor setings 
vim.o.wrap = false
vim.o.number = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
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
vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy find string in current buffer' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope old files' })

-- Treesitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'python', 'cpp', 'c', 'rust', 'javascript', 'lua', 'zsh', 'editorconfig', 'dockerfile'},
  callback = function()
      vim.treesitter.start()
      -- indentation, provided by nvim-treesitter
      -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Diagnostic 
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  virtual_lines = false,
  jump = { float = true },
  float = {
    header = false,
    border = 'rounded',
    focusable = false,
    scope = 'cursor',
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
  },
})


---@param jumpCount number
local function centreJump(jumpCount)
	pcall(vim.api.nvim_del_augroup_by_name, "centreJump") -- prevent autocmd for repeated jumps
	vim.diagnostic.jump { count = jumpCount }
  vim.cmd("normal! zz")
end

vim.keymap.set("n", "]d", function() centreJump(1) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() centreJump(-1) end, { desc = "Prev diagnostic" })

-- LSP

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup("ruff-basedpyright-setup", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end

    -- LSP keybinds
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { buffer=ev.buf, desc='Code actions' } )
    vim.keymap.set('n', '<leader>df', vim.lsp.buf.definition, { buffer=ev.buf, desc='Definitions' } )
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer=ev.buf, desc='Rename symbol' } )
    vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, { buffer=ev.buf, desc='Format buffer' } )
    vim.keymap.set('n', '<leader>hv', vim.lsp.buf.hover, { buffer=ev.buf, desc='Hover symbol' } )
    vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, { buffer=ev.buf, desc='References' } )
    vim.keymap.set('n', '<leader>ic', vim.lsp.buf.incoming_calls, { buffer=ev.buf, desc='Incoming calls' } )
    vim.keymap.set('n', '<leader>oc', vim.lsp.buf.outgoing_calls, { buffer=ev.buf, desc='Outgoing calls' } )

  end,
})
