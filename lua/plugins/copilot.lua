-- vim.keymap.set('i', '<C-h>', 'copilot#Accept("\\<CR>")',
--                {expr = true, replace_keycodes = false})
-- vim.g.copilot_no_tab_map = true
-- return {"github/copilot.vim"}
return {
    {'AndreM222/copilot-lualine'}, {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    -- This controls if copilot is triggered on input
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<C-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>"
                    }
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false
                }
            })
        end
    }, {
        "CopilotC-Nvim/CopilotChat.nvim",
        opts = {
            show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
            debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
            disable_extra_info = 'yes', -- Disable extra information (e.g: system prompt) in the response.
            -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
            prompts = {
                Explain = "Please explain how the following code works.",
                Review = "Please review the following code and provide suggestions for improvement.",
                Tests = "Please explain how the selected code works, then generate unit tests for it.",
                Refactor = "Please refactor the following code to improve its clarity and readability.",
                FixCode = "Please fix the following code to make it work as intended.",
                BetterNamings = "Please provide better names for the following variables and functions.",
                Documentation = "Please provide documentation for the following code.",
                SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
                SwaggerJsDocs = "Please write JSDoc for the following API using Swagger."
            }
        },
        build = function()
            vim.notify(
                "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
        end,
        event = "VeryLazy",
        keys = {
            {
                "<leader>ce",
                "<cmd>CopilotChatExplain<cr>",
                desc = "CopilotChat - Explain code"
            }, {
                "<leader>ct",
                "<cmd>CopilotChatTests<cr>",
                desc = "CopilotChat - Generate tests"
            }, {
                "<leader>cr",
                "<cmd>CopilotChatReview<cr>",
                desc = "CopilotChat - Review code"
            }, {
                "<leader>cR",
                "<cmd>CopilotChatRefactor<cr>",
                desc = "CopilotChat - Refactor code"
            },
            {
                "<leader>cf",
                "<cmd>CopilotChatFixCode<cr>",
                desc = "CopilotChat - Fix code"
            }, {
                "<leader>cdd",
                "<cmd>CopilotChatDocumentation<cr>",
                desc = "CopilotChat - Write documentation"
            }, {
                "<leader>cds",
                "<cmd>CopilotChatSwaggerApiDocs<cr>",
                desc = "CopilotChat - Write swagger api documentation"
            }, {
                "<leader>cdj",
                "<cmd>CopilotChatSwaggerJsDocs<cr>",
                desc = "CopilotChat - Write swagger js documentation"
            },
            {
                "<leader>cc",
                ":CopilotChat ",
                desc = "CopilotChat - Open Chat window"
            }, {
                "<leader>cv",
                ":CopilotChatVisual",
                mode = "x",
                desc = "CopilotChat - Open in vertical split"
            }, {
                "<leader>cx",
                ":CopilotChatInPlace<cr>",
                mode = "x",
                desc = "CopilotChat - Run in-place code"
            }
        }
    }
}
