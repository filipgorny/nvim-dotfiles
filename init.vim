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


	Plug 'mfussenegger/nvim-dap'
	Plug 'nvim-lua/plenary.nvim'

	" Terminal
	Plug 'akinsho/toggleterm.nvim'

	" Go lang
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" LSP
	Plug 'prabirshrestha/vim-lsp'
call plug#end()

lua require('terminal')

colorscheme badwolf
