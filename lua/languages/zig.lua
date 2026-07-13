local textobjects = require("utils.textobjects")


local M = {}

M.parser = "zig"

function M.setup_lsp()
    local mr = require("mason-registry")
    if mr.has_package("zls") then
        local p = mr.get_package("zls")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("zls", {
        root_markers = { "build.zig", "zls.json", ".git" },

        settings = {
            zls = {
                enable_autofix = true,
                warn_style = true,
                enable_inlay_hints = true,
                inlay_hints_show_builtin = true,
            },
        },
    })

    vim.lsp.enable("zls")
end

function M.setup_lang()
    vim.keymap.set({ "o", "x" }, "ip", textobjects.select_inside_brackets, {
        buffer = true,
        silent = true,
        desc = "Inner paragraph (nested-safe curly brackets)"
    })
end

return M
