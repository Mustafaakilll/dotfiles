-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("yankpost", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.sql",
	command = "set filetype=sql",
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("misc_aucmds", { clear = true }),
	pattern = "qf",
	command = "set nobuflisted",
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
		if ok and cl then
			vim.wo.cursorline = true
			vim.api.nvim_win_del_var(0, "auto-cursorline")
		end
	end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		local cl = vim.wo.cursorline
		if cl then
			vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
			vim.wo.cursorline = false
		end
	end,
})

vim.cmd.colorscheme("tokyonight-storm")
vim.cmd("hi ColorColumn ctermbg=grey guibg=grey")

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
	end,
})

-- Auto Enable inlay hints on neovim open
-- vim.cmd(":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())")

-- Harpoon things
vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
