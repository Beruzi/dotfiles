-----------------------------
-- Better Markdown Renderer
-----------------------------
vim.pack.add({
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})

-- Unfortunately the way the code block border works is is simply fills in the above and below lines
-- with solid characters... thus to have both border and backticks is not possible... enabling border will
-- litterally cover the backticks...

require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
    enabled = true,
    render_modes = {'n', 'i',},

    -- current line reveals raw markdown
    anti_conceal = {
        enabled = true,
        ignore = {
            code_background = true,
            code_border = false,
            code_language = false,
        },
    },

    -- header settings
    heading = {
        enabled = true,
        sign = false,
        position = 'inline',
        icons = {''},
    },

    -- code block settings
    code = {
        sign = false,       -- removes the language symbol in gutter
        language = false,
        style = 'normal',   -- remvoes the language name in preview
        border = 'thick',   -- pads the code block; ``` lines have background
        -- conceal_delimiters = false,
    },
    
    -- list setting (disabled b/c raw markdown is nice
    bullet = { enabled = false },

    -- disable checkbox rendering (disabled b/c raw checkbox is nice
    checkbox = { enabled = false }, 

    latex = { enabled = false }, 
}) 
