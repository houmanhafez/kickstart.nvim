-- Themes in the vague aesthetic: dark, desaturated, minimal syntax noise.
-- Swap the `colorscheme` line and uncomment the matching plugin to try one.
--
-- Current: vague
-- Alternatives (uncomment one at a time):
--   mellow       — warm grey base, almost no hue on keywords, closest to vague
--   no-clown-fiesta — built specifically to reduce syntax color overload
--   zenbones     — near-monochrome, earthy, only colors what matters
--   rose-pine    — muted purples, low contrast between tokens (use 'rose-pine-moon')
--   melange      — warm amber darks, very little keyword coloring

---@module 'lazy'
---@type LazySpec
return {
	-- ── Vague ────────────────────────────────────────────────────────────
	{
		"vague-theme/vague.nvim",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			require("vague").setup({
				-- transparent = true, -- uncomment if you want transparent bg
				style = {
					comments = "none", -- 'none' | 'italic'
					strings = "none",
					keywords = "none",
					functions = "none",
					variables = "none",
				},
			})
			vim.cmd.colorscheme("vague")
		end,
	},

	-- ── Alternatives (set enabled = true and enabled = false above) ────────────

	-- mellow
	{
		"mellow-theme/mellow.nvim",
		lazy = true,
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("mellow")
		end,
	},

	-- no-clown-fiesta
	{
		"aktersnurra/no-clown-fiesta.nvim",
		lazy = true,
		enabled = false,
		priority = 1000,
		config = function()
			require("no-clown-fiesta").setup({
				styles = {
					comments = {},
					keywords = {},
					functions = {},
				},
			})
			vim.cmd.colorscheme("no-clown-fiesta")
		end,
	},

	-- zenbones
	{
		"zenbones-theme/zenbones.nvim",
		lazy = true,
		enabled = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			vim.g.zenbones_darken_comments = 38
			vim.g.zenbones_lighten_non_text = 15
			vim.cmd.colorscheme("zenbones")
		end,
	},

	-- rose-pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		enabled = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- 'main' | 'moon' | 'dawn'
				disable_italics = true,
				styles = { italic = false, bold = false },
			})
			vim.cmd.colorscheme("rose-pine-moon")
		end,
	},

	-- melange
	{
		"savq/melange-nvim",
		lazy = true,
		enabled = false,
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("melange")
		end,
	},
}
