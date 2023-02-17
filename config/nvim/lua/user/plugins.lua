local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
require('packer').startup({
  function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "lewis6991/impatient.nvim" -- Speed up loading Lua modules    TODO: figure out how to use this
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "kyazdani42/nvim-tree.lua"
    use "yaocccc/vim-fcitx2en"


	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"


	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- 新的安装 lsp、dap 等服务器的插件
    use "williamboman/mason-lspconfig.nvim"


	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
	use "akinsho/toggleterm.nvim" -- toggle terminal


	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-media-files.nvim"


    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
    use { "nvim-treesitter/playground", after = 'nvim-treesitter' }
    use "romgrk/nvim-treesitter-context"    -- 在看不见函数的情况下可以显示具体的函数
    use "p00f/nvim-ts-rainbow"  -- 彩虹括号，配置文件在 treesitter.lua


	-- UI
    use "akinsho/bufferline.nvim"
	use "nvim-lualine/lualine.nvim"
    use "yaocccc/nvim-hlchunk"
	use "goolord/alpha-nvim" -- welcome page
    use "kyazdani42/nvim-web-devicons"


	-- Git
	use "lewis6991/gitsigns.nvim"

  end,
    config = {
        git = { clone_timeout = 120 },
        display = {
            working_sym = '[ ]',
            error_sym = '[✗]',
            done_sym = '[✓]',
            removed_sym = ' - ',
            moved_sym = ' → ',
            header_sym = '─',
            open_fn = function() return require("packer.util").float({ border = "rounded" }) end
        }
    }
})


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
if packer_bootstrap then
  require("packer").sync()
end
