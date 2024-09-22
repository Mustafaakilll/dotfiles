return {

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} },

			"b0o/SchemaStore.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local builtins = require("telescope.builtin")
					local map = vim.keymap.set
					map("n", "gd", builtins.lsp_definitions, { buffer = 0 })
					map("n", "gr", builtins.lsp_references, { buffer = 0 })
					map("n", "gI", builtins.lsp_implementations, { buffer = 0 })
					map("n", "gT", builtins.lsp_type_definitions, { buffer = 0 })
					map("n", "<leader>ds", builtins.lsp_document_symbols, { buffer = 0 })
					map("n", "<leader>ws", builtins.lsp_dynamic_workspace_symbols, { buffer = 0 })

					map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
					map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
					map("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("n", "<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end)
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				bashls = {},
				eslint = {},
				elp = {},
				erlangls = {},
				html = {},
				jsonls = {
					server_capabilities = {
						documentFormattingProvider = false,
					},
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
					elixirls = {
						cmd = { "elixir-ls" },
					},
					vimls = {},
					yamlls = {
						settings = {
							yaml = {
								schemaStore = {
									enable = false,
									url = "",
								},
								-- schemas = require("schemastore").yaml.schemas(),
							},
						},
					},
					cmake = {},
					gopls = {
						completeUnimported = true,
						analyses = {
							unusedparams = true,
							shadow = true,
							assign = true,
							unusedvariable = true,
						},
						vulncheck = "Imports",
						codelenses = { test = true, generate = true },
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						} or nil,
					},
					rust_analyzer = {
						settings = {
							["rust-analyzer"] = {
								inlayHints = {
									parameterHints = { enable = true },
									typeHints = { enable = true, hideClosureInitialization = true },
									chainingHints = { enable = true },
								},
								procMacro = { enable = true },
								check_on_save = { command = "clippy" },
								cargo = { allFeatures = true },
								diagnostics = { enable = true },
							},
						},
					},
					ts_ls = {
						cmd = { "typescript-language-server", "--stdio" },
						filetypes = { "javascript", "typescript" },
					},
					lua_ls = {
						settings = {
							Lua = {
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					},
				},
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()

			local ensure_installed = {
				"golangci-lint",
				"bash-language-server",
				"lua-language-server",
				"vim-language-server",
				"gopls",
				"stylua",
				"shellcheck",
				"editorconfig-checker",
				"gofumpt",
				"golines",
				"gomodifytags",
				"gotests",
				"impl",
				"json-to-struct",
				"misspell",
				"revive",
				"shellcheck",
				"shfmt",
				"staticcheck",
				"vint",
			}
			vim.list_extend(ensure_installed, servers_to_install)

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})

			require("lspconfig").golangci_lint_ls.setup({
				autostart = false,
			})
		end,
	},
}
