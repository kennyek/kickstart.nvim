return {
  {
    'olimorris/codecompanion.nvim',
    opts = {},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      vim.keymap.set('n', '<leader>cc', function()
        require('codecompanion').toggle()
      end, { noremap = true, silent = true, desc = 'Open CodeCompanion Chat' })
    end,
  },
}
