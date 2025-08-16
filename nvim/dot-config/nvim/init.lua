require "paq" {
    "savq/paq-nvim",
    "fenetikm/falcon",
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'yes'
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
vim.cmd.colorscheme "falcon"
