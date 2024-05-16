local M = {}

local function extend(opt, list)
  if opt._info.flaglist then
    local flaglist = {}
    for _, v in ipairs(list) do
      flaglist[v] = true
    end
    list = flaglist
  end
  return opt + list
end

-- General
vim.opt.swapfile = true
vim.opt.dir = vim.fn.stdpath("data") .. "/swp"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.confirm = true
-- vim.opt.timeoutlen = 400
-- vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 500
vim.opt.history = 1000
vim.opt.clipboard = "unnamedplus"

-- Tabs
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Spell
-- vim.opt.spelllang = { "en_us" }
vim.opt.dictionary = extend(vim.opt.dictionary, { "/usr/share/dict/words" })

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"
vim.opt.wildmode = { "full", "list", "full" }
vim.opt.wildignorecase = true
vim.opt.wildignore = extend(vim.opt.wildignore, {
  "*.bak",
  "*.class",
  "*.DS_Store",
  "*.gif",
  "*.jpeg",
  "*.jpg",
  "*.min.js",
  "*.o",
  "*.obj",
  "*.out",
  "*.png",
  "*.pyc",
  "*.so",
  "*.swp",
  "*.zip",
  "*/__pycache__/*",
  "*/.egg-info/*",
  "*/.expo/*",
  "*/.git/*",
  "*/.hg/*",
  "*/.mypy_cache/*",
  "*/.next/*",
  "*/.pnp/*",
  "*/.pytest_cache/*",
  "*/.repo/*",
  "*/.sass-cache/*",
  "*/.svn/*",
  "*/.terraform/*",
  "*/.venv/*",
  "*/.yarn/*",
  "*/*-egg-info/*",
  "*/bower_modules/*",
  "*/build/*",
  "*/dist/*",
  "*/node_modules/*",
  "*/target/*",
  "*/venv/*",
  "*~",
})

-- Fold
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--Dev
vim.opt.fileencoding = "utf-8"
vim.opt.textwidth = 79
vim.opt.colorcolumn = "+1"
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.matchpairs = extend(vim.opt.matchpairs, { "<:>" })
vim.opt.formatoptions = extend(vim.opt.formatoptions, { "1", "o" })
vim.opt.whichwrap = extend(vim.opt.whichwrap, { "<", ">", "[", "]", "~" })
vim.opt.shortmess = extend(vim.opt.shortmess, { "a" })
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- UI
vim.opt.showtabline = 2
vim.opt.lazyredraw = true
vim.opt.showmode = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5
vim.opt.laststatus = 3
vim.opt.list = false
vim.opt.listchars = {
  eol = "¬",
  tab = ">·",
  trail = "~",
  extends = ">",
  precedes = "<",
  nbsp = "␣",
}

return M
