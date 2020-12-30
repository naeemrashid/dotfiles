set number
set nocompatible
set splitbelow
set splitright
"colorscheme sonokai
colorscheme elflord

" Choose your leader - without a leader you are lost, The comma makes a great leader of men
let mapleader = ','
let maplocalleader = '\'


"Map split panes movement to C-hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Highlight tabs
set list
set listchars=tab:>-

"Highlight whitespaces with red
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

"Toggle NerdTree with C-n
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" Vim autocomplete
"

" scroll up/down with j,k. Open vim autocomplete with C-n
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))


"
"Using vim buffers
"https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
"


"Setup some default ignores for CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"
" Setup some key bindings for Buffergator
"

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>j :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>k :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" To open a new empty buffer
" Close the current buffer and move to the previous one
nmap <leader>bn :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>



"
" Custom Functions
"

" Remove trailing whitespace
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
function! StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<cr>
        normal `z
        retab
    endif
endfunction

" Hightlight on function
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

"
"Custom mappings
"

" Trim whitespaces with <leader>tW
nmap <leader>tW :cal StripTrailingWhitespace()<cr>


"
"Custom minimal status line
"
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
