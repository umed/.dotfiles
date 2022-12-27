require("nvim-tree").setup({
    view = {
        adaptive_size = true,
        side = "right",
    },
    filters = {
        custom = {
            '^.git$',
            '^.cache$',
            'compile_commands.json',
        }
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },
})
