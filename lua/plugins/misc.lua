return {
  { 'tpope/vim-surround' },
  { 'tpope/vim-sleuth' },
  { 'typicode/bg.nvim', lazy = false },
  { 'numToStr/Comment.nvim', config = true },
  { 'windwp/nvim-autopairs', config = true },
  {
    'sontungexpt/url-open',
    config = function()
      require('url-open').setup {
        highlight_url = {
          cursor_move = {
            fg = 'text',
          },
        },
      }
      vim.keymap.set('n', 'gx', '<CMD>URLOpenUnderCursor<CR>', { silent = true })
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '┊' },
      scope = { enabled = false },
    },
  },
}
