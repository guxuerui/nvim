map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map tt :NERDTreeToggle<CR>
"Improved keyboard shortcut
map <LEADER>sl :set splitright<CR>:vsplit<CR>
map <LEADER>sh :set nosplitright<CR>:vsplit<CR>
map <LEADER>sk :set splitbelow<CR>:split<CR>
map <LEADER>sj :set splitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER><LEADER> <C-f>
map <LEADER>bb <C-b>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K
map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
map tt :NERDTreeToggle<CR>
map s <Plug>(easymotion-bd-f)

noremap S :w<CR> 
noremap cd :chdir
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

noremap <LEADER><CR> :nohlsearch<CR>
noremap ; :

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>so :<C-u>SessionLoad<CR>
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nmap ;fs :lua require('session-lens').search_session()<CR>

"COC key mapping
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" resize current buffer by +/- 5 
nnoremap <M-left> :vertical resize -5<cr>
nnoremap <M-down> :resize +5<cr>
nnoremap <M-up> :resize -5<cr>
nnoremap <M-right> :vertical resize +5<cr>
" Find files using Telescope command-line sugar.
nnoremap ;ff <cmd>Telescope find_files<cr>
nnoremap ;fg <cmd>Telescope live_grep<cr>
nnoremap ;fb <cmd>Telescope buffers<cr>
nnoremap ;fh <cmd>Telescope help_tags<cr>
nnoremap ;pp :lua require'telescope.builtin'.planets{}<CR>
nnoremap <LEADER>r :SearchBoxReplace confirm=menu<CR>
nnoremap <LEADER>s :SearchBoxIncSearch<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>m :call mkdir(expand("%:p:h"), "p")<CR>

xmap ga <Plug>(EasyAlign)
