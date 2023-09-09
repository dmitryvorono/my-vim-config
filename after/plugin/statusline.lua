local lualine = require("lualine")

lualine.setup({
	sections = {
		lualine_a = { "" },
		lualine_b = { "branch" },
		lualine_c = { "filename",
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = " ", warn = " ", info = " " },
                colored = true,
                diagnostics_color = {
                    error = "DiagnosticError",
                    warn = "DiagnosticWarn",
                    info = "DiagnosticInfo",
                    hint = "DiagnosticHint",
                }
            },
        },
		lualine_z = {
			"location",
            {
                "progress"
            },
		},
	},
})
