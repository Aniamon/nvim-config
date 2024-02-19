return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    config = function()
      require('luasnip.loaders.from_snipmate').lazy_load()
      require('luasnip').config.setup {}
    end,
  },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'onsails/lspkind.nvim' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-emoji' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'hrsh7th/cmp-nvim-lsp' },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
          { name = 'emoji' },
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = {
          ['<cr>'] = cmp.mapping.confirm { select = true },
          ['<s-tab>'] = cmp.mapping.select_prev_item(),
          ['<tab>'] = cmp.mapping.select_next_item(),
          ['<A-j>'] = cmp.mapping.scroll_docs(4),
          ['<A-k>'] = cmp.mapping.scroll_docs(-4),
        },
        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = false,
            before = function(entry, item)
              item.menu = ({
                nvim_lsp = '[LSP]',
                luasnip = '[Snip]',
                path = '[Path]',
                emoji = '[^^]',
              })[entry.source.name]
              return item
            end,
          },
        },
      }
    end,
  },
}
