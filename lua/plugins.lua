local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
	vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
	vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require("packer.util")

require("packer").startup({
	function(use)
		-- it is recommened to put impatient.nvim before any other plugins
		use({ "lewis6991/impatient.nvim", config = [[require('impatient')]] })

		use({ "wbthomason/packer.nvim", opt = true })

		--"================================================
		--" Preload
		--"================================================
		use({ "nvim-lua/plenary.nvim" })

		--"================================================
		--" AI
		--"================================================
		use({ "github/copilot.vim" })

		--"================================================
		--" Code Completion
		--"================================================
		use({ "onsails/lspkind-nvim", event = "VimEnter" })
		use({ "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] })

		-- nvim-cmp completion sources
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
		use({ "rafamadriz/friendly-snippets" })
		use({ "SirVer/ultisnips", event = "InsertEnter" })
		use({ "honza/vim-snippets", after = "ultisnips" })
		use({ "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } })
		use({ "L3MON4D3/LuaSnip" })

		-- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
		use({
			"neovim/nvim-lspconfig",
			"williamboman/nvim-lsp-installer",
			after = "cmp-nvim-lsp",
			config = [[require('config.lsp')]],
		})

		--"================================================
		--" UI
		--"================================================
		use({ "folke/lsp-colors.nvim" })
		use({ "flazz/vim-colorschemes" })
		use({ "sainnhe/edge" })
		use({ "itchyny/vim-highlighturl" })
		-- use {'kosayoda/nvim-lightbulb'}
		use({ "ray-x/lsp_signature.nvim" })
		use({ "majutsushi/tagbar" })
		use({ "folke/todo-comments.nvim" })
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "jimsei/winresizer" })

		--"================================================
		--" Character
		use({ "windwp/nvim-autopairs" })
		use({ "Raimondi/delimitMate" })
		use({ "machakann/vim-sandwich" })

		--"================================================
		--" Commands
		--"================================================
		use({ "vim-scripts/DeleteTrailingWhitespace" })
		use({ "vim-ctrlspace/vim-ctrlspace" })
		use({ "junegunn/vim-easy-align" })
		use({ "henrik/vim-indexed-search" })
		use({ "vim-scripts/Last-Modified" })
		use({ "valloric/ListToggle" })
		use({ "tpope/vim-speeddating" })

		--================================================
		-- Config
		--================================================
		use({ "her/central.vim" })
		use({ "tpope/vim-obsession.git" })

		--"================================================
		--" Code Completion
		--"================================================
		-- use {GitHub..'hrsh7th/nvim-cmp',
		--     requires = {
		--         GitHub..'neovim/nvim-lspconfig',
		--         GitHub..'hrsh7th/cmp-nvim-lsp',
		--         GitHub..'hrsh7th/cmp-buffer',
		--         GitHub..'hrsh7th/cmp-path',
		--         GitHub..'hrsh7th/cmp-cmdline',

		--         -- Choose a Snippet Engine

		--         -- For vsnip users
		--         GitHub..'hrsh7th/vim-vsnip',
		--         GitHub..'rafamadriz/friendly-snippets',

		--         -- For luasnip users
		--         -- GitHub..'L3MON4D3/LuaSnip'
		--         -- GitHub..'saadparwaiz1/cmp_luasnip',
		--         -- GitHub..'hrsh7th/cmp-nvim-lua',

		--         -- For ultisnips users
		--         -- GitHub..'SirVer/ultisnips'
		--         -- GitHub..'quangnguyen30192/cmp-nvim-ultisnips',

		--         -- For snippy users
		--         -- GitHub..'dcampos/nvim-snippy'
		--         -- GitHub..'dcampos/cmp-snippy'

		--         -- GitHub..'octaltree/cmp-look',
		--         -- GitHub..'hrsh7th/cmp-calc',
		--         -- GitHub..'f3fora/cmp-spell',
		--         -- GitHub..'hrsh7th/cmp-emoji',
		--     },
		-- }

		-- use {GitHub..'onsails/diaglist.nvim'}
		-- use {GitHub..'onsails/lspkind-nvim'}
		-- use {GitHub..'ray-x/lsp_signature.nvim'}
		-- use {GitHub..'tami5/lspsaga.nvim'}

		--================================================
		-- Git
		--================================================
		-- use({ "tpope/vim-fugitive", event = "User InGitRepo" })

		use({
			"lewis6991/gitsigns.nvim",
			config = [[require('config.gitsigns')]],
			{ requires = "nvim-lua/plenary.nvim" },
		})
		use({ "mhinz/vim-signify", event = "BufEnter" })

		--"------------------------------------------------
		-- Help
		--"------------------------------------------------
		use({ "sudormrfbin/cheatsheet.nvim" })

		--================================================
		-- Indentation
		--================================================
		use({ "lukas-reineke/indent-blankline.nvim", config = [[require('config.indent-blankline')]] })
		use({ "michaeljsmith/vim-indent-object", event = "VimEnter" })

		--================================================
		-- LSP
		--================================================
		use({ "jose-elias-alvarez/null-ls.nvim", config = [[require('config.null-ls')]] })

		----------------------------------------------------------------------
		-- Notification
		----------------------------------------------------------------------
		use({
			"rcarriga/nvim-notify",
			event = "BufEnter",
			config = function()
				vim.defer_fn(function()
					require("config.nvim-notify")
				end, 2000)
			end,
		})

		----------------------------------------------------------------------
		-- Search
		----------------------------------------------------------------------
		-- Show match number and index for searching
		use({
			"kevinhwang91/nvim-hlslens",
			branch = "main",
			keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
			config = [[require('config.hlslens')]],
		})

		-- Stay after pressing * and search selected text
		use({ "haya14busa/vim-asterisk", event = "VimEnter" })

		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		-- search emoji and other symbols
		use({ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" })

		--"------------------------------------------------
		-- Status Line
		--"------------------------------------------------
		use({
			"nvim-lualine/lualine.nvim",
			event = "VimEnter",
			config = [[require('config.statusline')]],
		})

		----------------------------------------------------------------------
		-- Tab Line
		----------------------------------------------------------------------
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = [[require('config.bufferline')]],
		})
		use({
			"nyngwang/NeoRoot.lua",
			config = function()
				require("neo-root").setup({
					CUR_MODE = 2, -- 1 for file/buffer mode, 2 for proj-mode
				})
			end,
		})

		----------------------------------------------------------------------------------------------
		-- Utlities
		----------------------------------------------------------------------------------------------
		use({ "tpope/vim-commentary", event = "VimEnter" })
		use({ "ethanholz/nvim-lastplace" })
		use({ "sbdchd/neoformat", cmd = { "Neoformat" } })
		use({ "neomake/neomake" })
		use({ "tpope/vim-repeat", event = "VimEnter" })
		use({ "junegunn/vim-peekaboo" })
		use({ "ludovicchabant/vim-gutentags" })
		use({ "lervag/vimtex" })
		use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })

		-- use({ "tami5/lspsaga.nvim" })

		use({ "andymass/vim-matchup" })
		use({
			"karb94/neoscroll.nvim",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("config.neoscroll")
				end, 2000)
			end,
		})
		use({
			"folke/which-key.nvim",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("config.which-key")
				end, 2000)
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = [[require('config.nvim-tree')]],
		})
	end,

	config = {
		max_jobs = 16,
		compile_path = util.join_paths(vim.fn.stdpath("config"), "lua", "packer_compiled.lua"),
	},
})

local status, _ = pcall(require, "packer_compiled")
if not status then
	vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
