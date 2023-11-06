# KeyMapping

## lsp

<M-s> Symbols Outline -> aerial.nvim
<M-f> Search Symbols

<M-d> Goto Definition
<M-r> Goto References
<M-y> Goto Type Definition
<M-i> Goto Implementation
<M-c> Incoming Calls

## tree-sitter

<M-j> Next Function Start
<M-k> Previous Function Start
<M-g> Next Function End

<M-.> Next Argument End
<M-,> Previous Argument End
<M-b> Previous Argument Start

<M-;> Next Block Start
<M-a> Previous Block Start

<leader>j splitting/joining blocks of code
<leader>,a Show AST

## Buffer & Tab & Window

<M-w> Find Buffer
<M-n> Next Buffer
<M-p> Previous Buffer
<M-q> Close Buffer
<leader>br Revert Buffer

<M-h> Previous Tab
<M-l> Next Tab

## Find
<leader>fl Find Language
<leader>fj Find Jumplist
<leader>fs Browse Sessions
<leader>fg AST Grep

## UI

<leader>uw Toggle wrap
<leader>un Change line numbering
<leader>ui Change indent settings (set indent value)
<leader>uT Toggle transparency
<leader>uq Dismiss notify message
<leader>uN Toggle Notifications
<leader>uH Toggle LSP inlay hints (buffer)

## Local

<leader>,1 Yank directory path
<leader>,2 Yank filename
<leader>,3 Yank full path
<leader>,e Sync Neotree With Current Buffer

<leader>,d Toggle Debug UI

<leader>,s Toggle Overseer
<leader>,r Overseer Run Task
<leader>,oi Overseer Info
<leader>,od Overseer Parser Debug

# Plugin

## project.nvim 项目管理

https://github.com/ahmedkhalf/project.nvim

normal:
<leader>fs -> Browse sessions

Telescope:

| Normal mode | Insert mode | Action                   |
| ----------- | ----------- | ------------------------ |
| f           | <c-f>       | find_project_files       |
| b           | <c-b>       | browse_project_files     |
| d           | <c-d>       | delete_project           |
| s           | <c-s>       | search_in_project_files  |
| r           | <c-r>       | recent_project_files     |
| w           | <c-w>       | change_working_directory |

## flash.nvim 光标导航

https://github.com/folke/flash.nvim

Telescope: M-s
