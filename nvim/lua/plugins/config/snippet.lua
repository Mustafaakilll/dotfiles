local luasnip = require "luasnip"
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_vscode').lazy_load({paths='./snippets/textmate'})

vim.keymap.set("i", "<c-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)

luasnip.filetype_extend('typescript')
luasnip.filetype_extend('javascript')
luasnip.filetype_extend('dart', { 'flutter' })
luasnip.filetype_extend('docker')
luasnip.filetype_extend('docker-compose')
luasnip.filetype_extend('go')
luasnip.filetype_extend('rust')

