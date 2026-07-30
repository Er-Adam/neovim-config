local M = {}

M.parser = "css"

function M.setup_lsp()
    local mr = require("mason-registry")
    if mr.has_package("css-lsp") then
        local p = mr.get_package("css-lsp")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("cssls", {
        settings = {
            css = {
                validate = true,
            },
            scss = {
                validate = true,
            },
            less = {
                validate = true,
            },
        },
    })

    vim.lsp.enable("cssls")
end

return M
