-- Load plugins using pckr.nvim
local function bootstrap_pckr()
  local path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
  if not (vim.uv or vim.loop).fs_stat(path) then
    vim.fn.system({ 'git',
'clone',
'--filter=blob:none',
'https://github.com/lewis6991/pckr.nvim', path })
  end
  vim.opt.rtp:prepend(path)
end

bootstrap_pckr()
local pckr = require('pckr')

pckr.add {
  'lewis6991/pckr.nvim',
  { 'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  { 'ThePrimeagen/harpoon', branch = "harpoon2", requires = { { 'nvim-lua/plenary.nvim' } } }, 
  'nvim-treesitter/playground',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'andweeb/presence.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  'github/copilot.vim',
  'folke/tokyonight.nvim'
}
