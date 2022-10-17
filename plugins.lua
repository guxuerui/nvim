local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

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
return packer.startup(function(use)
  -- My plugins here
  use "ryanoasis/vim-devicons"
  use "nvim-treesitter/nvim-treesitter"
  use "wellle/context.vim"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use "airblade/vim-rooter"
  use "preservim/nerdtree"
  use "mhinz/vim-startify"
  use "majutsushi/tagbar"
  use "w0rp/ale"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use {'neoclide/coc.nvim', branch = 'release'}
  use "junegunn/vim-easy-align"
  use "ayu-theme/ayu-vim"
  use "elzr/vim-json"
  use "othree/html5.vim"
  use "evanleck/vim-svelte"
  use "hail2u/vim-css3-syntax"
  use "pangloss/vim-javascript"
  use "mattn/emmet-vim"
  use "rodrigore/coc-tailwind-intellisense"
  use "tpope/vim-fugitive"
  use "ctrlpvim/ctrlp.vim"
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  -- use {
    -- 's1n7ax/nvim-window-picker',
    -- tag = 'v1.*',
    -- config = function()
      -- require'window-picker'.setup()
    -- end,
  -- }
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
    require("toggleterm").setup()
  end}
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "jose-elias-alvarez/null-ls.nvim"
  -- use "folke/which-key.nvim"
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- auto-session
  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('session-lens').setup({--[[your custom config--]]})
    end
  }

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "norcalli/nvim-colorizer.lua"
  use "lunarvim/darkplus.nvim"
  use "easymotion/vim-easymotion"
  -- SearchBox
  use "MunifTanjim/nui.nvim"
  use "VonHeikemen/searchbox.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSPh
  -- use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup({
      filter_kind = {
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      }
    }) end
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzf-native.nvim"

  use "JoosepAlviste/nvim-ts-context-commentstring"


  -- Git
  use "lewis6991/gitsigns.nvim"

  use "rcarriga/nvim-notify"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
