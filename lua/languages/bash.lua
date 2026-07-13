local M = {}

M.parser = "bash"

function M.setup_lsp()
    local mr = require("mason-registry")

    if mr.has_package("bash-language-server") then
        local p = mr.get_package("bash-language-server")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("bashls", {
        settings = {
            bashIde = {
                globPattern = "*@(.sh|.inc|.bash|.command)",
            },
        },
    })

    vim.lsp.enable("bashls")
end

return M
