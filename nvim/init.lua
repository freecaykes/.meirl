-- Basic Settings
vim.o.termguicolors = true    -- Enable true colors support

-- Install Plugin Manager (packer.nvim)
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

-- Setup plugins using packer
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'  -- Packer itself
    use {
        'preservim/nerdtree',
        config = function()
        -- Optional: configure NERDTree key mappings
        vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
        end
    }
    -- colorscheme
    use {
        "loctvl842/monokai-pro.nvim",
        config = function()
        require("monokai-pro").setup()
        end
    }
    -- Treesitter for syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "zig" },  -- Include Zig
                highlight = {
                    enable = true,
                },
            }
        end
    }
   
    -- LSP configuration
   use 'neovim/nvim-lspconfig'

   -- LSP configuration
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-vsnip'
   use 'hrsh7th/vim-vsnip'  
   use 'onsails/lspkind.nvim'
   -- Autocompletion framework
    use {
        'hrsh7th/nvim-cmp',
        requires = {
	    'hrsh7th/cmp-nvim-lsp',       -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',          -- Buffer source
            'hrsh7th/cmp-path',            -- Path source
            'hrsh7th/cmp-cmdline',         -- Command line completion
            'hrsh7th/cmp-nvim-lsp-signature-help', -- Signature help
        },
    }
    -- Tab management with tabby.nvim
    use {
        'nanozuki/tabby.nvim',
        config = function()
            local theme = {
                fill = 'TabLineFill',
                -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
                head = 'TabLine',
                current_tab = 'TabLineSel',
                tab = 'TabLine',
                win = 'TabLine',
                tail = 'TabLine',
              }
              require('tabby').setup({
                line = function(line)
                  return {
                    {
                      { '  ', hl = theme.head },
                      line.sep('', theme.head, theme.fill),
                    },
                    line.tabs().foreach(function(tab)
                      local hl = tab.is_current() and theme.current_tab or theme.tab
                      return {
                        line.sep('', hl, theme.fill),
                        tab.is_current() and '' or '󰆣',
                        tab.number(),
                        tab.name(),
                        tab.close_btn(''),
                        line.sep('', hl, theme.fill),
                        hl = hl,
                        margin = ' ',
                      }
                    end),
                    line.spacer(),
                    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                      return {
                        line.sep('', theme.win, theme.fill),
                        win.is_current() and '' or '',
                        win.buf_name(),
                        line.sep('', theme.win, theme.fill),
                        hl = theme.win,
                        margin = ' ',
                      }
                    end),
                    {
                      line.sep('', theme.tail, theme.fill),
                      { '  ', hl = theme.tail },
                    },
                    hl = theme.fill,
                  }
                end,
                -- option = {}, -- setup modules' option,
              })
        end
    }
    -- formatting support
    use {
        'sbdchd/neoformat',
        cmd = 'Neoformat',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>f', ':Neoformat<CR>', { noremap = true, silent = true })
        end
    }
    
    -- code symbols
    use 'simrat39/symbols-outline.nvim'
    
    -- snippet engine
    use 'L3MON4D3/LuaSnip'
    
    -- finder telescope
    use {
   	'nvim-telescope/telescope.nvim', tag = '0.1.8',
  	requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- auto-save config
    use({
      "Pocco81/auto-save.nvim",
      config = function()
         require("auto-save").setup {
          -- your config goes here
          -- or just leave it empty :)
         }
      end,
    })
    
  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- create keymaps
function nnoremap(rhs, lhs, desc)
  vim.keymap.set("n", rhs, lhs)
end

-- lsp configs

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

local lspconfig = require('lspconfig')

lspconfig.zls.setup{
    cmd = { "zls" },
}
lspconfig.ts_ls.setup{}
lspconfig.pylsp.setup{
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    
    -- Key mappings for LSP
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    -- Cmd + Click for definition
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<LeftMouse>', '<cmd>lua require("utils").cmd_click_definition()<CR>', { noremap = true, silent = true })
  end,
}

-- Create utility function for Cmd + Click
function _G.cmd_click_definition()
  if vim.fn.has('mac') == 1 then
    local mouse = vim.fn.getmousepos()
    local line = mouse.line
    local col = mouse.col
    vim.fn.cursor(line, col)
    vim.lsp.buf.definition()
  end
end

-- completion config
local cmp = require('cmp')
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'vsnip' },
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- because we are using the vsnip cmp plugin
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
}


-- finder config

require('telescope').setup({
  defaults = {
    path_display = {
      shorten = {
        len = 3, exclude = {1, -1}
      },
      truncate = true
    },
    dynamic_preview_title = true,
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
})
require('telescope').load_extension('fzf')
-- telescope key mappings
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>", "Find file")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>", "Grep")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>", "Find buffer")
nnoremap("<leader>fm", "<cmd>Telescope marks<cr>", "Find mark")
nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>", "Find references (LSP)")
nnoremap("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "Find symbols (LSP)")
nnoremap("<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", "Find incoming calls (LSP)")
nnoremap("<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>", "Find outgoing calls (LSP)")
nnoremap("<leader>fi", "<cmd>Telescope lsp_implementations<cr>", "Find implementations (LSP)")
nnoremap("<leader>fx", "<cmd>Telescope diagnostics bufnr=0<cr>", "Find errors (LSP)")

-- 
require("symbols-outline").setup {
  auto_close = true,
}
-- window management
nnoremap("<C-S-Right>", "<cmd>:vertical resize -1<cr>", "Minimize window")
nnoremap("<C-S-Left>", "<cmd>:vertical resize +1<cr>", "Maximize window")

-- colorscheme config
require("monokai-pro").setup({
  filter = "classic"
})

vim.cmd([[colorscheme monokai-pro]])

-- editor config
vim.o.number = true               -- Show line numbers
vim.o.relativenumber = true       -- Relative line numbers
vim.o.expandtab = true            -- Use spaces instead of tabs
vim.o.shiftwidth = 4              -- Number of spaces to use for each step of (auto)indent
vim.o.tabstop = 4                 -- Number of spaces that a <Tab> in the file counts for


-- nerdtree config
