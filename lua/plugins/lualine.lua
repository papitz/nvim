local lualine_style = 4

local lualine_styles = {
    {{left = " ", right = " "}, {left = "│", right = "│"}},
    {{left = " ", right = ""}, {left = " ", right = " "}},
    {{left = "", right = ""}, {left = " ", right = " "}},
    {{left = "", right = ""}, {left = "", right = ""}},
    {{left = "", right = ""}, {left = " ", right = " "}}
}

--  TODO: Check if these work

return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim',
            'cbochs/grapple.nvim'
        },
        opts = function()
            local function grapple()
                local key = require("grapple").key()
                return " " .. key .. ""
            end

            require("lsp-progress").setup({})
            local function lsp_progress()
                return require('lsp-progress').progress()
            end

            return {
                options = {
                    theme = "auto",
                    disabled_filetypes = {
                        "toggleterm", "NvimTree", "neo-tree", "dapui_scopes",
                        "dapui_breakpoints", "dapui_stacks", "dapui_watches",
                        "dap-repl"
                    },
                    section_separators = lualine_styles[lualine_style][1],
                    component_separators = lualine_styles[lualine_style][2]
                },
                extensions = {"fugitive"},
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch", "diff"},
                    lualine_c = {lsp_progress},
                    lualine_x = {
                        "encoding", {"filetype", icon = {align = 'left'}}
                    },
                    lualine_y = {"progress", "location"},
                    lualine_z = {grapple, "filename"}
                }
            }
        end
    },
}
