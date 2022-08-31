set nocompatible              " be iMproved, required
filetype off                  " required

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set shiftround
set softtabstop=4               " number of spaces in tab when editing
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set lazyredraw                  " redraw only when need to.
set wildmenu                    " visual autocomplete for command menu

"buffers
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

"" Layout Settings section
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
" set background=dark

"Line numbers
set number
set relativenumber
set cursorline                  " hightligh current line
set modelines=1
set list
set listchars=trail:-,tab:>\>

set splitbelow splitright

highlight Normal guibg=NONE ctermbg=NONE
" define line highlight color
highlight LineHighlight ctermbg=darkgray guibg=darkgray
"" End of Layout Settings section

" Start of filetype settings section
autocmd BufNewFile,BufRead *.tpl,*.ejs set syntax=html
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
" End of filetype settings section

" Start of keybindings settings section
" To open a new empty buffer
nmap <leader>N :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>k :bprevious<CR>
" Toggle between buffers
nmap <leader>bb :b #<CR> 
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Remap splits navigation to just CTRL + hjkl
" Removed to use the quicklist shortcuts in this place
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
noremap <C-w><Left> :vertical resize +3<CR>
noremap <C-w><Right> :vertical resize -3<CR>
noremap <C-w><Up> :resize +3<CR>
noremap <C-w><Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Set widown sizes {max_height, max_width, equal_width}
map <Leader>- <C-w>_
map <Leader>< <C-w>\|
map <Leader>0 <C-w>=

" Remove this setting
map - <Nop>

" Enable paste withou formating
set pastetoggle=<F3>

" Open autocomplet help
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Clean last search highlight
map <leader><space> :nohl<cr>
" replace selection
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" replace selection global
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//g<Left><Left>

" Custom buffer switcher
nnoremap <C-e> :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>

" Change motion keys to work with line wrapper
let s:wrapenabled = 0
function! ToggleWrap()
  set wrap nolist
  if s:wrapenabled
    set nolinebreak
    unmap j
    unmap k
    unmap 0
    unmap ^
    unmap $
    let s:wrapenabled = 0
  else
    set linebreak
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap ^ g^
    nnoremap $ g$
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap ^ g^
    vnoremap $ g$
    let s:wrapenabled = 1
  endif
endfunction
map <leader>wl :call ToggleWrap()<CR>

" Primeagen TOP 5 maps
" Behave VIM: makes Y behave like D and C
nnoremap Y y$
" Keeping cursor centered on search next work and concat lines
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <M-C-j> :cnext<CR>zzzv
nnoremap <M-C-k> :cprevious<CR>zzzv
" Add more undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap _ _<c-g>u
" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-1<CR>==
" End of Primeagen TOP 5 maps

" Open builtin file manager
map <F7> :Explore<CR>

" highlight the current line
nnoremap <silent> <Leader>ah :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
" clear all the highlighted lines
nnoremap <silent> <Leader>ch :call clearmatches()<CR>
nmap <Leader>yfp :let @" = expand("%")<cr>
"End of keybindings settings section

" set autowrite 1
" set autowriteall
set autoread

if has('nvim') || has('termguicolors')
  set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fixes mouse issues using Alacritty terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (!has('nvim'))
    set ttymouse=sgr
endif

" For per folder vim-settings
set exrc
set secure
