local M = {}

M.parser = "sql"

function M.setup_lsp()
    local mr = require("mason-registry")

    if mr.has_package("sqls") then
        local p = mr.get_package("sqls")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("sqls", {
        settings = {
            sqls = {
                connections = {},
            },
        },
    })

    vim.lsp.enable("sqls")
end

return M
