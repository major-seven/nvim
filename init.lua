-------------------------------------------------------------------------------
-- Plugin Packages
-------------------------------------------------------------------------------
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

require "tunnelvision-theme"
require("lazy").setup({

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	'nvim-telescope/telescope-ui-select.nvim',
	"nvim-tree/nvim-tree.lua",

	"natecraddock/workspaces.nvim",
	"natecraddock/sessions.nvim",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"nvim-lua/completion-nvim",
	{
		'VonHeikemen/lsp-zero.nvim',
		lazy = true,
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	},

	"lewis6991/gitsigns.nvim",
	{ 'numToStr/Comment.nvim', lazy = false, },
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			autochdir = true,
			direction = "float",

		},
		lazy = true,
	},
})


-------------------------------------------------------------------------------
-- Setup Plugins
-------------------------------------------------------------------------------

-- Workspaces
require("sessions").setup({
	events = { "VimLeavePre", "BufEnter" },
	session_filepath = vim.fn.stdpath("data") .. "/sessions",
	absolute = true,
})

require("workspaces").setup({
	cd_type = "global",
	auto_open = false,
	path = vim.fn.stdpath("data") .. "/workspaces",
	hooks = {
		-- open_pre = { "wall", "SessionsSave", "silent %bdelete!" },
		open_pre = function()
			-- vim.cmd("wall")
			-- require("sessions").save(nil, { silent = true })
			-- vim.cmd("%bd!")
		end,
		remove = function()
			vim.cmd("wall")
			require("sessions").save(nil, { silent = true })
			-- vim.cmd("bd")
			vim.cmd("%bd!")
		end,
		open = function()
			-- vim.cmd("%bd!")
			require("sessions").load(nil, { silent = true })
		end,
	}
})
require("telescope").load_extension("workspaces")
require("telescope").setup({
	extensions = {
		workspaces = {
			-- keep insert mode after selection in the picker, default is false
			-- keep_insert = true,
		}
	}
	-- extensions = {
	-- 	project = {
	-- 		on_project_selected = function(prompt_bufnr)
	-- 			project_actions.change_working_directory(prompt_bufnr, false)
	-- 		end
	-- 	}
	-- }
})
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

require("lsp-zero")
require("lspconfig").lua_ls.setup({})

require("lualine").setup({
	options = {
		section_separators = { '', '' },
		component_separators = { '', '' },
	},
})
require("nvim-web-devicons").setup({})
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {}
	end,
}
-- this is used to prevent lsp from syntax highlighting
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
});

require('gitsigns').setup()
require("Comment").setup()
require("toggleterm").setup({
	autochdir = true,
	direction = "float",
})


-------------------------------------------------------------------------------
-- Remaps
-------------------------------------------------------------------------------

-- Ergonomics
vim.g.mapleader = " "
vim.keymap.set({ "n", "x" }, "U", "<c-r>")
vim.keymap.set({ "n", "x" }, "gy", '"+y')
vim.keymap.set({ "n", "x" }, "gp", '"+p')
vim.keymap.set({ "n", "x" }, "n", "nzz")
vim.keymap.set({ "n", "x" }, "N", "Nzz")
vim.keymap.set({ "n", "x" }, ",", ";")
vim.keymap.set({ "n", "x" }, ";", ",")
vim.keymap.set({ "n", "x" }, "£", "0bw")
vim.keymap.set({ "n", "x" }, "<leader>s", "<cmd>wa<cr>")

-- Splits
vim.keymap.set("n", "<leader>wk", ":split<cr>")
vim.keymap.set("n", "<leader>wj", ":split<cr><c-w>j<cr>")
vim.keymap.set("n", "<leader>wh", ":vsplit<cr>")
vim.keymap.set("n", "<leader>wl", ":vsplit<cr><c-w>l<cr>")
vim.keymap.set("n", "<leader>wq", ":close<cr>")
vim.keymap.set("n", "<leader>ww", ":only<cr>")
vim.keymap.set("n", "<leader>h", "<c-w>h<cr>")
vim.keymap.set("n", "<leader>j", "<c-w>j<cr>")
vim.keymap.set("n", "<leader>k", "<c-w>k<cr>")
vim.keymap.set("n", "<leader>l", "<c-w>l<cr>")
vim.keymap.set("n", "=", "<c-w>=")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Tree
vim.keymap.set({ "n", "x" }, "<leader>fs", "<cmd>NvimTreeToggle<cr>")

-- Workspaces
vim.keymap.set("n", "<leader>p", "<cmd>Telescope workspaces<cr>")
-- vim.keymap.set("n", "<leader>p", ":lua require'telescope'.extensions.project.project{}<CR>")

-- LSP
vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", {})
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.hover()<cr>", {})

vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format, {})

-- Comments
local comment_api = require("Comment.api")
local comment_esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
vim.keymap.set("n", "<leader>c", comment_api.toggle.linewise.current)
vim.keymap.set("x", "<leader>c", function()
	vim.api.nvim_feedkeys(comment_esc, 'nx', false)
	comment_api.toggle.linewise(vim.fn.visualmode())
end)

-- Terminal
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr><cr>")
vim.keymap.set("n", "<leader>tk", "<cmd>TermKill<cr>y<cr>")
vim.keymap.set("n", "<leader>tq", "<cmd>TermClose<cr>")

-- Version Control
vim.keymap.set("n", "<leader>vd", "<CMD>DiffviewOpen<CR>")




-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.hidden = false

-- don't continue comments on newlines
vim.api.nvim_create_autocmd({ "FileType" }, { command = "set formatoptions-=cro" })

-- vim.highlight.priorities.semantic_tokens = 95

-- fs
vim.opt.directory = vim.fn.stdpath("data") .. "/tmp/swap"
vim.opt.backupdir = vim.fn.stdpath("data") .. "/tmp/backup"
vim.opt.undodir = vim.fn.stdpath("data") .. "/tmp/undo"
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true



-------------------------------------------------------------------------------
-- The Todo List
-------------------------------------------------------------------------------
-- convenient workspace add / remove
-- git remaps
-- terminal
