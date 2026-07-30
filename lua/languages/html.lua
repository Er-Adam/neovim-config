local M = {}

M.parser = "html"

function M.setup_lsp()
    local mr = require("mason-registry")
    if mr.has_package("html-lsp") then
        local p = mr.get_package("html-lsp")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("html", {
        filetypes = { "html", "templ" },
    })

    vim.lsp.enable("html")
end

return M
