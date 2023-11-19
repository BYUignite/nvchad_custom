---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
    theme = "repent",
    theme_toggle = { "repent", "forsake" },

    hl_override = highlights.override,
    hl_add = highlights.add,

    tabufline = {
        show_numbers = true
    },

    statusline = {
        theme = "default",
        separator_style = "default",
        overriden_modules = function(modules)
            modules[1] = (function()
                if vim.api.nvim_get_current_win() ~= vim.g.statusline_winid then
                    return ""
                end
                local modes = {
                    ["n"] = { "NORMAL", "St_NormalMode" },
                    ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
                    ["v"] = { "VISUAL", "St_VisualMode" },
                    ["V"] = { "V-LINE", "St_VisualMode" },
                    ["Vs"] = { "V-LINE", "St_VisualMode" },
                    [""] = { "V-BLOCK", "St_VisualMode" },
                    ["i"] = { "INSERT", "St_InsertMode" },
                    ["t"] = { "TERMINAL", "St_TerminalMode" },
                    ["R"] = { "REPLACE", "St_ReplaceMode" },
                    ["s"] = { "SELECT", "St_SelectMode" },
                    ["S"] = { "S-LINE", "St_SelectMode" },
                    [""] = { "S-BLOCK", "St_SelectMode" },
                    ["c"] = { "COMMAND", "St_CommandMode" },
                    ["r"] = { "PROMPT", "St_ConfirmMode" },
                    ["rm"] = { "MORE", "St_ConfirmMode" },
                    ["r?"] = { "CONFIRM", "St_ConfirmMode" },
                    ["x"] = { "CONFIRM", "St_ConfirmMode" },
                    ["!"] = { "SHELL", "St_TerminalMode" },
                }
                local m = vim.api.nvim_get_mode().mode
                local current_mode = "%#" .. modes["n"][2] .. "# " .. modes[m][1] .. " "
                local mode_sep1 = "%#" .. modes["n"][2] .. "Sep#"
                return current_mode .. mode_sep1
            end)()
            modules[2] = (function()                              -- show current file
                local icon = " 󰈚 "
                local path = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.g.statusline_winid))
                local name = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"

                if name ~= "Empty " then
                    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

                    if devicons_present then
                        local ft_icon = devicons.get_icon(name)
                        icon = (ft_icon ~= nil and " " .. ft_icon) or icon
                    end

                    name = " " .. name .. " "
                end

                local mod = ''
                if vim.bo[vim.api.nvim_get_current_buf()].modified then
                    mod = '󰇂 '
                end

                --return "%#St_file_info#" .. icon .. name .. mod .. "%#St_file_sep# "
                return "%#St_file_info#" .. name .. mod .. "%#St_file_sep# "
            end)()
            -- modules[3] = (function() return "" end)()          -- turn off git
            -- modules[4] = (function() return "" end)()          -- turn off git
            -- modules[5] = (function() return "" end)()          -- turn off git
            -- modules[6] = (function() return "" end)()          -- turn off git
            -- modules[7] = (function() return "" end)()          -- turn off git
            modules[8] = (function() return "" end)()          -- turn off LSP info
            modules[9] = (function() return "" end)()          -- turn off directory
            modules[10] = (function()                          -- customize cursor location (line and column)
                local fn = vim.fn
            --    local left_sep = "%#St_NormalModeSep#" .. "%#St_NormalMode#" .. " "
                --local left_sep1 = "%#St_file_sep#" .. "%#St_NormalMode#"
                local left_sep1 = "%#St_LspStatus#" .. ""
                local left_sep2 = "%#St_NormalMode#  "
                local current_line = fn.line(".", vim.g.statusline_winid)
                local total_line = fn.line("$", vim.g.statusline_winid)
                local column = vim.api.nvim_win_get_cursor(0)[2]
                local text = current_line .. "/" .. total_line .. " 〣 " .. column
                return left_sep1 .. left_sep2 .. " " .. text .. " "
            end)()
	end,
    },       -- statusline
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M




