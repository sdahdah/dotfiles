-- TODO undotree, refactoring, docker, cmake, debugging

require("paq") {
    "savq/paq-nvim",
    -- Dependencies
    "nvim-lua/plenary.nvim",                                        -- `telescope.nvim`
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- `telescope.nvim`
    -- Setup
    "stevearc/oil.nvim",
    "lewis6991/gitsigns.nvim",
    { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
    "nvim-telescope/telescope.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "vim-test/vim-test",
    "tpope/vim-dispatch",
    "tpope/vim-projectionist",
    "numToStr/Comment.nvim",
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
    -- No setup
    "tpope/vim-fugitive",
    "tpope/vim-sleuth",
    -- Colorschemes
    "fenetikm/falcon",
    "savq/melange-nvim",
    -- Under consideration
    -- "mfussenegger/nvim-dap",
    -- "preservim/vimux",
    -- "tpope/vim-surround",
    -- "tpope/vim-repeat",
    -- "tpope/vim-eunuch",  -- sudo edit and write
    -- "liuchengxu/vista.vim",
    -- "danymat/neogen",
}


require("oil").setup()
vim.keymap.set("n", "-",
    "<CMD>Oil<CR>",
    { desc = "Open parent directory" })

require("gitsigns").setup()
local gitsigns = require("gitsigns")
vim.keymap.set("n", "]h",
    function() gitsigns.nav_hunk("next") end,
    { desc = "Go to next hunk" })
vim.keymap.set("n", "[h",
    function() gitsigns.nav_hunk("prev") end,
    { desc = "Go to previous hunk" })
vim.keymap.set("n", "]H",
    function() gitsigns.nav_hunk("last") end,
    { desc = "Go to last hunk" })
vim.keymap.set("n", "[H",
    function() gitsigns.nav_hunk("first") end,
    { desc = "Go to first hunk" })
vim.keymap.set("n", "<leader>hs",
    gitsigns.stage_hunk,
    { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr",
    gitsigns.reset_hunk,
    { desc = "Reset hunk" })
vim.keymap.set("v", "<leader>hs",
    function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
    { desc = "Stage visual hunk" })
vim.keymap.set("v", "<leader>hr",
    function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
    { desc = "Reset visual hunk" })
vim.keymap.set("n", "<leader>hS",
    gitsigns.stage_buffer,
    { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>hR",
    gitsigns.reset_buffer,
    { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>hp",
    gitsigns.preview_hunk,
    { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hi",
    gitsigns.preview_hunk_inline,
    { desc = "Preview hunk inline" })
vim.keymap.set("n", "<leader>hb",
    function() gitsigns.blame_line({ full = true }) end,
    { desc = "View blame" })
vim.keymap.set("n", "<leader>hd",
    gitsigns.diffthis,
    { desc = "View diff against index" })
vim.keymap.set("n", "<leader>hD",
    function() gitsigns.diffthis("~") end,
    { desc = "View diff against last commit" })
vim.keymap.set("n", "<leader>hq",
    gitsigns.setqflist,
    { desc = "List buffer hunks in quickfix" })
vim.keymap.set("n", "<leader>hQ",
    function() gitsigns.setqflist("all") end,
    { desc = "List repository hunks in quickfix" })
vim.keymap.set("n", "<leader>hB",
    gitsigns.toggle_current_line_blame,
    { desc = "Toggle blame" })
vim.keymap.set("n", "<leader>hW",
    gitsigns.toggle_word_diff,
    { desc = "Toggle word diff" })
vim.keymap.set({ "o", "x" }, "ih",
    gitsigns.select_hunk,
    { desc = "Inner hunk" })

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>i",
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

require("telescope").setup()
require("telescope").load_extension("fzf")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

require("ibl").setup({
    indent = {
        char = "▏",
    },
    scope = {
        enabled = false,
    },
})

-- vim-test
vim.g["test#strategy"] = "dispatch"
vim.keymap.set("n", "<leader>tn", "<CMD>TestNearest<CR>", { desc = "Test nearest" })
vim.keymap.set("n", "<leader>tf", "<CMD>TestFile<CR>", { desc = "Test file" })
vim.keymap.set("n", "<leader>ts", "<CMD>TestSuite<CR>", { desc = "Test suite" })
vim.keymap.set("n", "<leader>tl", "<CMD>TestLast<CR>", { desc = "Test last" })
vim.keymap.set("n", "<leader>tv", "<CMD>TestVisit<CR>", { desc = "Visit test" })

-- vim-dispatch
vim.dispatch_no_maps = 1

-- vim-projectionist
vim.g.projectionist_heuristics = {}

require("Comment").setup()

require("mason").setup()

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {})
end

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require"
                },
                disable = { "missing-fields", "param-type-mismatch" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Set completion options
vim.opt.completeopt = "menuone,noselect,popup"

-- See `:help lsp-defaults` for default LSP mappings
--
-- omnifunc (insert mode CTRL-X CTRL-O)
-- tagfunc (CTRL-], CTRL-W ], CTRL-W })
-- formatexpr (gq, bypass with gw)
--
-- K hover
-- grr references
-- gra code_action
-- grn rename
-- gri implementation
-- grt type_definition (in later version of nvim)
-- gO document_symbol
-- i_CTRL-S signature_help
--
vim.keymap.set("n", "]e",
    function() vim.diagnostic.jump({ count = 1, float = true }) end,
    { desc = "Go to next diagnostic" })
vim.keymap.set("n", "[e",
    function() vim.diagnostic.jump({ count = -1, float = true }) end,
    { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<leader>se",
    vim.diagnostic.open_float,
    { desc = "Open diagnostic" })
vim.keymap.set("n", "<leader>sE",
    vim.diagnostic.setloclist,
    { desc = "Open diagnostics in location list" })
vim.keymap.set("n", "<leader>sf",
    vim.lsp.buf.format,
    { desc = "Format buffer" })

-- Use treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Prevent folds closing by default
vim.opt.foldenable = false
-- Prevent all inner folds closing when outer is closed
vim.opt.foldlevel = 20

-- Line numbers and columns
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- Invisible characters
vim.opt.list = true
vim.opt.listchars:append({
    nbsp = "¬",
    tab = "| ",
    extends = "»",
    precedes = "«",
    trail = "·",
})
vim.opt.showbreak = "↳ "

-- Wrapping
vim.opt.wrap = false
vim.opt.linebreak = true

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("melange")

-- Load and run local config
local init_local_loaded, init_local = pcall(require, "init_local")
local init_local_run = false
if init_local_loaded then
    init_local_run = init_local.run()
end
-- Set defaults if local config not loaded or used
if not init_local_run then
    -- TODO
end
