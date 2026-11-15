return {
    {
        'neovim/nvim-lspconfig',
    }, 
    {
        'mason-org/mason.nvim',
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
            },
        },
    }, 
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = { 
          'neovim/nvim-lspconfig',
          'mason-org/mason.nvim',
        },

        config = function()
          require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'rust_analyzer', 'clangd', 'dockerls', 'docker_compose_language_service', 'basedpyright', 'ruff' }
          })

          vim.lsp.config('basedpyright', {
           settings = {
             basedpyright = {
               analysis = {
                 useLibraryCodeForTypes = true,
                 typeCheckingMode = 'basic',
                 diagnosticMode = 'workspace',
                 autoSearchPath = true,
                 inlayHints = {
                   callArgumentNames = true,
                 },
                 extraPaths = {
                     '...',
                     '...',
                 },
               },
               python = {
                 venvPath = '/path/to/venv',
                 venv = 'venv',
               },
             },
           },
          })

          vim.lsp.enable('basedpyright')
        end,
    },
}
