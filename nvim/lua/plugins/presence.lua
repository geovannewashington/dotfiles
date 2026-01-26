return {
	"andweeb/presence.nvim",
	lazy = false,
	config = function()
		require("presence"):setup({
			auto_update = true,

			-- Don't show these filetypes
			blacklist = {
				"%.txt$",
				"%.markdown$",
				"%.md$",
				"%.json$",
				"%.log$",
			},

			buttons = true,
			neovim_image_text = "Editing in Neovim",
			workspace_text = "Working on something",
			file_explorer_text = "Browsing files",
			reading_text = "Reading a file",
		})
	end,
}
