let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

pythonx << EOF

import sys
sys.dont_write_bytecode = True

from os.path import normpath, join

import vim

plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)

# Import this plugin's python implementation
import titlecase

def eval_titlecase():
    vim.current.line = titlecase.titlecase(vim.current.line)

    # TODO - Consider using registers to process visually selected text
    #        save the current register value to a python variable then restore
    #        after executing the command

EOF

function! TitleCase()
    pythonx eval_titlecase()
endfunction

command! TitleCase call TitleCase()
