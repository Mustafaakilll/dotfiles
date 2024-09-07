local opt = vim.o

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

vim.keymap.set("n", "<C-S-{>", require("ufo").openAllFolds)
vim.keymap.set("n", "<C-S-}>", require("ufo").closeAllFolds)

require("ufo").setup()
