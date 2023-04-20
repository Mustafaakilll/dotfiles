local inlays = require "plugins.config.inlay"
local handlers = require "plugins.config.handler"

local neodev = vim.F.npcall(require, "neodev")
if neodev then
  neodev.setup {
    override = function(_, library)
      library.enabled = true
      library.plugins = true
    end,
  }
end

local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
  return
end

local map = vim.keymap.set
local ts_util = require "nvim-lsp-ts-utils"


local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })
local augroup_codelens = vim.api.nvim_create_augroup("custom-lsp-codelens", { clear = true })
local augroup_format = vim.api.nvim_create_augroup("custom-lsp-format", { clear = true })
local autocmd_clear = vim.api.nvim_clear_autocmds

local autocmd_format = function(async, filter)
  vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    callback = function()
      vim.lsp.buf.format { async = async, filter = filter }
    end,
  })
end

local filetype_attach = setmetatable({
  go = function()
    autocmd_format(false)
  end,
  dart = function()
    autocmd_format(false)
  end,
  lua = function()
    autocmd_format(false)
  end,
  rust = function()
    vim.keymap.set("n", "<leader>wf", ":Telescope lsp_workspace_symbols ignore_filename=true query='#'",
      { buffer = true })

    autocmd_format(false)
  end,
  typescript = function()
    autocmd_format(false, function(client)
      return client.name ~= "tsserver"
    end)
  end,
}, {
  __index = function()
    return function()
    end
  end,
})

local custom_attach = function(client, bufnr)
  if client.name == "copilot" then
    return
  end

  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  map('i', "<C-s>", vim.lsp.buf.signature_help)

  map('n', "<leader>rn", vim.lsp.buf.rename)
  map('n', "<leader>ca", vim.lsp.buf.code_action)

  map('n', "gd", vim.lsp.buf.definition)
  map('n', "gD", vim.lsp.buf.declaration)
  map('n', "gT", vim.lsp.buf.type_definition)
  map('n', "K", vim.lsp.buf.hover, { desc = "lsp:hover" })

  map("n", "]e", ":lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>")
  map("n", "[e", ":lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>")

  map('n', "<leader>gI", handlers.implementation)
  map('n', "<leader>lr", ":lua R('plugins.config.codelens').run()<CR>")

  map('n', 'gr', ':Telescope lsp_references<cr>')
  map('n', 'gi', ':Telescope lsp_implementations<cr>')

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    autocmd_clear { group = augroup_highlight, buffer = bufnr }
    vim.api.nvim_create_autocmd { "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, bufnr }
    vim.api.nvim_create_autocmd { "CursorMoved", augroup_highlight, vim.lsp.buf.clear_references, bufnr }
  end

  if false and client.server_capabilities.codeLensProvider then
    if filetype ~= "elm" then
      autocmd_clear { group = augroup_codelens, buffer = bufnr }
      vim.api.nvim_create_autocmd { "BufEnter", augroup_codelens, vim.lsp.codelens.refresh, bufnr, once = true }
      vim.api.nvim_create_autocmd { { "BufWritePost", "CursorHold" }, augroup_codelens, vim.lsp.codelens.refresh, bufnr }
    end
  end

  if filetype == "tsserver" then
    client.server_capabilities.semanticTokensProvider = nil
  end

  filetype_attach[filetype]()
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }

local servers = {
  bashls = true,
  eslint = true,
  vimls = true,
  yamlls = true,
  cmake = (1 == vim.fn.executable "cmake-language-server"),
  dartls = pcall(require, "flutter-tools"),
  gopls = {
    settings = {
      gopls = {
        codelenses = { test = true, },
        hints = inlays and {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            } or nil,
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
  },
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        inlayHints = inlays and {
          parameterHints = { enable = true },
          typeHints = { enable = true, hideClosureInitialization = true },
          chainingHints = { enable = true },
        },
        procMacro = { enable = true },
        check_on_save = { command = 'clippy' },
        cargo = { allFeatures = true },
        diagnostics = { enable = true }
      }
    }
  },
  tsserver = {
    init_options = ts_util.init_options,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "typescript" },
    on_attach = function(client)
      custom_attach(client)

      ts_util.setup { auto_inlay_hints = false }
      ts_util.setup_client(client)
    end,
  },
}


require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls" },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = nil,
    },
  }, config)

  lspconfig[server].setup(config)
end

require("lspconfig").lua_ls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
  settings = {
    Lua = { workspace = { checkThirdParty = false }, semantic = { enable = false } },
  },
}

for server, config in pairs(servers) do
  setup_server(server, config)
end

require("null-ls").setup {
  sources = {
    require("null-ls").builtins.diagnostics.eslint,
  },
}

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
