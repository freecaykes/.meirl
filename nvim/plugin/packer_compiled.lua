-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/edbert/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?.lua;/home/edbert/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?/init.lua;/home/edbert/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?.lua;/home/edbert/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/edbert/.cache/nvim/packer_hererocks/2.1.1727870382/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["monokai-pro.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16monokai-pro\frequire\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/monokai-pro.nvim",
    url = "https://github.com/loctvl842/monokai-pro.nvim"
  },
  neoformat = {
    commands = { "Neoformat" },
    config = { "\27LJ\2\nr\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\19:Neoformat<CR>\14<leader>f\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/opt/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  nerdtree = {
    config = { "\27LJ\2\ns\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NERDTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÏ\3\1\0\b\0\27\0/6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\n\0009\5\b\0009\5\t\5B\5\1\2=\5\v\0049\5\b\0009\5\f\5B\5\1\2=\5\r\0049\5\b\0009\5\14\5B\5\1\2=\5\15\0049\5\b\0009\5\16\0055\a\17\0B\5\2\2=\5\18\4=\4\b\0034\4\4\0005\5\19\0>\5\1\0045\5\20\0>\5\2\0045\5\21\0>\5\3\4=\4\22\3B\1\2\0019\1\2\0009\1\23\1'\3\24\0005\4\26\0004\5\3\0005\6\25\0>\6\1\5=\5\22\4B\1\3\1K\0\1\0\1\0\1\fsources\0\1\0\1\tname\fcmdline\6:\fcmdline\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\rcomplete\n<C-p>\21select_prev_item\n<C-n>\1\0\4\14<C-Space>\0\n<C-p>\0\t<CR>\0\n<C-n>\0\21select_next_item\fmapping\fsnippet\1\0\3\fmapping\0\fsources\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n \2\0\0\a\0\20\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\0026\3\0\0'\5\1\0B\3\2\0029\3\t\0039\3\n\3'\5\v\0'\6\f\0B\3\3\2=\3\r\0025\3\17\0005\4\15\0005\5\14\0=\5\16\4=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsettings\bzig\1\0\1\bzig\0\16diagnostics\1\0\1\16diagnostics\0\1\0\1\venable\2\rroot_dir\fzig.mod\14build.zig\17root_pattern\tutil\14filetypes\1\2\0\0\bzig\bcmd\1\0\4\rroot_dir\0\rsettings\0\bcmd\0\14filetypes\0\1\2\0\0\19zig-langserver\nsetup\nzigls\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nß\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\2\21ensure_installed\0\14highlight\0\1\2\0\0\bzig\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["tabby.nvim"] = {
    config = { "\27LJ\2\nµ\2\0\0\17\0\16\00106\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0024\1\0\0)\2\1\0\18\3\0\0)\4\1\0M\2!Ä6\6\0\0009\6\1\0069\6\4\6\18\b\5\0B\6\2\2:\6\1\0066\a\0\0009\a\1\a9\a\5\a\18\t\6\0B\a\2\0026\b\0\0009\b\1\b9\b\6\b\18\n\6\0'\v\a\0B\b\3\2\t\b\0\0X\b\2Ä'\b\b\0X\t\1Ä'\b\t\0006\t\n\0009\t\v\t\18\v\1\0006\f\f\0009\f\r\f'\14\14\0\18\15\a\0\18\16\b\0B\f\4\0A\t\1\1O\2ﬂ\1276\2\n\0009\2\15\2\18\4\1\0'\5\t\0D\2\3\0\vconcat\f %s %s \vformat\vstring\vinsert\ntable\5\b‚óè\14&modified\14getbufvar\fbufname\19tabpagebuflist\6$\14tabpagenr\afn\bvim\2T\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\ftabline\1\0\1\ftabline\0\0\nsetup\ntabby\frequire\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/tabby.nvim",
    url = "https://github.com/nanozuki/tabby.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\ns\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NERDTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
-- Config for: tabby.nvim
time([[Config for tabby.nvim]], true)
try_loadstring("\27LJ\2\nµ\2\0\0\17\0\16\00106\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0024\1\0\0)\2\1\0\18\3\0\0)\4\1\0M\2!Ä6\6\0\0009\6\1\0069\6\4\6\18\b\5\0B\6\2\2:\6\1\0066\a\0\0009\a\1\a9\a\5\a\18\t\6\0B\a\2\0026\b\0\0009\b\1\b9\b\6\b\18\n\6\0'\v\a\0B\b\3\2\t\b\0\0X\b\2Ä'\b\b\0X\t\1Ä'\b\t\0006\t\n\0009\t\v\t\18\v\1\0006\f\f\0009\f\r\f'\14\14\0\18\15\a\0\18\16\b\0B\f\4\0A\t\1\1O\2ﬂ\1276\2\n\0009\2\15\2\18\4\1\0'\5\t\0D\2\3\0\vconcat\f %s %s \vformat\vstring\vinsert\ntable\5\b‚óè\14&modified\14getbufvar\fbufname\19tabpagebuflist\6$\14tabpagenr\afn\bvim\2T\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\ftabline\1\0\1\ftabline\0\0\nsetup\ntabby\frequire\0", "config", "tabby.nvim")
time([[Config for tabby.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n \2\0\0\a\0\20\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\0026\3\0\0'\5\1\0B\3\2\0029\3\t\0039\3\n\3'\5\v\0'\6\f\0B\3\3\2=\3\r\0025\3\17\0005\4\15\0005\5\14\0=\5\16\4=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsettings\bzig\1\0\1\bzig\0\16diagnostics\1\0\1\16diagnostics\0\1\0\1\venable\2\rroot_dir\fzig.mod\14build.zig\17root_pattern\tutil\14filetypes\1\2\0\0\bzig\bcmd\1\0\4\rroot_dir\0\rsettings\0\bcmd\0\14filetypes\0\1\2\0\0\19zig-langserver\nsetup\nzigls\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÏ\3\1\0\b\0\27\0/6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\n\0009\5\b\0009\5\t\5B\5\1\2=\5\v\0049\5\b\0009\5\f\5B\5\1\2=\5\r\0049\5\b\0009\5\14\5B\5\1\2=\5\15\0049\5\b\0009\5\16\0055\a\17\0B\5\2\2=\5\18\4=\4\b\0034\4\4\0005\5\19\0>\5\1\0045\5\20\0>\5\2\0045\5\21\0>\5\3\4=\4\22\3B\1\2\0019\1\2\0009\1\23\1'\3\24\0005\4\26\0004\5\3\0005\6\25\0>\6\1\5=\5\22\4B\1\3\1K\0\1\0\1\0\1\fsources\0\1\0\1\tname\fcmdline\6:\fcmdline\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\rcomplete\n<C-p>\21select_prev_item\n<C-n>\1\0\4\14<C-Space>\0\n<C-p>\0\t<CR>\0\n<C-n>\0\21select_next_item\fmapping\fsnippet\1\0\3\fmapping\0\fsources\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nß\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\2\21ensure_installed\0\14highlight\0\1\2\0\0\bzig\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: monokai-pro.nvim
time([[Config for monokai-pro.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16monokai-pro\frequire\0", "config", "monokai-pro.nvim")
time([[Config for monokai-pro.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Neoformat', function(cmdargs)
          require('packer.load')({'neoformat'}, { cmd = 'Neoformat', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoformat'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neoformat ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
