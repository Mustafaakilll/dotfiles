require("flutter-tools").setup {
  ui = {
    border = "rounded",
    notification_style = 'nvim-notify',
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
  debugger = {
    enabled = false,
    run_via_dap = false,
    exception_breakpoints = {},
    register_configurations = function(paths)
      -- require("dap").configurations.dart = {}
    end,
  },
  flutter_path = "/opt/flutter/bin/flutter",
  fvm = false,
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "Comment",
    -- TODO: Change this to anything
    prefix = "> ",
    enabled = true
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit",
  },
  dev_tools = {
    autostart = false,
    auto_open_browser = false,
  },
  outline = {
    open_cmd = "30vnew",
    auto_open = false
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
      background_color = nil,
      foreground = false,
      virtual_text = true,
      virtual_text_str = "■",
    },
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {},
      renameFilesWithClasses = "prompt",
      enableSnippets = true,
      updateImportsOnRename = true,
      enableSdkFormatter = true,
      documentation = 'full'
    }
  }
}
