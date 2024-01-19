local present, telescope = pcall(require, "telescope")
if not present then return end

-- telescope.load_extension("fzf")
telescope.setup({
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            previewer = true,
            mappings = {i = {["<c-d>"] = "delete_buffer"}, n = {["dd"] = "delete_buffer"}}
        }
    },
    -- extensions = {
    --     fzf = {
    --         fuzzy = true,
    --         override_generic_sorter = true,
    --         override_file_sorter = true,
    --         case_mode = "smart_case"
    --     }
    -- }
})
