return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()


        local capabilities = require("blink.cmp").get_lsp_capabilities()
        vim.lsp.config("*", {
            capabilities = capabilities,
        })


        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

                vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float)

                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, opts)
                vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, opts)

                vim.keymap.set("n", "Ő", function()
                    vim.diagnostic.jump({ count = -1 })
                end, opts)
                vim.keymap.set("n", "ő", function()
                    vim.diagnostic.jump({ count = 1 })
                end, opts)

                vim.keymap.set("n", "<leader>F", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)

                local client = vim.lsp.get_client_by_id(ev.data.client_id)

                if client and client:supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup(
                            "LspFormat" .. ev.buf,
                            {}
                        ),
                        buffer = ev.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                async = false,
                                bufnr = ev.buf,
                            })
                        end,
                    })
                end
            end,
        })


        local lang_dir = vim.fn.stdpath("config") .. "/lua/languages"

        for name, type in vim.fs.dir(lang_dir) do
            if type == "file" and name:sub(-4) == ".lua" then
                local module = "languages." .. name:sub(1, -5)

                local ok, lang = pcall(require, module)
                if ok and lang.setup_lsp then
                    lang.setup_lsp()
                end
            end
        end
    end,
}
