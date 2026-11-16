return {
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
          preset = "helix",
          plugins = {
              marks = true,
              registers = true,
              presets = {
                  operators = true,
                  motions = true,
                  text_objects = true,
                  windows = true,
                  nav = true,
                  z = true,
                  g = true,
              },
          },
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      config = function(_, opts)
          local wk = require("which-key")
          wk.add({
              { "<leader>f", group = "telescope", icon={icon='󰭎', color='blue'} },
              { "<leader>g", group = "git", icon={ icon='', color='orange', }, },
              { "<leader>-", group = "yazi", icon={ icon='󰈔', color='blue', }, },
              { "<leader>n", group = "nerdy", icon={ icon='󰦨', color='blue', }, },
              { "<leader>t", group = "trouble", icon={ icon='', color='red', }, },

              { "<leader>ca", hidden=true, },
              { "<leader>df", hidden=true, },
              { "<leader>rn", hidden=true, },
              { "<leader>fm", hidden=true, },
              { "<leader>hv", hidden=true, },
              { "<leader>rf", hidden=true, },
              { "<leader>ic", hidden=true, },
              { "<leader>oc", hidden=true, },

          })
          wk.setup(opts)
      end,
    }
}
