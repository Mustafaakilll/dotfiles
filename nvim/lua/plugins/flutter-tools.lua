require("flutter-tools").setup {
  ui = { border = "rounded" },
  decorations = { statusline = { app_version = true, device = true } },
  debugger = { enabled = false, run_via_dap = false },
  flutter_path = "/opt/flutter/bin/flutter",
  widget_guides = { enabled = true },
  closing_tags = { enabled = true, highlight = 'Comment', prefix = '//' },
  outline = { open_cmd = "30vnew", auto_open = true },
  lsp = {
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = false,
      suggestFromUnimportedLibraries = true,
      closingLabels = true,
      outline = true,
      flutterOutline = true,
    },
    color = { -- show the derived colours for dart variables
      enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    capabilities = function(config)
      config.specificThingIDontWant = true
      return config
    end,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = { "/opt/flutter/bin/flutter" },
      lineLength = 120,
      enableSdkFormatter = true,
      enableSnippets = true,
    }
  }
}

require('telescope').load_extension('flutter')
