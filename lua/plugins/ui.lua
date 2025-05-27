return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "catppuccin-macchiato",
					component_separators = "|",
					section_separators = "",
				},
				sections = {
					lualine_a = { { "buffers" } },
				},
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#433745" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#483C54" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#473441" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#4F3D42" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#453B37" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#37203D" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#1D3E42" })
			end)

			require("ibl").setup({ indent = { highlight = highlight } })
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
}

