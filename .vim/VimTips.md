# My Vim Tips

## Using Vim from the Command Line
* `-c` or `+`  for executing :commands with | inbetween commands
* `-s`     for executing normal-mode commands

* Delete all lines with foo in them from command line
    * vi -u NONE -N -c "v/foo/d|wq" fooAndBar.txt
    * vi -u NONE -N +"v/foo/d|wq" fooAndBar.txt
    * vi -u NONE -N -s normalCmdsScript.vim fooAndBar.txt
* In normalCmdsScript.vim

    :v/foo/d<CR>:wq<CR>

* In fooAndBar.txt before modification

    This line has a bar and a foo
    This line only has a bar
    This line only has a foo

* In fooAndBar.txt after modification

    This line only has a bar

## In-File Tips

* Custom highlighting:

    :set hl
    :match <hlname> /<regex>/

* Substitution:
    * Use :cfdo %s/SEARCH/REPLACE/ge to modify all files in the quickfix list
    *  See also :bufdo, :argdo, and :windo
    * Use :args ## % to append current file to arglist
    * Use & in normal model to repeat substitution
    * Use \=str2float(submatch(1)) instead of \1 when using :s with math
* Scripting with Python within Vim:
    * Remove comment tag on the Python command and type :.!python3
    * Or highlight line(s) then !python3

    for i, x in enumerate("ABC"): print("Person %i is %s"%(i,x))

* Source Vimscript code without sourcing entire file: yank code and :@0

* View current [Vim environement](https://vim.fandom.com/wiki/Displaying_the_current_Vim_environment)
* View message outputs in separate buffer:

    :redir @r | let g:
    :new | put r | redir END
