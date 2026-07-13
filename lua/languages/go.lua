local M = {}

M.parser = "go"

function M.setup_lsp()
    local mr = require("mason-registry")
    if mr.has_package("gopls") then
        local p = mr.get_package("gopls")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("gopls", {
        settings = {
            gopls = {
                gofumpt = true,
                staticcheck = true,

                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
            },
        },
    })

    vim.lsp.enable("gopls")
end

return M
