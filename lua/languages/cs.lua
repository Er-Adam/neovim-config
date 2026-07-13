local textobjects = require("utils.textobjects")

local M = {}

M.parser = "c_sharp"

function M.setup_lsp()
    local mr = require("mason-registry")
    if mr.has_package("roslyn-language-server") then
        local p = mr.get_package("roslyn-language-server")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("roslyn_ls", {
        root_markers = { "*.sln", "*.csproj", ".git" },

        settings = {
            csharp = {
                inlayHints = {
                    csharpEnableInlayHintsForLiteralParameters = true,
                    csharpEnableInlayHintsForObjectCreationParameters = true,
                    csharpEnableInlayHintsForIndexerParameters = true,
                    csharpEnableInlayHintsForTypes = true,
                },
                format = {
                    enable = true,
                    organizeImports = true,
                },
            },
        },
    })

    vim.lsp.enable("roslyn_ls")
end

function M.setup_lang()
    vim.keymap.set({ "o", "x" }, "ip", textobjects.select_inside_brackets, {
        buffer = true,
        silent = true,
        desc = "Inner paragraph (nested-safe curly brackets)"
    })
end

return M
