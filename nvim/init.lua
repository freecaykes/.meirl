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
            require'lspconfig'.zigls.setup {
                cmd = { "zig-langserver" },
                filetypes = { "zig" },
                root_dir = require'lspconfig'.util.root_pattern("build.zig", "zig.mod"),
                settings = {
                    zig = {
                        diagnostics = {
                            enable = true,
                        },
                    },
                },
            }
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
            require("tabby").setup({
                tabline = function()
                    local tab_num = vim.fn.tabpagenr('$')
                    local tabs = {}
                    for i = 1, tab_num do
                        local bufnr = vim.fn.tabpagebuflist(i)[1]
                        local bufnr_name = vim.fn.bufname(bufnr)
                        local modified = vim.fn.getbufvar(bufnr, '&modified') == 1 and '●' or ''
                        table.insert(tabs, string.format(" %s %s ", bufnr_name, modified))
                    end
                    return table.concat(tabs, "")
                end,
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
