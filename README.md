# Title Case Plugin for VIM

`titlecase.vim` is a plugin for vim built using Python.

This plugin uses the following Python module for the title case conversion:
- https://github.com/ppannuto/python-titlecase


## Installation

### Using [vim-pathogen](https://github.com/tpope/vim-pathogen)

```
cd ~/.vim/bundle
git clone https://github.com/mikko3024/titlecase.vim.git
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```
Plug 'mikko3024/titlecase.vim'
```


## Usage

The `:TitleCase` command supports the following modes:
  - Normal mode
    > Converts the current line to title case

  - Visual mode
    > Converts all lines in the visual selection

  - `:global/PATTERN/` or `:g/PATTERN/` command
    > Converts all lines matching the `PATTERN`

  - `:vglobal/PATTERN/` or `:v/PATTERN/`
    > Converts all the lines that does not match the `PATTERN`


![Demo](demo.gif)


## Limitations

The `:TitleCase` command only works on the entire line.
