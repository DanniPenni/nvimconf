return {
    { 'nvim-mini/mini.ai', version = false,
      config = function() 
          require('mini.ai').setup({})
      end,
    },
    { 'nvim-mini/mini.comment', version = false,
      config = function() 
          require('mini.comment').setup({})
      end,
    },
    { 'nvim-mini/mini.basics', version = false,
      config = function() 
          require('mini.basics').setup({})
      end,
    },
}
