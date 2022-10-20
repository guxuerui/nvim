-- basics
vim.cmd('syntax on')
-- vim.cmd('filetype plugin indent on')
vim.cmd('nohlsearch')
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.termguicolors   = true
vim.opt.shiftround      = true
vim.opt.updatetime      = 100
vim.opt.cursorline      = true
vim.opt.autowrite       = true
if (vim.fn.has('termguicolors') == 1) then
    vim.opt.termguicolors = true
end
-- tabs
vim.opt.autoindent      = true
vim.opt.tabstop         = 2
vim.opt.shiftwidth      = 2
vim.opt.softtabstop     = 2
vim.opt.expandtab       = true



-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
vim.g.loaded_matchparen        = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins    = 1
require("core.impatient")
require("core.plugins")
require("core.treesitter")
require("core.toggleterm")
require("core.colorizer")
require("core.keymaps")
require("core.options")
require("core.autopairs")
require("core.notify")
require("core.startup-screen")
require("core.image")
require("core.shade")
require("core.gitsigns")
require("core.minimap")

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

require("telescope").load_extension("notify")
require("telescope").load_extension("file_browser")
vim.api.nvim_create_autocmd('BufWritePost', { group = vim.api.nvim_create_augroup('PACKER', { clear = true }), pattern = 'plugins.lua', command = 'source <afile> | PackerCompile', })
