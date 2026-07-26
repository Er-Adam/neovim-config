local state_file = vim.fn.stdpath("state") .. "/theme_state"

local f = io.open(state_file, "r")
if f then
    local theme = f:read("*all"):gsub("%s+", "")
    f:close()
    if theme == "light" or theme == "dark" then
        vim.o.background = theme
    end
else
    vim.o.background = "dark"
end

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,

        opts = {
            style = "moon",
            light_style = "day",
            transparent = false,

            styles = {
                sidebars = "dark",
                floats = "dark",
            },

            on_highlights = function(hl, c)
                if vim.o.background == "light" then
                    hl.Comment = { fg = "#5c6a72", italic = true }

                    hl.Keyword = { fg = "#5a3e8e", bold = true }
                    hl["@keyword"] = { fg = "#5a3e8e", bold = true }

                    hl.Type = { fg = "#2959aa", bold = true }
                    hl["@type"] = { fg = "#2959aa", bold = true }

                    hl.String = { fg = "#385f0d" }
                    hl["@string"] = { fg = "#385f0d" }

                    hl.Number = { fg = "#8f5e15" }
                    hl["@number"] = { fg = "#8f5e15" }

                    hl.Function = { fg = "#006c86" }
                    hl["@function"] = { fg = "#006c86" }

                    hl.Constant = { fg = "#965027" }
                    hl["@constant"] = { fg = "#965027" }

                    hl.Operator = { fg = "#8c4351" }
                    hl["@operator"] = { fg = "#8c4351" }

                    hl["@variable"] = { fg = "#343b58" }
                    hl.Identifier = { fg = "#343b58" }

                    hl["@property"] = { fg = "#0f4b6e" }
                    hl["@field"] = { fg = "#0f4b6e" }

                    hl.PreProc = { fg = "#0f4b6e" }

                    hl.Special = { fg = "#965027" }

                    hl.Todo = {
                        fg = "#f0f0f4",
                        bg = "#8f5e15",
                        bold = true,
                    }
                else
                    hl.Comment = { fg = "#4fa36f", italic = true }

                    hl.Keyword = { fg = "#bb86fc", bold = true }
                    hl["@keyword"] = { fg = "#bb86fc", bold = true }

                    hl.Type = { fg = "#7aa2f7", bold = true }
                    hl["@type"] = { fg = "#7aa2f7", bold = true }

                    hl.String = { fg = "#e3b05b" }
                    hl["@string"] = { fg = "#e3b05b" }

                    hl.Number = { fg = "#8fbf8a" }
                    hl["@number"] = { fg = "#8fbf8a" }

                    hl.Function = { fg = "#e6c85c" }
                    hl["@function"] = { fg = "#e6c85c" }

                    hl.Constant = { fg = "#ff6b6b" }
                    hl["@constant"] = { fg = "#ff6b6b" }

                    hl.Operator = { fg = "#f7768e" }
                    hl["@operator"] = { fg = "#f7768e" }

                    hl["@variable"] = { fg = "#73daca" }
                    hl.Identifier = { fg = "#73daca" }

                    hl["@property"] = { fg = "#7dcfff" }
                    hl["@field"] = { fg = "#7dcfff" }

                    hl.PreProc = { fg = "#7dcfff" }

                    hl.Special = { fg = "#ff9e64" }

                    hl.Todo = {
                        fg = "#1a1b26",
                        bg = "#e0af68",
                        bold = true,
                    }
                end
            end,
        },

        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")

            local function toggle_background()
                local new_bg = vim.o.background == "dark" and "light" or "dark"
                vim.o.background = new_bg

                local sf = io.open(state_file, "w")
                if sf then
                    sf:write(new_bg)
                    sf:close()
                end
            end

            vim.keymap.set("n", "<leader>tt", toggle_background, {
                desc = "Toggle Theme (Light/Dark)"
            })
        end,
    },
}
