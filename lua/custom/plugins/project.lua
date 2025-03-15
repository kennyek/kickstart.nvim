return {
  {
    'coffebar/neovim-project',
    opts = {
      projects = {
        '~/Dev/*/*',
        '~/.config/nvim',
      },
      picker = {
        type = 'telescope',
      },
    },
    init = function()
      vim.opt.sessionoptions:append 'globals'

      local function discover()
        vim.cmd.NeovimProjectDiscover 'history'
      end

      vim.keymap.set('n', '<leader>sp', discover, { desc = '[S]elect [P]roject' })
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
      { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
  },
}
