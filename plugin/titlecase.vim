" This command calls titlecase#TitleCase() for each line in the range
" The command works in:
" - Normal mode: Convert current line
" - Visual mode: Convert lines in visual selection
" - :global    : Convert all matching lines
" - :vglobal   : Convert all non-matching lines
command! -range TitleCase <line1>,<line2>call titlecase#TitleCase()
