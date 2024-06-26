local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- -- Returns the require for use in `config` parameter of packer"s use
-- -- Expects the name of the config file
-- local function load_config(name)
--   return string.format("require("config/%s")", name)
-- end

-- Bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git", "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  execute "packadd packer.nvim"
end

-- Initialize and configure packer
local packer = require("packer")
packer.init({
  -- Enable profiling via :PackerCompile profile=true
  enable = true,
  -- The amount in ms that a plugins load time must be over for it to be
  -- included in the profile
  threshold = 0
})
-- local use = packer.use
-- packer.reset()
packer.startup(function(use)
  -- List of packages
  use "wbthomason/packer.nvim"

  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.cmd [[
        colorscheme gruvbox
      ]]
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects" }
    },
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "bash",
          "cmake",
          "dockerfile",
          "hcl",
          "html",
          "json",
          "lua",
          "markdown",
          "python",
          "toml",
          "yaml",
        },                   -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = {}, -- List of parsers to ignore installing
        highlight = {
          enable = true,     -- False will disable the whole extension
          disable = {},      -- List of language that will be disabled
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
          },
        },
        indent = { enable = true },
        autopairs = { { enable = true } },
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
              ["ib"] = "@block.inner",
              ["ab"] = "@block.outer",
              ["ir"] = "@parameter.inner",
              ["ar"] = "@parameter.outer",
            },
          },
        },
        rainbow = {
          enable = true,
          extended_mode = true,  -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
          max_file_lines = 2000, -- Do not enable for files with more than specified lines
        },
      }
    end
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          -- ["<C-k>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      }
    end
  }

  use {
    "neovim/nvim-lspconfig",
    requires = {
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      local nvim_lsp = require("lspconfig")
      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
      end

      -- Add additional capabilities supported by nvim-cmp
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

      -- Use a loop to conveniently call "setup" on multiple servers
      local servers = {
        "bashls",
        "jsonls",
        "pyright",
        "terraformls",
        "yamlls",
      }
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
          on_attach = on_attach,
          -- capabilities = capabilities,
        }
      end
    end
  }
end)
