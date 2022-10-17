filetype plugin indent off  
" manual 手动定义折叠 
" indent 更多的缩进表示更高级别的折叠 
" expr   用表达式来定义折叠 
" syntax 用语法高亮来定义折叠 
" diff   对没有更改的文本进行折叠 
" marker 对文中的标志折叠 
set foldmethod=indent

" use Tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" COC key mapping inoremap <silent><expr> <TAB>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <Leader>m :call mkdir(expand("%:p:h"), "p")<CR>

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

" let g:startify_lists = [
"         \ { 'type': 'files',     'header': ['   MRU']            },
"         \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
"         \ { 'type': 'sessions',  'header': ['   Sessions']       },
"         \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
"         \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
"         \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
"         \ { 'type': 'commands',  'header': ['   Commands']       },
"         \ ]
"
" let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")
" let g:startify_bookmarks = [
"       \ {'c': '~/.zshrc'},
"       \ {'i': '~/.config/nvim/init.vim'},
"       \ '~/ailink/vuetify-vue3-ts-starter',
"       \ ]
"
" let g:startify_custom_header =
"       \ startify#pad(split(system('figlet -f ~/.config/fonts/3D-ASCII.flf -w 85 NeoVIM '), '\n'))

" for mirage version of theme
let ayucolor="mirage"
colorscheme ayu
" in case the prior line isn't working
autocmd BufEnter * silent! lcd %:p:h
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"autocmd BufWinEnter * NERDTreeMirror
" aslo print out current working folder path
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" auto-session
let g:auto_session_enabled = v:false

" CtrlP mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline_theme='syntastic'
let g:neovide_cursor_vfx_mode = "railgun"

" 代码片段
let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\        ."<html lang=\"${lang}\">\n"
\        ."<head>\n"
\        ."\t<meta charset=\"${charset}\">\n"
\        ."\t<title></title>\n"
\        ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\        ."</head>\n"
\        ."<body>\n\t${child}|\n</body>\n"
\        ."</html>",
\      'vue:3': "<script setup lang=\"ts\">\n"
\        ."</script>\n\n"
\        ."<template>\n\n"
\        ."</template\>\n\n"
\        ."<style scoped>\n\t${child}|\n</style\>\n",
\    },
\  },
\}

"Rooter config
let g:rooter_patterns = ['.git', 'package.json', 'yarn.lock']
lua <<EOF
require('core._init')
EOF
