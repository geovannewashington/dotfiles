require("core.options")
require("core.keymaps")

-- Install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
	require("plugins.colorscheme"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.none-ls"),
	require("plugins.neo-tree"),
	require("plugins.indent-blankline"),
	require("plugins.lazygit"),
	require("plugins.comment"),
	require("plugins.gitsigns"),
	require("plugins.misc"),
	require("plugins.lorem-nvim"),
})
