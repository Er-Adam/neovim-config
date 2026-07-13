return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
        { "-", "<CMD>Telescope file_browser<CR>", desc = "Open File Browser" }
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local action_state = require("telescope.actions.state")
        local actions = require("telescope.actions")
        local fb_actions = require("telescope").extensions.file_browser.actions

        local function open_or_enter(prompt_bufnr)
            local entry = action_state.get_selected_entry()
            if not entry then
                return
            end

            if vim.fn.isdirectory(entry.path) == 1 then
                fb_actions.change_cwd(prompt_bufnr)
            else
                actions.select_default(prompt_bufnr)
            end
        end

        telescope.setup({
            extensions = {
                file_browser = {
                    initial_mode = "normal",
                    hijack_netrw = true,
                    hidden = true,
                    mappings = {
                        ["n"] = {
                            ["v"] = "file_vsplit",
                            ["s"] = "file_split",
                            ["t"] = "file_tab",

                            ["L"] = open_or_enter,
                            ["H"] = fb_actions.goto_parent_dir,
                            ["q"] = "close",

                            ["N"] = fb_actions.create,
                        },
                    },
                },
            },
        })

        telescope.load_extension("file_browser")
        telescope.load_extension('projects')
    end,
}
