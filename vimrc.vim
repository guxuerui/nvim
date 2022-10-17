"----vim 个人使用习惯配置start------
set encoding=UTF-8
" leader设置成空格
let mapleader=" "
" 使用鼠标
set mouse=c
" 显示行号
set number
" 相对行号
set relativenumber
" tab=4个空格
set tabstop=4
set shiftwidth=4
" 按tab显示菜单
set wildmenu
" 显示按下的按键
set showcmd
" 设置搜索字符高亮
set hlsearch
exec "nohlsearch" 
set incsearch
set ignorecase
set smartcase
" set indent
set expandtab
set autoindent
set smartindent
"  enable line and column display 底部的行号等显示
set ruler

set nocompatible
syntax on
filetype on
set foldmethod=indent
set nofoldenable

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"  

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")
let g:startify_bookmarks = [
      \ {'c': '~/.zshrc'},
      \ {'i': '~/.config/nvim/init.vim'},
      \ '~/ailink/vuetify-vue3-ts-starter',
      \ ]

" set autochdir
" in case the prior line isn't working
autocmd BufEnter * silent! lcd %:p:h
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"autocmd BufWinEnter * NERDTreeMirror
" aslo print out current working folder path

" 改变 vim中光标的形状
let g:db_ui_use_nerd_fonts=1
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" 高度光标所在行
"set cursorline
" 设置不换行
"set nowrap
set wrap
" 不需要备份文件
set nobackup
"----vim 个人使用习惯配置end------
"ssh 远程粘贴板
if executable('clipboard-provider')
    let g:clipboard = {
          \ 'name': 'myClipboard',
          \     'copy': {
          \         '+': 'clipboard-provider copy',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
          \     },
          \     'paste': {
          \         '+': 'clipboard-provider paste',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider paste',
          \     },
          \ }
endif
" use Tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"随机选一个颜色风格
function RandomColorScheme()
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n") 
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

"call RandomColorScheme()

:command NewColor call RandomColorScheme()


" 文件类型设置 "{{{
" ---------------------------------------------------------------------
" JSX 语法高亮
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx,*.js set filetype=typescriptreact

" auto-session
let g:auto_session_enabled = v:false

" CtrlP mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:neovide_cursor_vfx_mode = "railgun"

"Rooter config
let g:rooter_patterns = ['.git', 'package.json', 'yarn.lock']
lua <<EOF
require('core._init')
EOF
