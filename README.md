Put thic config in `/Users/user/.config/nvim`


# Useful commands
Leader is `<space>`

Type `nvim` to open nvim in current directory

## Telecope
Telescope is a fuzzy finder that can fuzzy find files, buffers, LSP symbols, etc. See  `lua/plugins/telescope.lua` for all Telecope related keybindings.

`<leader>sf`
Find files

`<leader><leader>`
Find existing buffers

`<leader>sf`
Live grep

`<leader>s.`
Find recent files


## Oil
Oil is a file explorer that can be used to navigate files and directories. See `lua/plugins/oil.lua` for all Oil related keybindings. Neat thing about it is that you can edit the files as any buffer

`-`
Open parent directory in current window. If Oil is already open any you press `-` again it will navigate you to the parent directory of the current directory.

`q`
Close Oil

`Y`
Copy relative path of the file


## LSP
Lsp is a language server protocol that allows you to integrate language tools into your editor or something like that. See `plua/plugins/lsp.lua` for more.

`gd`
Go to definition

`gD`
Go to declaration

`gI`
Go to implementation

`gr`
Find references under cursor

## Spectre
Search & Replace

`<leader>S`
Toggle Spectre

`<leader>sw`
Search current word

`<leader>sp`
Search on current file

`Shift+R`
Replace the matching words

## Navigation & vim stuff
`gg`
Jump to top of file

`G`
Jump to bottom of file

`Ctrl+d`
Scroll down

`Ctrl+u`
Scroll up

`/ + search term`
Search for a term

`:&s/oldword/newword/g`
Replace all occurences of oldword with newword. Not case sensitive

`ZZ`
Save and quit


## Misc 
`<leader>tv`
Open a terminal in the current directory

`<leader>mt`
Toggle markdown preview

`<leader>fml`
Just try it out in any buffer

`<leader>ef`
Eslint fix all. This is manual because it's annoying that unused imports etc are removed automatically on save.

There's a plugin called mini.surround that can be used to add/delete/replace surroundings (brackets, quotes, etc.). Super useful haven't learned it.


Tip: start using Lazygit, it's awesome https://github.com/jesseduffield/lazygit







