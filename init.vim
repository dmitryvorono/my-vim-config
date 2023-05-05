call plug#begin()
Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" For coc
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" better statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git management plugin
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
" for close brackets
"Plug 'rstacruz/vim-closer'
Plug 'jiangmiao/auto-pairs'
" light themes
Plug 'ayu-theme/ayu-vim'
Plug 'lifepillar/vim-solarized8'
" for ident lines
Plug 'Yggdroot/indentLine'
" Plug for Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"" For color scheme
if (has("termguicolors"))
" for transparency background {{{
 set t_8f=�[38;2;%lu;%lu;%lum
 set t_8b=�[48;2;%lu;%lu;%lum
" }}}
 set termguicolors
endif
"syntax enable
"colorscheme dracula
set background=light
colorscheme solarized8
hi! link Conceal Normal
if !has('gui_running')
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE
endif
"" For Nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" focus
nmap <silent> \tf :NERDTreeFind<CR>:NERDTreeFocus<CR>

"" For Terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"" For switching panels
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"" For file search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

"For Prettier"
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" key mappings example
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> \ge <Plug>(coc-definition)
nmap <silent> \gs :sp<CR><Plug>(coc-definition)
nmap <silent> \gv :vsp<CR><Plug>(coc-definition)
nmap <silent> \gt :vsp<CR><Plug>(coc-definition)<C-W>T" there's way more, see `:help coc-key-mappings@en'

"" For auto tree {{{
" Check if NERDTree is open or active
"function! IsNERDTreeOpen()
  "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction
"
"function! CheckIfCurrentBufferIsFile()
  "return strlen(expand('%')) > 0
"endfunction
"
"" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
"function! SyncTree()
  "if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction
"
"" Highlight currently open buffer in NERDTree
"autocmd BufRead * call SyncTree()
"
"function! ToggleTree()
  "if CheckIfCurrentBufferIsFile()
    "if IsNERDTreeOpen()
      "NERDTreeClose
    "else
      "NERDTreeFind
    "endif
  "else
    "NERDTree
  "endif
"endfunction

" }}}

" for system clipboard
set clipboard+=unnamedplus

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

"{{{ For autoclose brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
"inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"}}}


