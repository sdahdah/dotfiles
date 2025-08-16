require("paq") {
    "savq/paq-nvim",
    "neovim/nvim-lspconfig",
    "stevearc/oil.nvim",
    "lewis6991/gitsigns.nvim",
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "nvim-lua/plenary.nvim",  -- For `telescope.nvim`
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},  -- For `telescope.nvim`
    "nvim-telescope/telescope.nvim",
    -- Colorschemes
    "fenetikm/falcon",
    "savq/melange-nvim",
}

-- `oil.nvim`
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})

-- `gitsigns.nvim`
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
  end
})

-- `nvim-treesitter`
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "comment",
        "lua",
        "python",
        "latex",
        "yaml",
        "markdown",
        "c",
        "cpp",
        "haskell",
        "rust",
        "matlab",
    },
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

-- `neovim/nvim-lspconfig`

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
