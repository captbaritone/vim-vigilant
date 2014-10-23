# Vigilant

A Vim plugin to quickly spin off asynchronous Python tests in a Tmux split.

## Installation

We depend upon [Vimux](https://github.com/benmills/vimux), so you will need to
install it as well. Use your plugin manager
([Vundle](https://github.com/gmarik/Vundle.vim),
[Plug](https://github.com/junegunn/vim-plug),
[Pathogen](https://github.com/tpope/vim-pathogen)) to install these two GitHub
repositories:

    benmills/vimux
    captbaritone/vim-vigilant

In your `.vimrc` set the script you use to run your tests:

    " Default
    let g:vigilant_cmd = 'nosetests'


## Mappings

Vigilant simply exposes commands, but to use them you probably want to create
some mappings in your `.vimrc`:

    " Run all your tests
    " e.g.  nosetests
    nnoremap <leader>va :VigilantRunTests<cr>

    " Run the currently open test file
    " e.g.  nosetests /path/to/my/file.py
    nnoremap <leader>vf :VigilantRunCurrentTests<cr>

    " Run a single test class based on cursor postion
    " e.g.  nosetests /path/to/my/file.py:MySuite
    nnoremap <leader>vc :VigilantRunTestClass<cr>

    " Run a single test method based on cursor postion
    " e.g.  nosetests /path/to/my/file.py:MySuite.my_test_method
    nnoremap <leader>vm :VigilantRunSingleTest<cr>

    " Rerun your last Vigilant test command
    nnoremap <leader>vv :VigilantRerun<cr>
