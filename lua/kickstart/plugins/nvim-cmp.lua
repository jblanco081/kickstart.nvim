-- plugins/nvim-cmp.lua
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm { select = true }
          elseif require('luasnip').expand_or_jumpable() then
            require('luasnip').expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      },
    }
  end,
}
