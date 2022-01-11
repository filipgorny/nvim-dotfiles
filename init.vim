syntax on
filetype plugin indent on
set encoding=utf-8

set tabstop=2
set shiftwidth=2

call plug#begin()
  " File tree
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Start NERDTree and put the cursor back in the other window.
  autocmd VimEnter * NERDTree | wincmd p
  " Close the tab if NERDTree is the only window remaining in it.
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
	let NERDTreeMinimalUI=1

	highlight VertSplit ctermbg=NONE
	highlight VertSplit ctermfg=NONE
	highlight VertSplit cterm=NONE

  " Tabline
  Plug 'kdheepak/tabline.nvim'
  Plug 'vim-airline/vim-airline'
  
  " Ecma support
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'neovim/nvim-lspconfig'

  " Copilot
  Plug 'github/copilot.vim'

	" Coc	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-yaml', 'coc-tailwindcss', 'coc-svg', 'coc-sql', 'coc-stylelintplus', 'coc-sh', 'coc-python', 'coc-prisma', 'coc-prettier', 'coc-phpls', 'coc-html', 'coc-graphql', 'coc-go', 'coc-git', 'coc-gist', 'coc-eslint', 'coc-css', 'coc-angular']

	" Prettier
	command! -nargs=0 Prettier :CocCommand prettier.formatFile
	vmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	Plug 'natebosch/vim-lsc'
	let g:lsc_server_commands = {
\  "go": {
\    "command": "gopls serve",
\    "log_level": -1,
\    "suppress_stderr": v:true,
\  },
\}

  Plug 'prabirshrestha/vim-lsp'
	augroup LspGo
   au!
  	autocmd User lsp_setup call lsp#register_server({
    	  \ 'name': 'go-lang',
      	\ 'cmd': {server_info->['gopls']},
      	\ 'whitelist': ['go'],
      	\ })
	  autocmd FileType go setlocal omnifunc=lsp#complete
  	autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
  	"autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
  	"autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
	augroup END

"	Plug 'dense-analysis/ale'
"let g:ale_linters = {
"  \ 'go': ['gopls'],
"  \}

	"Plug 'autozimu/LanguageClient-neovim', {
   " \ 'branch': 'next',
  "  \ 'do': 'bash install.sh',
  "  \ }

" (Optional) Multi-entry selection UI.
"Plug 'junegunn/fzf'


	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	Plug 'mfussenegger/nvim-dap'
	Plug 'nvim-lua/plenary.nvim'

	" Terminal
	Plug 'akinsho/toggleterm.nvim'

	" LSP
	Plug 'prabirshrestha/vim-lsp'

	" Auto close pairs
	Plug('cohama/lexima.vim')

	" Emojis
	Plug 'junegunn/vim-emoji'
call plug#end()

lua require('terminal')

set background=dark
colorscheme badwolf

" Line numbers
set relativenumber

" Mouse support
set mouse=a

set fillchars+=vert:\ 

" Remap jj to escape
imap jj <Esc>

" Save file after each edit
inoremap <Esc> <Esc>:w<CR>
inoremap jj <Esc>:w<CR>

" Switch buffers with tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Navigation in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Show mode by cursor line color
autocmd InsertEnter,InsertLeave * set cul!
