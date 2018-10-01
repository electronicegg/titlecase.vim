let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Note - The python implementation is defined in the autoload/ directory to
"        avoid loading the python part during VIM start-up.
"        This avoids slowing down VIM's start-up

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
from titlecase import titlecase

def call_titlecase():
    vim.current.line = titlecase(vim.current.line)

EOF

" Wrapper function to python call
function! titlecase#TitleCase()
    python3 call_titlecase()
endfunction

