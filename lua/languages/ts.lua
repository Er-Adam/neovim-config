local M = {}

M.parser = { "typescript", "tsx" }

function M.setup_lsp()
    local mr = require("mason-registry")

    if mr.has_package("typescript-language-server") then
        local p = mr.get_package("typescript-language-server")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("ts_ls", {
        filetypes = {
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
        },
    })

    vim.lsp.enable("ts_ls")
end

return M
