vim.g.mapleader = ","

local core_conf_files = {

	"mappings.lua",
	"globals.lua"
}

local viml_conf_dir = vim.fn.stdpath("config") .. "/viml_conf"
-- source all the core config files
for _, file_name in ipairs(core_conf_files) do
  if vim.endswith(file_name, 'vim') then
    local path = string.format("%s/%s", viml_conf_dir, file_name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
  else
    local module_name, _ = string.gsub(file_name, "%.lua", "")
    package.loaded[module_name] = nil
    require(module_name)
  end
end

local km = vim.keymap
--km.set("n", "<leader>w", "<cmd>update<cr>", {silent = true, desc = "Write file"})
--km.set("n", "<leader>wq", "<cmd>x<cr>", {silent = true, desc = "Write and quit"})

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

require("lazy").setup({
	'hrsh7th/vim-vsnip',
	'onsails/lspkind.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-tree/nvim-web-devicons',
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

	{'neovim/nvim-lspconfig'},
	--AUTOCOMPLETION
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'L3MON4D3/LuaSnip'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-buffer'},
	{'Hoffs/omnisharp-extended-lsp.nvim'},
	{'nvim-telescope/telescope.nvim', tag = "0.1.5"},
--	{
  --		"folke/noice.nvim",
  --		event = "VeryLazy",
  --		opts = {
    		-- add any options here
  --		},
  --		dependencies = {
    		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --		"MunifTanjim/nui.nvim",
  --  		}
--	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	'OmniSharp/omnisharp-vim',
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
	'NicholasMata/nvim-dap-cs',
	"nvim-telescope/telescope-file-browser.nvim",
})


vim.cmd.colorscheme "catppuccin"
vim.g.OmniSharp_server_stdio = 0



