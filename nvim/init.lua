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
    -- colorscheme
    use {
        "loctvl842/monokai-pro.nvim",
        config = function()
        require("monokai-pro").setup()
        end
    }
    use {
        'preservim/nerdtree',
        config = function()
        -- Optional: configure NERDTree key mappings
        vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
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
    use {
        'neovim/nvim-lspconfig',
        config = function()
          local lspconfig = require('lspconfig')
          -- zls setup
          lspconfig.zls.setup{}
        end
    }
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
        config = function()
            local cmp = require'cmp'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)  -- For snippet support
                    end,
                },
                mapping = {
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
            })

            -- Command line completion
            cmp.setup.cmdline(':', {
                sources = {
                    { name = 'cmdline' }
                }
            })
        end
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
    -- snippet engine
    use 'L3MON4D3/LuaSnip'

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


-- editor config
vim.o.number = true               -- Show line numbers
vim.o.relativenumber = true       -- Relative line numbers
vim.o.expandtab = true            -- Use spaces instead of tabs
vim.o.shiftwidth = 4              -- Number of spaces to use for each step of (auto)indent
vim.o.tabstop = 4                 -- Number of spaces that a <Tab> in the file counts for


-- nerdtree config


-- colorscheme config
require("monokai-pro").setup({
  filter = "classic"
})

vim.cmd([[colorscheme monokai-pro]])
