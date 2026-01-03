return {
	"kvrohit/rasmus.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("rasmus")

		local groups = {
			"Normal",
			"NormalNC",
			"NormalFloat",
			"SignColumn",
			"LineNr",
			"EndOfBuffer",
			"FloatBorder",
			"StatusLine",
			"StatusLineNC",
			"WinSeparator",
		}

		-- fundo totalmente preto + foreground coldark
		for _, group in ipairs(groups) do
			vim.api.nvim_set_hl(0, group, { bg = "#000000", fg = "#C9D1D9" })
		end

		-- estilo Coldark-Dark
		vim.api.nvim_set_hl(0, "Comment", { fg = "#5C6370", italic = true })
		vim.api.nvim_set_hl(0, "Function", { fg = "#5DC2D6" })
		vim.api.nvim_set_hl(0, "Keyword", { fg = "#C586C0", bold = true })
		vim.api.nvim_set_hl(0, "String", { fg = "#EBCB8B" })
		vim.api.nvim_set_hl(0, "Number", { fg = "#7FE5F0" })
		vim.api.nvim_set_hl(0, "Type", { fg = "#4A90A4" })
		vim.api.nvim_set_hl(0, "Constant", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "Operator", { fg = "#C9D1D9" })
		vim.api.nvim_set_hl(0, "Identifier", { fg = "#F6A878" })
		vim.api.nvim_set_hl(0, "Boolean", { fg = "#7BD88F" })
	end,
}
