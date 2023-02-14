local packer = nil
require 'impatient'

local function make_mapper(mode, o)
  local parent_opts = vim.deepcopy(o)
  return function(lhs, rhs, opts)
    opts = type(opts) == 'string' and { desc = opts } or opts and vim.deepcopy(opts) or {}
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('keep', opts, parent_opts))
  end
end
local map_opts = { remap = true, silent = true }
local noremap_opts = { silent = true }

local inoremap = make_mapper('i', noremap_opts)
local imap = make_mapper('i', map_opts)

local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init { disable_commands = true }
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- These three plugins make CodeArt startup faster.
  use 'antoinemadec/FixCursorHold.nvim'
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'

  -- IDK WHAT ARE THESE
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Indentation tracking
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugins.indent-blankline') end }

  -- Pretty symbols
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.nvim-tree') end
  }

  -- Auto Pairs
  use { 'windwp/nvim-autopairs', config = function() require('plugins.nvim-autopairs') end }

  -- Syntax Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'romgrk/nvim-treesitter-context',
    },
    run = ':TSUpdate',
    config = function() require('plugins.treesitter') end
  }

  -- LSP
  use { 'neovim/nvim-lspconfig', config = function() require('plugins.lsp') end }
  use { 'ray-x/lsp_signature.nvim', after = "nvim-lspconfig", config = function() require('plugins.lsp-signature') end }
  use { 'williamboman/nvim-lsp-installer', config = function() require('plugins.lsp-installer') end }
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' } }

  use({
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      -- imap('<Plug>(as-copilot-accept)', "call copilot#Accept('<Tab>')", { expr = true })
      -- inoremap('<M-]>', '<Plug>(copilot-next)')
      -- inoremap('<M-[>', '<Plug>(copilot-previous)')
      -- inoremap('<C-\\>', '<Cmd>vertical Copilot panel<CR>')
      vim.cmd([[
        imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
      ]])
      vim.g.copilot_filetypes = {
        ['*'] = true,
        gitcommit = false,
        NeogitCommitMessage = false,
        DressingInput = false,
        TelescopePrompt = false,
        ['neo-tree-popup'] = false,
      }
      vim.g.copilot_enabled = true

    end,
  })

  -- Completion and Snippets
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      'lukas-reineke/cmp-under-comparator',
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
    },
    config = function() require('plugins.cmp') end,
    event = 'InsertEnter *',
  }
  use 'L3MON4D3/LuaSnip'

  -- statusline
  use { 'famiu/feline.nvim', config = function() require('plugins.feline') end }

  -- Color scheme
  use { 'navarasu/onedark.nvim', config = function() require('plugins.onedark') end }
  use 'marko-cerovac/material.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'sainnhe/gruvbox-material'
  use "EdenEast/nightfox.nvim"
  use 'rmehri01/onenord.nvim'
  use "rebelot/kanagawa.nvim"
  use {
    'uloco/bluloco.nvim',
    requires = { 'rktjmp/lush.nvim' },
    config = function() require('plugins.bluloco') end
  }
  use {
    'NTBBloodbath/doom-one.nvim',
    -- config = function()
    --   require('doom-one').setup({
    --     cursor_coloring = false,
    --     terminal_colors = false,
    --     italic_comments = false,
    --     enable_treesitter = true,
    --     transparent_background = false,
    --     pumblend = {
    --       enable = true,
    --       transparency_amount = 20,
    --     },
    --     plugins_integrations = {
    --       neorg = true,
    --       barbar = true,
    --       bufferline = false,
    --       gitgutter = false,
    --       gitsigns = true,
    --       telescope = false,
    --       neogit = true,
    --       nvim_tree = true,
    --       dashboard = true,
    --       startify = true,
    --       whichkey = true,
    --       indent_blankline = true,
    --       vim_illuminate = true,
    --       lspsaga = false,
    --     },
    --   })
    -- end,
  }

  -- Buffer management
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.bufferline') end,
  }

  -- Git
  use { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' } }
  use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
  use { 'TimUntersberger/neogit', cmd = 'Neogit', config = function() require('neogit').setup {} end }

  -- TODO Highlight
  use { 'folke/todo-comments.nvim', requires = "nvim-lua/plenary.nvim", config = function() require('plugins.todo') end }

  -- Commenting
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup {} end }

  -- Trouble
  use { 'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons",
    config = function() require('plugins.trouble') end }

  -- Wrapping/delimiters
  use 'tpope/vim-surround'

  -- Visual improvements
  use 'mg979/vim-visual-multi'

  use 'nacro90/numb.nvim'

  -- Notification
  use { 'rcarriga/nvim-notify', config = function() require('notify').setup { render = 'minimal' } end }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',

    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'telescope-frecency.nvim',
      'telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-fzf-writer.nvim',
      'nvim-telescope/telescope-github.nvim',
      'nvim-telescope/telescope-hop.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-file-browser.nvim'
    },

    wants = {
      'popup.nvim',
      'plenary.nvim',
      'telescope-frecency.nvim',
      'telescope-fzf-native.nvim',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      config = function() require 'telescope'.load_extension('frecency') end,
      requires = 'tami5/sql.nvim',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
    config = function() require('plugins/telescope') end,
    setup = function() require('plugins/telescope_setup') end,
    cmd = 'Telescope',
    module = 'telescope',
  }

  -- Flutter and Dart Plugins
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',
    config = function() require('plugins.flutter-tools') end }
  use 'thosakwe/vim-flutter'
  use 'dart-lang/dart-vim-plugin'

  -- Markdown
  use { 'iamcco/markdown-preview.nvim', ft = 'markdown', run = 'cd app && yarn install' }

  -- Undo helper
  use 'sjl/gundo.vim'

  -- Quick fix menu
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }


  -- Project Management/Sessions
  use {
    'dhruvasagar/vim-prosession',
    after = 'vim-obsession',
    requires = { { 'tpope/vim-obsession', cmd = 'Prosession' } },
  }

    use {
      "prettier/vim-prettier",
      ft = { "javascript", "typescript" },
      run = "yarn install",
    }

end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins

