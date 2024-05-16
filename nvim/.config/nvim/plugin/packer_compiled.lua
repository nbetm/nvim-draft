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
local package_path_str = "/Users/nbetm/.config/cache/nvim/packer_hererocks/2.1.1713773202/share/lua/5.1/?.lua;/Users/nbetm/.config/cache/nvim/packer_hererocks/2.1.1713773202/share/lua/5.1/?/init.lua;/Users/nbetm/.config/cache/nvim/packer_hererocks/2.1.1713773202/lib/luarocks/rocks-5.1/?.lua;/Users/nbetm/.config/cache/nvim/packer_hererocks/2.1.1713773202/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nbetm/.config/cache/nvim/packer_hererocks/2.1.1713773202/lib/lua/5.1/?.so"
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
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0'        colorscheme gruvbox\n      \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_prev_item\fvisibleä\4\1\0\v\0!\0>6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\30\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\aB\a\1\2=\a\b\0069\a\3\0009\a\t\aB\a\1\2=\a\n\0069\a\3\0009\a\v\a)\tüÿB\a\2\2=\a\f\0069\a\3\0009\a\v\a)\t\4\0B\a\2\2=\a\r\0069\a\3\0009\a\14\aB\a\1\2=\a\15\0069\a\3\0009\a\16\aB\a\1\2=\a\17\0069\a\3\0009\a\18\a5\t\21\0009\n\19\0009\n\20\n=\n\22\tB\a\2\2=\a\23\0069\a\3\0003\t\24\0005\n\25\0B\a\3\2=\a\26\0069\a\3\0003\t\27\0005\n\28\0B\a\3\2=\a\29\6B\4\2\2=\4\3\0034\4\3\0005\5\31\0>\5\1\4=\4 \3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\rnvim_lsp\1\0\2\fmapping\0\fsources\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\2\vselect\2\rbehavior\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\t\n<C-f>\0\t<CR>\0\n<C-d>\0\n<C-n>\0\f<S-Tab>\0\n<C-p>\0\n<Tab>\0\n<C-e>\0\14<C-Space>\0\21select_prev_item\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nd\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprintÎ\a\1\2\t\0&\0–\0016\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0015\2\5\0=\1\6\0026\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0006\a\0\0009\a\v\a9\a\f\a9\a\r\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\14\0006\a\0\0009\a\v\a9\a\f\a9\a\15\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\16\0006\a\0\0009\a\v\a9\a\f\a9\a\17\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\18\0006\a\0\0009\a\v\a9\a\f\a9\a\19\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\20\0006\a\0\0009\a\v\a9\a\f\a9\a\21\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\22\0006\a\0\0009\a\v\a9\a\f\a9\a\23\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\24\0006\a\0\0009\a\v\a9\a\f\a9\a\25\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\26\0003\a\27\0\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\28\0006\a\0\0009\a\v\a9\a\f\a9\a\29\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\30\0006\a\0\0009\a\v\a9\a\f\a9\a\31\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6 \0006\a\0\0009\a\v\a9\a\f\a9\a!\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\"\0006\a\0\0009\a\v\a9\a\f\a9\a#\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6$\0006\a\0\0009\a\v\a9\a\f\a9\a%\a\18\b\2\0B\3\5\1K\0\1\0\15formatting\r<space>f\15references\agr\16code_action\14<space>ca\vrename\14<space>rn\20type_definition\r<space>D\0\14<space>wl\28remove_workspace_folder\14<space>wr\25add_workspace_folder\14<space>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\3\vbuffer\0\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimÆ\3\1\0\f\0\22\0:6\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0006\6\3\0009\6\b\0069\6\t\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\n\0006\6\3\0009\6\b\0069\6\v\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\f\0006\6\3\0009\6\b\0069\6\r\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0006\6\3\0009\6\b\0069\6\15\6\18\a\1\0B\2\5\0013\2\16\0005\3\17\0006\4\18\0\18\6\3\0B\4\2\4X\a\5€8\t\b\0009\t\19\t5\v\20\0=\2\21\vB\t\2\1E\a\3\3R\aù\127K\0\1\0\14on_attach\1\0\1\14on_attach\0\nsetup\vipairs\1\6\0\0\vbashls\vjsonls\fpyright\16terraformls\vyamlls\0\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n„\a\0\0\6\0\25\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0004\4\0\0=\4\b\3=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\0024\3\3\0005\4\16\0>\4\1\3=\3\17\0025\3\20\0005\4\18\0005\5\19\0=\5\f\4=\4\21\3=\3\22\0025\3\23\0=\3\24\2B\0\2\1K\0\1\0\frainbow\1\0\3\18extended_mode\2\venable\2\19max_file_lines\3Ð\15\16textobjects\vselect\1\0\1\vselect\0\1\0\n\aac\17@class.outer\aif\20@function.inner\aar\21@parameter.outer\aaf\20@function.outer\air\21@parameter.inner\aab\17@block.outer\aib\17@block.inner\ail\16@loop.inner\aal\16@loop.outer\aic\17@class.inner\1\0\3\14lookahead\2\venable\2\fkeymaps\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\t<CR>\21node_decremental\f<S-TAB>\19init_selection\t<CR>\21node_incremental\n<TAB>\1\0\2\venable\2\fkeymaps\0\14highlight\fdisable\1\0\2\venable\2\fdisable\0\19ignore_install\21ensure_installed\1\0\b\26incremental_selection\0\frainbow\0\19ignore_install\0\vindent\0\21ensure_installed\0\16textobjects\0\14highlight\0\14autopairs\0\1\f\0\0\tbash\ncmake\15dockerfile\bhcl\thtml\tjson\blua\rmarkdown\vpython\ttoml\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/nbetm/.config/local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nd\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprintÎ\a\1\2\t\0&\0–\0016\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0015\2\5\0=\1\6\0026\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0006\a\0\0009\a\v\a9\a\f\a9\a\r\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\14\0006\a\0\0009\a\v\a9\a\f\a9\a\15\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\16\0006\a\0\0009\a\v\a9\a\f\a9\a\17\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\18\0006\a\0\0009\a\v\a9\a\f\a9\a\19\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\20\0006\a\0\0009\a\v\a9\a\f\a9\a\21\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\22\0006\a\0\0009\a\v\a9\a\f\a9\a\23\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\24\0006\a\0\0009\a\v\a9\a\f\a9\a\25\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\26\0003\a\27\0\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\28\0006\a\0\0009\a\v\a9\a\f\a9\a\29\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\30\0006\a\0\0009\a\v\a9\a\f\a9\a\31\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6 \0006\a\0\0009\a\v\a9\a\f\a9\a!\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6\"\0006\a\0\0009\a\v\a9\a\f\a9\a#\a\18\b\2\0B\3\5\0016\3\0\0009\3\a\0039\3\b\3'\5\t\0'\6$\0006\a\0\0009\a\v\a9\a\f\a9\a%\a\18\b\2\0B\3\5\1K\0\1\0\15formatting\r<space>f\15references\agr\16code_action\14<space>ca\vrename\14<space>rn\20type_definition\r<space>D\0\14<space>wl\28remove_workspace_folder\14<space>wr\25add_workspace_folder\14<space>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\3\vbuffer\0\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimÆ\3\1\0\f\0\22\0:6\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0006\6\3\0009\6\b\0069\6\t\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\n\0006\6\3\0009\6\b\0069\6\v\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\f\0006\6\3\0009\6\b\0069\6\r\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0006\6\3\0009\6\b\0069\6\15\6\18\a\1\0B\2\5\0013\2\16\0005\3\17\0006\4\18\0\18\6\3\0B\4\2\4X\a\5€8\t\b\0009\t\19\t5\v\20\0=\2\21\vB\t\2\1E\a\3\3R\aù\127K\0\1\0\14on_attach\1\0\1\14on_attach\0\nsetup\vipairs\1\6\0\0\vbashls\vjsonls\fpyright\16terraformls\vyamlls\0\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_prev_item\fvisibleä\4\1\0\v\0!\0>6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\30\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\aB\a\1\2=\a\b\0069\a\3\0009\a\t\aB\a\1\2=\a\n\0069\a\3\0009\a\v\a)\tüÿB\a\2\2=\a\f\0069\a\3\0009\a\v\a)\t\4\0B\a\2\2=\a\r\0069\a\3\0009\a\14\aB\a\1\2=\a\15\0069\a\3\0009\a\16\aB\a\1\2=\a\17\0069\a\3\0009\a\18\a5\t\21\0009\n\19\0009\n\20\n=\n\22\tB\a\2\2=\a\23\0069\a\3\0003\t\24\0005\n\25\0B\a\3\2=\a\26\0069\a\3\0003\t\27\0005\n\28\0B\a\3\2=\a\29\6B\4\2\2=\4\3\0034\4\3\0005\5\31\0>\5\1\4=\4 \3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\rnvim_lsp\1\0\2\fmapping\0\fsources\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\2\vselect\2\rbehavior\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\t\n<C-f>\0\t<CR>\0\n<C-d>\0\n<C-n>\0\f<S-Tab>\0\n<C-p>\0\n<Tab>\0\n<C-e>\0\14<C-Space>\0\21select_prev_item\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0'        colorscheme gruvbox\n      \bcmd\bvim\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n„\a\0\0\6\0\25\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0004\4\0\0=\4\b\3=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\0024\3\3\0005\4\16\0>\4\1\3=\3\17\0025\3\20\0005\4\18\0005\5\19\0=\5\f\4=\4\21\3=\3\22\0025\3\23\0=\3\24\2B\0\2\1K\0\1\0\frainbow\1\0\3\18extended_mode\2\venable\2\19max_file_lines\3Ð\15\16textobjects\vselect\1\0\1\vselect\0\1\0\n\aac\17@class.outer\aif\20@function.inner\aar\21@parameter.outer\aaf\20@function.outer\air\21@parameter.inner\aab\17@block.outer\aib\17@block.inner\ail\16@loop.inner\aal\16@loop.outer\aic\17@class.inner\1\0\3\14lookahead\2\venable\2\fkeymaps\0\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\t<CR>\21node_decremental\f<S-TAB>\19init_selection\t<CR>\21node_incremental\n<TAB>\1\0\2\venable\2\fkeymaps\0\14highlight\fdisable\1\0\2\venable\2\fdisable\0\19ignore_install\21ensure_installed\1\0\b\26incremental_selection\0\frainbow\0\19ignore_install\0\vindent\0\21ensure_installed\0\16textobjects\0\14highlight\0\14autopairs\0\1\f\0\0\tbash\ncmake\15dockerfile\bhcl\thtml\tjson\blua\rmarkdown\vpython\ttoml\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

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
