return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "html", "markdown", "css" },
			sync_install = false,
			autoinstall = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
