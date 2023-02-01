vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.smartcase = true 
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true 
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false 
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.linebreak = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.title = true
vim.opt.titlestring= "%f"
vim.opt.titlelen=70
vim.opt.wrap = false
vim.opt.termbidi = true
vim.opt.whichwrap = "bs<>[]hl"

vim.opt.shortmess:append "c"
vim.opt.iskeyword:append "-"
vim.opt.formatoptions:remove({ "c", "r", "o" })

vim.keymap.set('c', 'w!!', ':w ! sudo tee % > /dev/null')
