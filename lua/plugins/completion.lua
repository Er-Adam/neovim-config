return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    opts = {
        keymap = {
            preset = "none",

            ["<C-Space>"] = { "show", "hide" },

            ["<C-y>"] = { "select_and_accept" },
            ["<Tab>"] = { "select_and_accept", "fallback" },

            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
        },
    },
}
