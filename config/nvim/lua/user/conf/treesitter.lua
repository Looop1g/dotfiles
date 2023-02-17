local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("treesitter not found!")
  return
end


function vim_hi(hls)
    for group,color in pairs(hls) do
        local fg = color.fg and ' ctermfg=' .. color.fg or ' ctermfg=NONE'
        local bg = color.bg and ' ctermbg=' .. color.bg or ' ctermbg=NONE'
        local sp = color.sp and ' cterm=' .. color.sp or ''
        vim.api.nvim_command('highlight ' .. group .. fg .. bg .. sp)
    end
end


function vim_map(maps)
    for _,map in pairs(maps) do
        vim.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
    end
end


vim_hi({
    ["@variable"] = {fg="NONE"};
    ["@function"] = {fg=190};
    ["@function.call"] = {fg=32};
    ["@operator"] = {fg=166};
    ["@keyword.operator"] = {fg=166};
    ["@constant"] = {fg=12};

    ["@property"] = {fg=172};
    ["@field"]= {fg=150};
    ["@method"] = {fg=166};
    ["@method.call"] = {fg=9};
    ["@parameter"] = {fg=9};

    ["@keyword"] = {fg=1};
    ["@keyword.function"] = {fg=32};
    ["@exception"] = {fg=32};

    ["@statement"] = {fg=166};
    ["@special"] = {fg=172};
    ["@comment"]= {fg=71,sp='italic'};
    ["@include"] = {fg=1};
    ["@type"] = {fg=179};
    ["@type.builtin"] = {fg=150};
    ["@punctuation.bracket"] = {fg=151};

    ["@constructor"] = {fg=172};
    ["@namespace"] = {fg=172};

    ["@string"] = {fg=37};
    ["@number"] = {fg=37};
    ["@boolean"] = {fg=37};

    ["@tag"] = {fg=172};

    ["@text.literal"] = {fg=7};
})
vim_map({ { 'n', 'H', ':TSHighlightCapturesUnderCursor<CR>', {silent = true, noremap = true}} })

configs.setup ({
    ensure_installed = { "c", "python", "cpp", "lua" },
    ignore_install = { "swift", "phpdoc" },
    highlight = {
        enable = true
    },
    rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
})
