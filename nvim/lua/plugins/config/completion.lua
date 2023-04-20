local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

local snippet_next_keys = vim.api.nvim_replace_termcodes('<plug>luasnip-expand-or-jump', true, true, true)

lspkind.init {
  symbol_map = {
    Copilot = "",
  },
}

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

local cmp = require('cmp')
local luasnip = require "luasnip"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function()
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },
    ['<C-n>'] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert},
    ['<C-p>'] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert},
    -- ['<Tab>'] = cmp.mapping.confirm({ select = false, behavior=cmp.ConfirmBehavior.Replace  }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.confirm({ select = false, behavior=cmp.ConfirmBehavior.Replace })
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(snippet_next_keys, '')
      else
        fallback()
      end
    end, {
      "i",
      "s",
      "c",
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "copilot" },
		{ name = "treesitter" },
		{ name = "nvim_lsp_signature_help" },
  }, {
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  }, {
    { name = "gh_issues" },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities
--}
--

