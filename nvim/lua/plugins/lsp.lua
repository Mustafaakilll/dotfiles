local lspconfig = require 'lspconfig'
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local function disable_formatting(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  on_attach(client, bufnr)
end

local function enable_formatting(client, bufnr)
  client.resolved_capabilities.document_formatting = true
  client.resolved_capabilities.document_range_formatting = true
  on_attach(client, bufnr)
end

on_attach = function(client, bufnr)
  -- Setup lspconfig.
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- autocmd BufWritePre * :!{bash -c "while ![ -e $1 ]; do echo $1; sleep 0.1s; done"} %:p
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
    augroup LspFormatting
    autocmd! * <buffer>
    autocmd BufWritePre * sleep 200m
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
    augroup END
    ]])
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', "<space>lr", "<cmd>lua R('plugins.lsp.codelens').run()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>aw', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = { 'dockerls', 'jsonls', 'pyright', 'sumneko_lua', 'dartls', 'tsserver', 'eslint', 'quick_lint_js', 'yamlls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Loop through the servers listed above.
for _, name in pairs(servers) do
  local available, server = lsp_installer_servers.get_server(name)

  if available then
    server:on_ready(function()

      -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
      -- the resolved capabilities of the eslint server ourselves!
      --
      -- if server.name == "eslint" then on_attach = enable_formatting end

      -- Disable formatting for typescript, so that eslint can take over.
      --
      -- if server.name == 'tsserver' then on_attach = disable_formatting end
      -- if server.name == 'denols' then on_attach = disable_formatting end

      server:setup(opts)
    end)

    -- Queue the server to be installed.
    if not server:is_installed() then server:install() end

  end
end

lspconfig.dartls.setup {
  filetypes = { "dart" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = false,
    outline = true,
    suggestFromUnimportedLibraries = true,
    codelens = {
      test = true,
    }
  },
  settings = {
    dart = {
      lineLength = 120,
      enableSdkFormatter = true,
      completeFunctionCalls = true,
      showTodos = true
    }
  }
}
