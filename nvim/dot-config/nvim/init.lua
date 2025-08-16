require "paq" {
    "savq/paq-nvim",
    "fenetikm/falcon",
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}

vim.opt.termguicolors = true
vim.cmd.colorscheme "falcon"
