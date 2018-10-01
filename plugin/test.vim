let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim

# Disable creation of pyc files
sys.dont_write_bytecode = True

# Add python-titlecase directory to python path
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python/python-titlecase'))
sys.path.insert(0, python_root_dir)

# Import python-titlecase
import titlecase

def call_titlecase():

    start_row, start_col = vim.current.buffer.mark('<')
    end_row,   end_col   = vim.current.buffer.mark('>')

    for line_num in range(start_row, end_row+1):
        vim.current.buffer[line_num-1] = titlecase.titlecase(vim.current.buffer[line_num-1])

EOF

function! TitleCase()
    pythonx call_titlecase()
endfunction

command! -range TitleCase <line1>,<line2>call TitleCase()
