local lsp_installer_servers = require('nvim-lsp-installer.servers')
local lsp_installer = require("nvim-lsp-installer")

local servers = { 'dockerls', 'jsonls', 'pyright', 'sumneko_lua', 'dartls', 'tsserver', 'eslint', 'quick_lint_js', 'yamlls' }

for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            local opts = {}
            server:setup(opts)
        end)
        if not server:is_installed() then
            server:install()
        end
    end
end

local DEFAULT_SETTINGS = {
    ui = {
        icons = {
            server_installed = "◍",
            server_pending = "◍",
            server_uninstalled = "◍",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            update_all_servers = "U",
            uninstall_server = "X",
        },
    },

    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 8,
}

lsp_installer.settings (DEFAULT_SETTINGS)
