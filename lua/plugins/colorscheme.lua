return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,

        opts = {
            style = "moon",
            transparent = false,

            styles = {
                sidebars = "dark",
                floats = "dark",
            },

            on_highlights = function(hl, c)
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
            end,
        },

        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
