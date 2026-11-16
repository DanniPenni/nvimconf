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

          vim.lsp.config('lua_ls', {
            settings = {
              Lua = {
                diagnostics = {
                  disable = { "missing-fields" },
                  globals = { "vim" },
                },
              }
            }
          })
          vim.lsp.enable('lua_ls')

          vim.lsp.config('ruff', {
            init_options = {
              settings = {
               lint = {
                 enable = false, -- remove to enable ruff linting.
               },
             },
           }
          })

          vim.lsp.config('basedpyright', {
           settings = {
             basedpyright = {
               disableOrganizeImports = true,
               -- analysis = { ignore = { '*' } } to defer to RUFF linter.
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
