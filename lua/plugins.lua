return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      extensions = { 'nvim-dap-ui', 'neo-tree', 'toggleterm' },
    },
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- for git status
      'nvim-tree/nvim-web-devicons', -- for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = function()
      require('barbar').setup {
        animation = false,
      }
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
      map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
      map('n', '<A-p>', '<Cmd>BufferPick<CR>', opts)
    end,
  },
}
