return {
  { 'williamboman/mason.nvim', config = true },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'rust_analyzer',
        'gopls',
        'solidity_ls_nomicfoundation',
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local settings = {
        -- ['rust-analyzer'] = {
        --   check = { command = 'clippy' },
        -- },
      }
      require('mason-lspconfig').setup_handlers {
        function(server)
          lspconfig[server].setup {
            capabilities = capabilities,
            settings = settings,
          }
        end,
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.rustfmt,
        },
      }
      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local trouble = require 'trouble'
      trouble.setup()
      vim.keymap.set('n', '<leader>xx', trouble.toggle, {})
    end,
  },
}
