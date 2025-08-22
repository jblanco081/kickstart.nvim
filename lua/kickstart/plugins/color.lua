return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    config = function()
      vim.o.termguicolors = true
      vim.cmd 'colorscheme carbonfox'
    end,
  },
}
