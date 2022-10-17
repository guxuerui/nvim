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
  print( 'variable:', status_ok )
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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use {
    "vim-airline/vim-airline",
    requires = {
      "vim-airline/vim-airline-themes",
      "ryanoasis/vim-devicons"
    }
  }
  use "wellle/context.vim"
  use "airblade/vim-rooter"
  use "preservim/nerdtree"
  -- use "mhinz/vim-startify"
  use "majutsushi/tagbar"
  use "w0rp/ale"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use { 'neoclide/coc.nvim', tag="v0.0.82" }
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
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  -- use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use {
	  "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use "nvim-treesitter/nvim-treesitter"
  -- use "nvim-treesitter/nvim-treesitter-context"
  use "kyazdani42/nvim-web-devicons"
  use "ziontee113/neo-minimap"
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- use "akinsho/bufferline.nvim"
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use "moll/vim-bbye"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use 'kevinhwang91/rnvimr'
  use {
    'samodostal/image.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  -- Lua
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
  
  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "easymotion/vim-easymotion"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "octaltree/cmp-look"
  use "hrsh7th/cmp-calc"
  use "f3fora/cmp-spell"
  use "hrsh7th/cmp-emoji"
  use {
    'VonHeikemen/searchbox.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }
  use {
    'numToStr/Comment.nvim',
    tag = 'v0.6',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    'declancm/cinnamon.nvim',
    config = function() require('cinnamon').setup() end
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
  }
  use "nvim-telescope/telescope-fzf-native.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use "JoosepAlviste/nvim-ts-context-commentstring"

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

  -- auto-session
  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('session-lens').setup({--[[your custom config--]]})
    end
  }

  -- nvim-magic
  use({
    'jameshiew/nvim-magic',
    config = function()
      require('nvim-magic').setup()
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim'
    }
  })

  -- trouble.nvim
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- codi.vim
  use 'metakirby5/codi.vim'

  use 'sunjon/shade.nvim'

  use "norcalli/nvim-colorizer.lua"
  -- Git
  use "lewis6991/gitsigns.nvim"
  -- use "github/copilot.vim"
  
  use "rcarriga/nvim-notify"
  -- Packer
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
