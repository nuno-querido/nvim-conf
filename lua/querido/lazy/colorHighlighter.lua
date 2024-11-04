return {
    "brenoprata10/nvim-highlight-colors",
    config = function()
        require('nvim-highlight-colors').setup({
            ---@usage 'background'|'foreground'|'virtual'
            render = 'virtual',

            ---Set virtual symbol (requires render to be set to 'virtual')
            virtual_symbol = '■',

            ---Highlight hex colors, e.g. '#FFFFFF'
            enable_hex = true,

            ---Highlight short hex colors e.g. '#fff'
            enable_short_hex = true,

            ---Highlight CSS variables, e.g. 'var(--testing-color)'
            enable_var_usage = true,
        })
    end
}
