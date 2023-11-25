" Plugins
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'scrooloose/nerdtree'           " side bar file tree
Plug 'itchyny/lightline.vim'         " minmal status bar
Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'
Plug 'KKPMW/vim-sendtowindow'        " send commands to REPL
Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'
Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
Plug 'ncm2/ncm2-bufword'             " complete words in buffer
Plug 'ncm2/ncm2-path'                " complete paths
Plug 'gaalcaras/ncm-R'               " R completion [dep]: ncm2, Nvim-R
Plug 'jalvesaq/Nvim-R'               " required for ncm-R
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mhinz/vim-startify'            " A start menu for vim
Plug 'tpope/vim-surround'            " replace surrounding characters
Plug 'filipekiss/ncm2-look.vim'      " ncm2 spelling
Plug 'SirVer/ultisnips'              " hotkeys for chunks of code
Plug 'JuliaEditorSupport/julia-vim'  " julia syntax highlighting
Plug 'tmhedberg/SimpylFold'          " Code folding (zo: open, zc: close)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim'              " Fuzzy Finder
Plug 'rust-lang/rust.vim'            " Rust format
Plug 'vim-voom/VOoM'                 " For Toc in particular
Plug 'vim-pandoc/vim-pandoc-syntax'  " for syntax highlighting 
Plug 'quarto-dev/quarto-vim'         " for syntax highlighting   
call plug#end()

" To have console in an external terminal
let R_external_term = 1

" To Insert two line above and go in insert mode
nnoremap O O<Esc>O

" toc
let voom_ft_modes = {'rmd': 'pandoc', 'markdown': 'pandoc', 'r': 'wiki', 'rnoweb': 'latex', 'qmd': 'pandoc'}
nnoremap <Leader>vo :VoomToggle<cr>

" ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" ncm2-loom
let g:ncm2_look_enabled = 0

" use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" turn on spelling and make a spell file
set spelllang=en_us
set spellfile=~/.config/nvim/en.utf-8.add

" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" lightline : a minimal status line for nvim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" ncm2 
autocmd BufEnter * call ncm2#enable_for_buffer()      " enable ncm2 for all buffers
set completeopt=noinsert,menuone,noselect             " IMPORTANT: :help Ncm2PopupOpen for more information

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']  " ignore pyc files

" Theme settings
colorscheme peachpuff                  " use vim-one colorscheme
set background=light              " [dark or light]
set termguicolors                " fg and bg highlighting requires compatible terminal colors

" Window Splits
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Start terminals for R and Python sessions '\tr' or '\tp'
map <Leader>tr :new term://bash<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k
map <Leader>td :new term://bash<CR>isqlite3<CR><C-\><C-n><C-w>k
map <Leader>tj :new term://bash<CR>ijulia<CR><C-\><C-n><C-w>k
map <Leader>ts :new term://bash<CR>iscala<CR><C-\><C-n><C-w>k

" General Settings
set number                      " set line numbers
set updatetime=100              " set update time for gitgutter update
set noswapfile                  " no swap
set clipboard=unnamedplus       " Copy/paste between vim and other programs. '"+y' then middlemouse

" tabs and spaces
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Uses shiftwidth and tabstap to insert blanks when <Tab>
set shiftwidth=2                " One tab == four spaces.
set tabstop=2                   " One tab == four spaces.<Paste>

" remap
:imap jk <Esc>

