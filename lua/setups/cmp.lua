local CMP = {}

-- LOAD Lua Snip OR lsp-zero before CMP
CMP.load = function()
  return {
    {'hrsh7th/nvim-cmp'},
  }
end

CMP.setup = function()
  local cmp = require('cmp')

  cmp.setup({
    sources = {
      {name = 'nvim_lsp'},
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.confirm({select = true}),
      ['<Esc>'] = cmp.mapping.abort(),
      ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
      ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
      ['<C-p>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item({behavior = 'insert'})
        else
          cmp.complete()
        end
      end),
      ['<C-n>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item({behavior = 'insert'})
        else
          cmp.complete()
        end
      end),
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })
end

return CMP