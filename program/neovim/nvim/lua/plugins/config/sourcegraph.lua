local node_executable = "/home/mustafaakilll/.nix-profile/bin/node"
require("sg").setup{
  enable_cody = true;
  node_executable = node_executable;
  on_attach = require("plugins.config.lsp-config").on_attach;
}
