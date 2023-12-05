# TextObject

## general

w/W word
p paragraph
s sentence
t tag
i indent
' " ` [] () {} delimiter
% vim-matchup

## tree-sitter

a parameter
f function
k block
c class
? conditional
l loop

# KeyMapping

## Motion

- normal mode
  `<S-M-u> Previous Function Start`
  `<S-M-i> Next Function Start`
  `<M-g> Next Function End`

  `<M-,> Previous Argument End`
  `<M-.> Next Argument End`
  `<M-b> Previous Argument Start`

  `<S-M-b> Previous Block End`
  `<S-M-e> Next Block Start`

  `<M-e> Next Matchup Inside`
  `<M-u> Matchup Outside`
  `<M-a> Matchup`

  `<M-k> Previous Indent`
  `<M-j> Next Indent`

  `<M-[> Previous Mark`
  `<M-]> Next Mark`

  `<S-M-j> Next Recently Set Highlight`
  `<S-M-k> Previous Recently Set Highlight`
  `<S-M-h> Next Nearest Highlight`
  `<S-M-l> Previous Nearest Highlight`

## lsp

`<M-s> Symbols Outline -> aerial.nvim`
`<M-f> Search Symbols`

`<M-d> Goto Definition`
`<M-r> Goto References`
`<M-y> Goto Type Definition`
`<M-i> Goto Implementation`
`<M-c> Incoming Calls`

`<leader>lf Format Buffer`
`<leader>lr Rename current symbol`
`<leader>lg Search workspace symbols`
`<leader>lx Search diagnostics`
`<leader>li LSP information`

`<leader>xX Workspace Diagnostics (Trouble)`
`<leader>xx Document Diagnostics (Trouble)`
`<leader>xl Location List (Trouble)`
`<leader>xq Quickfix List (Trouble)`
`<leader>xr LSP References (Trouble)`
`<leader>xi LSP Implementations (Trouble)`
`<leader>xd LSP Definitions (Trouble)`
`<leader>xt LSP Type Definitions (Trouble)`

## dap

`<leader>db Toggle Breakpoint (F9)`
`<leader>dB clear Breakpoints`
`<leader>dC Conditional Breakpoint (S-F9)`

`<leader>dc Start/Continue (F5)`
`<leader>ds Run To Cursor`
`<leader>di Step Into (F11)`
`<leader>do Step Over (F10)`
`<leader>dO Step Out (S-F11)`
`<leader>dp Pause (F6)`

`<leader>dh Debug Hover`
`<leader>dE Evaluate Input`
`<leader>dR Toggle REPL`

`<leader>dq Close Session`
`<leader>du Toggle Debugger UI`

`<leader>df Telescope DAP frames`
`<leader>dv Telescope DAP variables`
`<leader>dl Telescope DAP list breakpoints`

## Git

`<leader>gg Open Neogit Tab Page`
`<leader>go Open Neogit Override CWD`
`<leader>gx Open Neogit In xtools (only win64)`
`<leader>gf Open Neogit In astro_config`

## Annotation

- normal mode
  `<leader>aa Annotation Auto`
  `<leader>ac Annotation Class`
  `<leader>af Annotation Function`
  `<leader>at Annotation Type`
  `<leader>aF Annotation File`

## Action

- normal mode
  `<leader>ah Move line left`
  `<leader>aj Move line down`
  `<leader>ak Move line up`
  `<leader>al Move line right`
- visual mode
  `<leader>ah Move selection left`
  `<leader>aj Move selection down`
  `<leader>ak Move selection up`
  `<leader>al Move selection right`

## Buffer & Tab & Window

`<M-w> Find Buffer`
`<M-n> Next Buffer`
`<M-p> Previous Buffer`
`<M-q> Close Buffer`
`<leader>br Revert Buffer`

`<M-h> Previous Tab`
`<M-l> Next Tab`

## Find

`<M-o> Telescope luasnip`

`<leader>ss Find words in current buffer`

`<leader>fw live_grep`
`<leader>fW live_grep (include hidden files)`
`<leader>fe live_grep_args`
`<leader>fc live_grep word at cursor`

`<leader>fg AST Grep`

`<leader>fq Find Macros (neoclip)`
`<M-;> Find Yanks (neoclip)`

`<leader>fu Find undos`

`<leader>ff Find files`
`<leader>fF Find files (include hidden files)`
`<leader>fo Find history files`
`<leader>fb Telescope file_browser`
`<leader>fz Telescope zoxide`

`<leader>fl Find Language`
`<leader>ft Find Colorschemes`

`<leader>f' Find Marks`
`<leader>fr Find Registers`
`<leader>fj Find Jumplist`
`<leader>fn Find notifications`
`<leader>fs Browse Sessions`

`<leader>fC Find Commands`
`<leader>fk Find Keymap`
`<leader>fh Find Help Tags`
`<leader>fm Find Man Pages`

`<leader>gt Git Status`
`<leader>gb Git Branches`
`<leader>gc Git Commits (repository)`
`<leader>gC Git Commits (current file)`

## UI

`<leader>uw Toggle wrap`
`<leader>uW Toggle wrapscan`
`<leader>un Change line numbering`
`<leader>ui Change indent settings (set indent value)`
`<leader>uT Toggle transparency`
`<leader>uq Dismiss notify message`
`<leader>uN Toggle Notifications`
`<leader>uH Toggle LSP inlay hints (buffer)`
`<leader>ux Toggle Twilight (focus on AST)`
`<leader>uD Toggle virtual diagnostics lines (lsp_lines.nvim)`

## Local

`<leader>,, Set cwd or Open file with clipboard path`
`<leader>,1 Yank directory path`
`<leader>,2 Yank filename`
`<leader>,3 Yank full path`
`<leader>,e Sync Neotree With Current Buffer`

`<leader>,a Show AST`
`<leader>,q Open QuickFix`
`<leader>,d Toggle Debug UI`

`<leader>,s ToggleTerm shell`
`<leader>,. ToggleTerm xtools (python)`
`<leader>,x xtools exec (python)`

`<leader>,p Set Project Root (project.nvim)`

`<leader>kc Set CMake Root`
`<leader>kx Set xmake Root`
`<leader>ka CMakeLaunchArgs`
`<leader>kb CMakeBuild`
`<leader>kB CMakeQuickBuild`
`<leader>kd CMakeDebug`
`<leader>ke CMakeSelectLaunchTarget`
`<leader>kf CMakeShowTargetFiles`
`<leader>kg CMakeGenerate`
`<leader>kt CMakeSelectBuildType`
`<leader>kl CMakeClean`

`<leader>,r  Overseer Run Task`
`<leader>,oo Toggle Overseer`
`<leader>,oi Overseer Info`
`<leader>,od Overseer Parser Debug`

`<leader>,hh Switch to hex view`
`<leader>,hr Switch to binary view`
`<leader>,ho Open binary file`

# Plugin

## vim-highlighter

https://github.com/azabiong/vim-highlighter

- normal mode
  `f<Enter> Highlight`
  `f<BS> Remove Highlight`
  `f<C-l> Clear Highlight`
  `f<C-s> Save Highlight`
  `f<C-h> Load Highlight`
  `f<Tab> Find Highlight (similar to Telescope grep)`

  `<S-M-j> Next Recently Set Highlight`
  `<S-M-k> Previous Recently Set Highlight`
  `<S-M-h> Next Nearest Highlight`
  `<S-M-l> Previous Nearest Highlight`

## telescope-undo.nvim

https://github.com/debugloop/telescope-undo.nvim

`<leader>fu Find undos`

**Telescope**

- insert mode
  `<cr> yank additions`
  `<C-y> yank deletions`
  `<C-r> yank restore`

- normal mode
  `"y" yank additions`
  `"Y" yank deletions`
  `"u" yank restore`

## neoclip

https://github.com/AckslD/nvim-neoclip.lua

`<M-;> Find Yanks (neoclip)`
`<leader>fq Find Macros (neoclip)`

**Telescope**:

- insert mode
  `<cr> paste`
  `{<C-p>, <M-p>} paste_behind`
  `<C-q> replay`
  `<C-d> delete`
  `<C-e> edit`
  `<C-a> select`
- normal mode
  `{"p", <cr>} paste`
  `"P" paste_behind`
  `"q" replay`
  `"d" delete`
  `"e" edit`
  `<C-a> select`

## marks.nvim

https://github.com/chentoast/marks.nvim

| Normal mode | Action                                                                                                     |
| ----------- | ---------------------------------------------------------------------------------------------------------- |
| mx          | Set mark x                                                                                                 |
| m,          | Set the next available alphabetical (lowercase) mark                                                       |
| m;          | Toggle the next available mark at the current line                                                         |
| dmx         | Delete mark x                                                                                              |
| dm-         | Delete all marks on the current line                                                                       |
| dm<space>   | Delete all marks in the current buffer                                                                     |
| m]          | Move to next mark                                                                                          |
| m[          | Move to previous mark                                                                                      |
| m:          | Preview mark. This will prompt you for a specific mark to preview; press <cr> to preview the next mark.    |
| m[0-9]      | Add a bookmark from bookmark group[0-9].                                                                   |
| dm[0-9]     | Delete all bookmarks from bookmark group[0-9].                                                             |
| m}          | Move to the next bookmark having the same type as the bookmark under the cursor. Works across buffers.     |
| m{          | Move to the previous bookmark having the same type as the bookmark under the cursor. Works across buffers. |
| dm=         | Delete the bookmark under the cursor.                                                                      |

## telescope-zoxide

https://github.com/jvgrootveld/telescope-zoxide

normal:
`<leader>fz -> Telescope zoxide`

Telescope:
`<C-f> find_file`
`<C-b> find_file (all file)`
`{<cr>, <C-t>} Change cwd to selection / Open file to selection`

## trouble.nvim

https://github.com/folke/trouble.nvim

normal:
`<leader>xx Document Diagnostics (Trouble)`
`<leader>xX Workspace Diagnostics (Trouble)`
`<leader>xl Location List (Trouble)`
`<leader>xq Quickfix List (Trouble)`

## project.nvim 项目管理

https://github.com/ahmedkhalf/project.nvim

normal:
`<leader>fs -> Browse sessions`
`<leader>,p -> Set Project Root`

Telescope:

| Normal mode | Insert mode | Action                   |
| ----------- | ----------- | ------------------------ |
| f           | <c-f>       | find_project_files       |
| b           | <c-b>       | browse_project_files     |
| d           | <c-d>       | delete_project           |
| s           | <c-s>       | search_in_project_files  |
| r           | <c-r>       | recent_project_files     |
| w           | <c-w>       | change_working_directory |

## telescope-live-grep-args.nvim 带参数的 live_grep

https://github.com/nvim-telescope/telescope-live-grep-args.nvim

normal:
`<leader>fe live_grep_args`

Telescope:
`<C-a> add ""`
`<C-f> add -t`
`<C-i> add --iglob`

## nvim-surround 轻松添加/更改/删除周围的分隔符对

https://github.com/kylechui/nvim-surround

`ys{motion}{char} add surround`
`ds{motion}{char} delete surround`
`cs{motion}{char} change surround`

## telescope-file-browser.nvim 文件浏览器

https://github.com/nvim-telescope/telescope-file-browser.nvim

| Insert / Normal | fb_actions           | Description                                                                      |
| --------------- | -------------------- | -------------------------------------------------------------------------------- |
| `<A-c>/c`       | create               | Create file/folder at current `path` (trailing path separator creates folder)    |
| `<S-CR>`        | create_from_prompt   | Create and open file/folder from prompt (trailing path separator creates folder) |
| `<A-r>/r`       | rename               | Rename multi-selected files/folders                                              |
| `<A-m>/m`       | move                 | Move multi-selected files/folders to current `path`                              |
| `<A-y>/y`       | copy                 | Copy (multi-)selected files/folders to current `path`                            |
| `<A-d>/d`       | remove               | Delete (multi-)selected files/folders                                            |
| `<C-o>/o`       | open                 | Open file/folder with default system application                                 |
| `<C-g>/g`       | goto_parent_dir      | Go to parent directory                                                           |
| `<C-e>/e`       | goto_home_dir        | Go to home directory                                                             |
| `<C-w>/w`       | goto_cwd             | Go to current working directory (cwd)                                            |
| `<C-t>/t`       | change_cwd           | Change nvim's cwd to selected folder/file(parent)                                |
| `<C-f>/f`       | toggle_browser       | Toggle between file and folder browser                                           |
| `<C-h>/h`       | toggle_hidden        | Toggle hidden files/folders                                                      |
| `<C-s>/s`       | toggle_all           | Toggle all entries ignoring `./` and `../`                                       |
| `<Tab>`         | see `telescope.nvim` | Toggle selection and move to next selection                                      |
| `<S-Tab>`       | see `telescope.nvim` | Toggle selection and move to prev selection                                      |
| `<bs>/`         | backspace            | With an empty prompt, goes to parent dir. Otherwise acts normally                |

## flash.nvim 光标导航

https://github.com/folke/flash.nvim

**Telescope**: M-s
