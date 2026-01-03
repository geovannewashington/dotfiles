return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	cmd = "Neotree",
	keys = {
		-- Toggle Neo-tree on the left
		{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle NeoTree", silent = true },
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw = true,
				use_libuv_file_watcher = true,
				window = {
					position = "left",
					width = 35,
				},
			},
		})
	end,
}
