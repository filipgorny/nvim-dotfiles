syntax on
filetype plugin indent on
set encoding=utf-8

set tabstop=2
set shiftwidth=2
set expandtab

call plug#begin()
  " File tree
  "Plug 'preservim/nerdtree'
  "Plug 'ryanoasis/vim-devicons'
  "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Start NERDTree and put the cursor back in the other window.
  "autocmd VimEnter * NERDTree | wincmd p
  " Close the tab if NERDTree is the only window remaining in it.
  " autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  " autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
  "  \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
	"let NERDTreeMinimalUI=1
	"
	"highlight VertSplit ctermbg=NONE
	"highlight VertSplit ctermfg=NONE
	"highlight VertSplit cterm=NONE

  " Tabline
  Plug 'kdheepak/tabline.nvim'

  " Ecma support
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'neovim/nvim-lspconfig'

  " Copilot
  Plug 'github/copilot.vim'

	" Coc	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-yaml', 'coc-tailwindcss', 'coc-svg', 'coc-sql', 'coc-stylelintplus', 'coc-sh', 'coc-python', 'coc-prisma', 'coc-prettier', 'coc-phpls', 'coc-html', 'coc-go', 'coc-git', 'coc-gist', 'coc-eslint', 'coc-css', 'coc-angular', 'coc-clangd', '@yaegassy/coc-tailwindcss3']

	" Add missing imports on save (GO)
	autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

	" Prettier format on save
	command! -nargs=0 Prettier :CocCommand prettier.formatFile
	vmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)


	" Terminal
	Plug 'akinsho/toggleterm.nvim'

	" Auto close pairs
	Plug('cohama/lexima.vim')

	" Emojis
	Plug 'junegunn/vim-emoji'

	" LSP Colors
	Plug 'folke/lsp-colors.nvim'

	" NNN
	" Plug 'mcchrish/nnn.vim'
	" Exit Vim if NnnExplorer is the only window remaining in the only tab.
	" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && &filetype ==# 'nnn' | quit! | endif
	" Close the tab if NnnExplorer is the only window remaining in it.
	" autocmd BufEnter * if winnr('$') == 1 && &filetype ==# 'nnn' | quit! | endif

	" Vim-go 
  "	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	
	" Nvim tree
	Plug 'kyazdani42/nvim-web-devicons' " for file icons

	" Vim wiki
	Plug 'vimwiki/vimwiki'

    Plug 'kyazdani42/nvim-tree.lua'

    " Themes
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'ayu-theme/ayu-vim'
    Plug 'rafi/awesome-vim-colorschemes'

    " React
    "Plug 'peitalin/vim-jsx-typescript'
    "autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

  "------------------------ VIM TSX ------------------------
  " by default, if you open tsx file, neovim does not show syntax colors
  " vim-tsx will do all the coloring for jsx in the .tsx file
  Plug 'ianks/vim-tsx'

  " airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'tpope/vim-fugitive'

call plug#end()

lua require('terminal')
lua require('treebrowser')

set background=dark
colorscheme badwolf

" Line numbers
set relativenumber

" Mouse support
set mouse=a

set fillchars+=vert:\ 

" Remap jj to escape
imap jj <Esc>
imap jk <Esc>

" Save file after each edit
inoremap <Esc> <Esc>:w<CR>
inoremap jj <Esc>:w<CR>
inoremap jk <Esc>:w<CR>
 
" Switch buffers with tab
nnoremap  <silent> <M-w>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <M-q>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Navigation in insert mode
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>
cnoremap <M-h> <Left>
cnoremap <M-j> <Down>
cnoremap <M-k> <Up>
cnoremap <M-l> <Right>
nnoremap <M-h> <Left>
nnoremap <M-j> <Down>
nnoremap <M-k> <Up>
nnoremap <M-l> <Right>


" Transparency (or blackness)
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=none 
hi Normal guibg=NONE ctermbg=NONE

" Speed up VIM
set timeoutlen=185
set ttimeoutlen=0
"set maptimeout=0

" Map ENTER to insert mode
nmap <C-m> <Esc>i

" Show mode by cursor line color
autocmd InsertEnter,InsertLeave * set cul!
hi CursorLine ctermfg=green ctermbg=black
hi clear CursorLineNR
hi CursorLineNR ctermbg=darkgray

" Opn file explorer in new tab
nnoremap we <Esc>:Texplore<CR>

" Close buffer with qq
nnoremap qq <Esc>:q<CR>
inoremap qq <Esc>:q<CR>
cnoremap qq <Esc>:q<CR>

function! SaveMethod()
  CocCommand prettier.formatFile
  write
endfunction


" Save with wq
nnoremap wq <Esc>:call SaveMethod()<CR>
inoremap wq <Esc>:call SaveMethod()<CR>
cnoremap wq <Esc>:call SaveMethod()<CR>
nnoremap fd <Esc>:call SaveMethod()<CR>
inoremap fd <Esc>:call SaveMethod()<CR>
cnoremap fd <Esc>:call SaveMethod()<CR>


" NETRW settings
set autochdir

" Map switch tab
nnoremap <C-j> <Esc>:tabnext<CR>
nnoremap <C-k> <Esc>:tabprevious<CR>
inoremap <C-j> <Esc>:tabnext<CR>
inoremap <C-k> <Esc>:tabprevious<CR>


" Undo
nnoremap <c-z> :u<CR>      " Avoid using this**
inoremap <c-z> <c-o>:u<CR>

" Netrw
let g:netrw_liststyle=1
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_sort = 2

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
		nmap <Backspace> gg<CR>
		nmap <CR> <CR>jj
endfunction

" Rename the variable
function! Rnvar()
  let word_to_replace = expand("<cword>")
  let replacement = input("new name: ")
  execute '%s/\(\W\)' . word_to_replace . '\(\W\)/\1' . replacement . '\2/gc'
endfunction

nnoremap rs <Esc>:call Rnvar()<CR>

" Select all
nnoremap <C-a> <Esc>ggVG

" Open nvim config
nnoremap <Leader>vc :e ~/.config/nvim/init.vim<CR>

" Go to start of the line
nnoremap fl $
nnoremap fh 0
nnoremap fj L
nnoremap fk H

" Use system clipboard
set clipboard+=unnamedplus

" Go to and exit from insert mode using space
nnoremap <Space> <Esc>i
inoremap <Space><Space> <Esc>
inoremap <C-Space> <Esc>

" WIldmode
set wildmode=longest,list,full

" Comment current line
nnoremap // I// <ESC>

nnoremap <leader>vc :e ~/.config/nvim/init.vim<CR>

" Beginning and end of line
nnoremap - 0
nnoremap = $

" Backspace to enter insert mode when pressed in normal
nnoremap <BS> i<BS><Esc>

" Add empty line
nnoremap wa <Esc><S-a><CR><Esc>k<CR>

nnoremap ll <Right><Right> 


inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap qa :%bd|e\#
inoremap qa :%bd|e\#
cnoremap qa :%bd|e\#

