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
local package_path_str = "/home/edbert/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?.lua;/home/edbert/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?/init.lua;/home/edbert/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?.lua;/home/edbert/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/edbert/.cache/nvim/packer_hererocks/2.1.1713484068/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-save.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14auto-save\frequire\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
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
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
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
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n§\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\2\21ensure_installed\0\14highlight\0\1\2\0\0\bzig\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tabby.nvim"] = {
    config = { "\27LJ\2\n©\2\0\1\b\2\15\0/9\1\0\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1\14\0\1\0X\2\2€-\1\0\0009\1\2\0015\2\r\0-\3\1\0009\3\3\3'\5\4\0\18\6\1\0-\a\0\0009\a\5\aB\3\4\2>\3\1\0029\3\0\0B\3\1\2\15\0\3\0X\4\2€'\3\6\0X\4\1€'\3\a\0>\3\2\0029\3\b\0B\3\1\2>\3\3\0029\3\t\0B\3\1\2>\3\4\0029\3\n\0'\5\v\0B\3\2\2>\3\5\2-\3\1\0009\3\3\3'\5\f\0\18\6\1\0-\a\0\0009\a\5\aB\3\4\2>\3\6\2=\1\14\2L\2\2\0\0\0\0À\ahl\1\0\2\ahl\0\vmargin\6 \bî‚¼\bï€\14close_btn\tname\vnumber\tó°†£\bï†’\tfill\bî‚º\bsep\btab\16current_tab\15is_current×\1\0\1\a\2\v\0\"5\1\t\0-\2\0\0009\2\0\2'\4\1\0-\5\1\0009\5\2\5-\6\1\0009\6\3\6B\2\4\2>\2\1\0019\2\4\0B\2\1\2\15\0\2\0X\3\2€'\2\5\0X\3\1€'\2\6\0>\2\2\0019\2\a\0B\2\1\2>\2\3\1-\2\0\0009\2\0\2'\4\b\0-\5\1\0009\5\2\5-\6\1\0009\6\3\6B\2\4\2>\2\4\1-\2\1\0009\2\2\2=\2\n\1L\1\2\0\0À\0\0\ahl\1\0\2\ahl\0\vmargin\6 \bî‚¼\rbuf_name\bï„Œ\bï†’\15is_current\tfill\bwin\bî‚º\bsepÞ\2\1\1\b\1\18\00165\1\17\0004\2\3\0005\3\0\0-\4\0\0009\4\1\4=\4\2\3>\3\1\0029\3\3\0'\5\4\0-\6\0\0009\6\1\6-\a\0\0009\a\5\aB\3\4\0?\3\0\0>\2\1\0019\2\6\0B\2\1\0029\2\a\0023\4\b\0B\2\2\2>\2\2\0019\2\t\0B\2\1\2>\2\3\0019\2\n\0009\4\v\0009\4\f\4B\4\1\0A\2\0\0029\2\a\0023\4\r\0B\2\2\2>\2\4\0014\2\3\0009\3\3\0'\5\14\0-\6\0\0009\6\15\6-\a\0\0009\a\5\aB\3\4\2>\3\1\0025\3\16\0-\4\0\0009\4\15\4=\4\2\3>\3\2\2>\2\5\1-\2\0\0009\2\5\2=\2\2\0012\0\0€L\1\2\0\0À\1\0\1\ahl\0\1\2\1\0\n ïƒ¶ \ahl\0\ttail\bî‚º\0\20get_current_tab\bapi\16wins_in_tab\vspacer\0\fforeach\ttabs\tfill\bî‚¼\bsep\ahl\thead\1\2\1\0\n îŸ… \ahl\0\5€€À™\4³\1\1\0\5\0\a\0\v5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0003\4\4\0=\4\6\3B\1\2\0012\0\0€K\0\1\0\tline\1\0\1\tline\0\0\nsetup\ntabby\frequire\1\0\6\tfill\16TabLineFill\ttail\fTabLine\btab\fTabLine\bwin\fTabLine\16current_tab\15TabLineSel\thead\fTabLine\0" },
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/tabby.nvim",
    url = "https://github.com/nanozuki/tabby.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/edbert/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\ns\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NERDTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n§\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\2\21ensure_installed\0\14highlight\0\1\2\0\0\bzig\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: tabby.nvim
time([[Config for tabby.nvim]], true)
try_loadstring("\27LJ\2\n©\2\0\1\b\2\15\0/9\1\0\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1\14\0\1\0X\2\2€-\1\0\0009\1\2\0015\2\r\0-\3\1\0009\3\3\3'\5\4\0\18\6\1\0-\a\0\0009\a\5\aB\3\4\2>\3\1\0029\3\0\0B\3\1\2\15\0\3\0X\4\2€'\3\6\0X\4\1€'\3\a\0>\3\2\0029\3\b\0B\3\1\2>\3\3\0029\3\t\0B\3\1\2>\3\4\0029\3\n\0'\5\v\0B\3\2\2>\3\5\2-\3\1\0009\3\3\3'\5\f\0\18\6\1\0-\a\0\0009\a\5\aB\3\4\2>\3\6\2=\1\14\2L\2\2\0\0\0\0À\ahl\1\0\2\ahl\0\vmargin\6 \bî‚¼\bï€\14close_btn\tname\vnumber\tó°†£\bï†’\tfill\bî‚º\bsep\btab\16current_tab\15is_current×\1\0\1\a\2\v\0\"5\1\t\0-\2\0\0009\2\0\2'\4\1\0-\5\1\0009\5\2\5-\6\1\0009\6\3\6B\2\4\2>\2\1\0019\2\4\0B\2\1\2\15\0\2\0X\3\2€'\2\5\0X\3\1€'\2\6\0>\2\2\0019\2\a\0B\2\1\2>\2\3\1-\2\0\0009\2\0\2'\4\b\0-\5\1\0009\5\2\5-\6\1\0009\6\3\6B\2\4\2>\2\4\1-\2\1\0009\2\2\2=\2\n\1L\1\2\0\0À\0\0\ahl\1\0\2\ahl\0\vmargin\6 \bî‚¼\rbuf_name\bï„Œ\bï†’\15is_current\tfill\bwin\bî‚º\bsepÞ\2\1\1\b\1\18\00165\1\17\0004\2\3\0005\3\0\0-\4\0\0009\4\1\4=\4\2\3>\3\1\0029\3\3\0'\5\4\0-\6\0\0009\6\1\6-\a\0\0009\a\5\aB\3\4\0?\3\0\0>\2\1\0019\2\6\0B\2\1\0029\2\a\0023\4\b\0B\2\2\2>\2\2\0019\2\t\0B\2\1\2>\2\3\0019\2\n\0009\4\v\0009\4\f\4B\4\1\0A\2\0\0029\2\a\0023\4\r\0B\2\2\2>\2\4\0014\2\3\0009\3\3\0'\5\14\0-\6\0\0009\6\15\6-\a\0\0009\a\5\aB\3\4\2>\3\1\0025\3\16\0-\4\0\0009\4\15\4=\4\2\3>\3\2\2>\2\5\1-\2\0\0009\2\5\2=\2\2\0012\0\0€L\1\2\0\0À\1\0\1\ahl\0\1\2\1\0\n ïƒ¶ \ahl\0\ttail\bî‚º\0\20get_current_tab\bapi\16wins_in_tab\vspacer\0\fforeach\ttabs\tfill\bî‚¼\bsep\ahl\thead\1\2\1\0\n îŸ… \ahl\0\5€€À™\4³\1\1\0\5\0\a\0\v5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0003\4\4\0=\4\6\3B\1\2\0012\0\0€K\0\1\0\tline\1\0\1\tline\0\0\nsetup\ntabby\frequire\1\0\6\tfill\16TabLineFill\ttail\fTabLine\btab\fTabLine\bwin\fTabLine\16current_tab\15TabLineSel\thead\fTabLine\0", "config", "tabby.nvim")
time([[Config for tabby.nvim]], false)
-- Config for: auto-save.nvim
time([[Config for auto-save.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14auto-save\frequire\0", "config", "auto-save.nvim")
time([[Config for auto-save.nvim]], false)
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
