return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame_opts = {
        delay = 500,
      },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = '<C-;>',
        shade_terminals = false,
        direction = 'float',
      }
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

      vim.keymap.set({ 'n', 't' }, '<C-g>', function()
        lazygit:toggle()
      end, {})
    end,
  },
}
