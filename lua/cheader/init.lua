local PLUGIN_NAME = "cheader"

local function insert(text)
  local buf = 0
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  col = col + 1
  vim.api.nvim_buf_set_text(buf, row - 1, col - 1, row - 1, col - 1, vim.split(text, "\n"))
end

vim.api.nvim_create_user_command("Cheader", function(opts)
  local the_file = (opts.fargs[1] or vim.fn.expand("%:t:r")):upper():gsub('-','_'):gsub('.', '_')
  insert( 
    '// #define '..the_file..'_IMPLEMENTATION\n'..
    '#ifndef    _'..the_file..'_H_\n'..
    '#define    _'..the_file..'_H_\n'..
    '// '..the_file:lower()..' interface\n'..
    '\n'..
    '\n'..
    '\n'..

    '#ifdef      '..the_file..'_IMPLEMENTATION\n'..

    '// '..the_file:lower()..' implementation\n'..
    '\n'..
    '\n'..
    '\n'..

    '#endif   // '..the_file..'_IMPLEMENTATION\n'..

    '#endif   //_'..the_file..'_H_\n'..
    ''

)
end, { nargs='?', desc = 'Generate generic C header into current buffer' })
