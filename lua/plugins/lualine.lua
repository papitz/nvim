local present, lualine = pcall(function() return require("lualine") end)
if not present then return end

local lualine_style = 4

local lualine_styles = {
    {{left = " ", right = " "}, {left = "│", right = "│"}},
    {{left = " ", right = ""}, {left = " ", right = " "}},
    {{left = "", right = ""}, {left = " ", right = " "}},
    {{left = "", right = ""}, {left = "", right = ""}},
    {{left = "", right = ""}, {left = " ", right = " "}}
}

-- local function navic_location()
-- 	if navic.is_available() then
-- 		return navic.get_location()
-- 	else
-- 		return navic.is_available()
-- 	end
-- end
function grapple()
    local key = require("grapple").key()
    return " " .. key .. ""
end

lualine.setup({
    options = {
        theme = "auto",
        disabled_filetypes = {
            "toggleterm", "NvimTree", "neo-tree", "dapui_scopes",
            "dapui_breakpoints", "dapui_stacks", "dapui_watches", "dap-repl"
        },
        section_separators = lualine_styles[lualine_style][1],
        component_separators = lualine_styles[lualine_style][2]
    },
    extensions = {"fugitive"},
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {"grapple()", "filename"},
        -- lualine_b = { "branch", "diff", "filename" },
        -- lualine_c = { navic_location },
        --  TODO: This is broken for now. Test in some time again
        -- lualine_x = {"lsp_progress", "encoding", "filetype"},
        lualine_x = {"encoding", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    }
})
