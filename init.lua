-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local g   = vim.g
local opt = vim.opt

g.mapleader = ","

opt.number     = false
opt.wrapscan   = false
opt.tabstop    = 4
opt.shiftwidth = 4
opt.wrap       = false
opt.showmatch  = true
opt.shada      = "!,%,'100,f1,<50,h,s10"
opt.timeoutlen = 300
opt.signcolumn = "no"
opt.shortmess:append "c"
opt.whichwrap  = "bs"                                    -- reset default (don't wrap on left right motion through lines)
-- opt.virtualedit="block"

vim.cmd([[autocmd FileType * set fo-=r fo-=c fo-=o]])    -- dont continue comments on enter, etc. see :h fo-table

--======== Folding

opt.foldopen:remove({"search"})               -- don't open folds when searching
opt.foldmethod = "marker"                     -- select then zf to fold; za, dz, zc, space: toggles, delete, close, open

--======== Autocommands

local autocmd = vim.api.nvim_create_autocmd

----- markdown, text, latex

autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.txt", "*.md", "*.tex"},
    callback = function()
        opt.wrap = true
        opt.linebreak = true
        opt.list = false
        opt.tw = 0
        opt.wm = 0
        vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap=true})
        vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap=true})
    end
})

----- markdown

autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.md",
    callback = function()
        vim.api.nvim_set_keymap('n', '<leader>v', '<cmd>MarkdownPreview<CR>', {noremap=true})
    end
})

----- latex

autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.tex",
    callback = function()
        vim.api.nvim_set_keymap('n', '<leader>v', '<cmd>w<CR> <cmd>VimtexCompile<CR>', {noremap=true})
    end
})

--======== Snippets: user directory location, etc.

vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/snippets"

--======== disable diagnostcs globally (diagnostics are a pain)

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end


