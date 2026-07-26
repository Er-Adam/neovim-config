local M = {}

M.parser = "c"

function M.setup_lsp()
    local mr = require("mason-registry")

    if mr.has_package("clangd") then
        local p = mr.get_package("clangd")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("clangd", {
        cmd = { "clangd" },
        filetypes = { "c", "h" },
    })

    vim.lsp.enable("clangd")
end

return M
