
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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


vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`


require("lazy").setup({
  -- git status next to line
  'airblade/vim-gitgutter',

  -- git commands
  'tpope/vim-fugitive',

  -- syntax highlighting & colorschemes
  'flazz/vim-colorschemes',
  'tangphillip/SunburstVIM',
  {
    'tanvirtin/monokai.nvim',
    config = function()
      require('monokai').setup { palette = require('monokai') }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      -- ...
    end,
  },
  'mfussenegger/nvim-lint',

  'Raimondi/delimitMate',

  -- FZF setup
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        fzf_opts = {
          ["--layout"] = "default",
          ["--info"] = "inline",
        },
        -- You can customize keybindings and other settings here
      })
    end
  },

  -- language specific plugins
  'hashivim/vim-terraform',
  'jparise/vim-graphql',


  -- typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- golang
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    -- if you need to install/update all binaries
    build = ':lua require("go.install").update_all_sync()'
  },
})

require("typescript-tools")

require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

local lspconfig = require('lspconfig')

local cfg = require('go.lsp').config() -- config() return the go.nvim gopls setup
lspconfig.gopls.setup(cfg)


require'nvim-treesitter.configs'.setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  }
})


-- lspconfig.gopls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   single_file_support = true,
--   cmd = {"gopls"},
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = {
--         unusedparams = true,
--       },
--     },
--   },
-- }



local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
  },

  window =  {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})


-- require'lspconfig'.gopls.setup{}
-- 
-- local lspconfig = require('lspconfig')
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }


local function buf_set_keymap(...)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end
local opts = { noremap=true, silent=true }

buf_set_keymap('n', 'gD',        '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd',        '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', '<space>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '[d',        '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d',        '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local set_keymap = vim.api.nvim_set_keymap
set_keymap('n', '<C-p>', ':FzfLua files<CR>', opts)
set_keymap('n', '<C-g>', ':FzfLua live_grep<CR>', opts)

