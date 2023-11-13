-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
    Comment = {
        italic = true,
    },
    CursorLine = {bold=true},
    IncSearch  = {bg="grey_fg", fg="folder_bg", bold=true},
    Search     = {bg="grey_fg2", fg="folder_bg", bold=true},

}

---@type HLTable
M.add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
}



return M
