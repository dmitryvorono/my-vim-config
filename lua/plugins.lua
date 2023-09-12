-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-----------------------------------------------------------
	-- ПЛАГИНЫ ВНЕШНЕГО ВИДА
	-----------------------------------------------------------
	use("Mofiqul/vscode.nvim")
	--- Информационная строка внизу
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	-- Табы вверху
	--	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-----------------------------------------------------------
	-- НАВИГАЦИЯ
	-----------------------------------------------------------
	-- Файловый менеджер
	use({
		"nvim-tree/nvim-tree.lua",
		-- latest has a bug with FindFileToggle. Use this until that resolves
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		-- or                            , tag = '0.1.0',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

	-----------------------------------------------------------
	-- LSP и автодополнялка
	-----------------------------------------------------------
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	-- lsp stuffs
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", tag = "legacy" },

			-- Additional lua configuration, makes nvim stuff amazing
			{ "folke/neodev.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "rafamadriz/friendly-snippets" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	-----------------------------------------------------------
	-- Utilities
	-----------------------------------------------------------
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("windwp/nvim-autopairs")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"MunifTanjim/eslint.nvim",
			"MunifTanjim/prettier.nvim",
		},
	})
end)
