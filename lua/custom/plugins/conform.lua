return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'biome_if_configured', 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'biome_if_configured', 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'biome_if_configured', 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'biome_if_configured', 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'biome_if_configured', 'prettierd', 'prettier', stop_after_first = true },
    },
    formatters = {
      biome_if_configured = {
        inherit = false,
        command = 'biome',
        args = { 'format', '--stdin-file-path', '$FILENAME' },
        stdin = true,
        condition = function(ctx)
          local biome_config = vim.fs.find('biome.json', { upward = true, path = ctx.filename, type = 'file' })
          return #biome_config > 0
        end,
      },
    },
  },
}
