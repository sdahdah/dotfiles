-- TODO undotree, refactoring, vimux, vim-test, luasnip, vim-dispatch, vim-projectionist

require("paq") {
    "savq/paq-nvim",
    "stevearc/oil.nvim",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    {"nvim-treesitter/nvim-treesitter", build=":TSUpdate"},
    "nvim-lua/plenary.nvim",  -- For `telescope.nvim`
    {"nvim-telescope/telescope-fzf-native.nvim", build="make"},  -- For `telescope.nvim`
    "nvim-telescope/telescope.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "numToStr/Comment.nvim",
    "preservim/vimux",
    "mason-org/mason.nvim",
    -- {"sakhnik/nvim-gdb", build="./install.sh"},
    -- {"L3MON4D3/LuaSnip", build="make install_jsregexp"},
    "neovim/nvim-lspconfig",
    -- Colorschemes
    "fenetikm/falcon",
    "savq/melange-nvim",
}

-- `oil.nvim`
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})

-- `gitsigns.nvim`
require("gitsigns").setup({
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({"]c", bang = true})
      else
        gitsigns.nav_hunk("next")
      end
    end)

    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({"[c", bang = true})
      else
        gitsigns.nav_hunk("prev")
      end
    end)

    -- Actions
    map("n", "<leader>hs", gitsigns.stage_hunk)
    map("n", "<leader>hr", gitsigns.reset_hunk)

    map("v", "<leader>hs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)

    map("v", "<leader>hr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)

    map("n", "<leader>hS", gitsigns.stage_buffer)
    map("n", "<leader>hR", gitsigns.reset_buffer)
    map("n", "<leader>hp", gitsigns.preview_hunk)
    map("n", "<leader>hi", gitsigns.preview_hunk_inline)

    map("n", "<leader>hb", function()
      gitsigns.blame_line({ full = true })
    end)

    map("n", "<leader>hd", gitsigns.diffthis)

    map("n", "<leader>hD", function()
      gitsigns.diffthis("~")
    end)

    map("n", "<leader>hQ", function() gitsigns.setqflist("all") end)
    map("n", "<leader>hq", gitsigns.setqflist)

    -- Toggles
    map("n", "<leader>htb", gitsigns.toggle_current_line_blame)
    map("n", "<leader>htw", gitsigns.toggle_word_diff)

    -- Text object
    map({"o", "x"}, "ih", gitsigns.select_hunk)
  end
})

-- `nvim-treesitter`
require("nvim-treesitter.configs").setup({
    -- ensure_installed = {
    --     "comment",
    --     "yaml",
    --     "markdown",
    --     "lua",
    --     "python",
    --     "latex",
    --     "c",
    --     "cpp",
    --     "haskell",
    --     "rust",
    --     "matlab",
    -- },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Leader>i",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
        },
    },
    indent = {
        enable = true,
        -- disable = {"python"},
    },
})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- `telescope.nvim`
require("telescope").setup()
require("telescope").load_extension("fzf")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "Telescope find files"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "Telescope live grep"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "Telescope buffers"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "Telescope help tags"})

-- `indent-blankline.nvim`
require("ibl").setup({
    indent = {
        char = "▏",
    },
    scope = {
        enabled = false,
    },
})


-- `Comment.nvim`
require("Comment").setup()

-- `nvim.gdb`
-- `<leader>dd` GDB, `<leader>dl` LLDB, `<leader>dp` PDB, `<leader>db` BASH
-- vim.g.nvimgdb_disable_start_keymaps = 1

-- `LuaSnip`

-- `mason.nvim`
require("mason").setup()

-- `neovim/nvim-lspconfig`
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>se', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>sq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>swa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>swr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>swl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>sD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>sca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>sr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>sf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            -- Disable virtual_text
            virtual_text = false
        }
    ),
}

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    handlers = handlers,
    -- capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require'
                },
                disable = { 'missing-fields' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars:append({
    nbsp = "¬",
    tab = "| ",
    extends = "»",
    precedes = "«",
    trail = "·",
})
vim.opt.showbreak = "↳ "
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.cmd.colorscheme "melange"
