-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local HEIGHT_RATIO = 1   -- You can change this
local WIDTH_RATIO = 0.35 -- You can change this too

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
	  sort_by = "case_sensitive",
	  view = {
	    side = "right",
	    float = {
	      enable = false,
	      open_win_config = function()
		local screen_w = vim.opt.columns:get()
		local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
		local window_w = screen_w * WIDTH_RATIO
		local window_h = screen_h * HEIGHT_RATIO
		local window_w_int = math.floor(window_w)
		local window_h_int = math.floor(window_h)
		local center_x = (screen_w - window_w) / 2
		local center_y = ((vim.opt.lines:get() - window_h) / 2)
		    - vim.opt.cmdheight:get()
		return {
		  border = 'rounded',
		  relative = 'editor',
		  row = center_y,
		  col = center_x,
		  width = window_w_int,
		  height = window_h_int,
		}
	      end,
	    },
	    width = function()
	      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
	    end,
	    preserve_window_proportions = true,
	  },
	  renderer = {
	    group_empty = false,
	  },
	  git = {
	    enable = true,
	    ignore = true,
	    timeout = 500
	  },
	  filters = {
	    dotfiles = false,
	  },
	  actions = {
	    open_file = {
	      resize_window = false,
	    },
	  },
    }
  end,
}
