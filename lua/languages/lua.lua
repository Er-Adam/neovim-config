local M = {}

M.parser = "lua"

function M.setup_lsp()
    local mr = require("mason-registry")
    if mr.has_package("lua-language-server") then
        local p = mr.get_package("lua-language-server")
        if not p:is_installed() then
            p:install()
        end
    end

    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    })

    vim.lsp.enable("lua_ls")
end

return M
