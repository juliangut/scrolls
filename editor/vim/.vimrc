" Files
set encoding=utf-8 nobomb " BOM causes trouble
set fileformats=unix,dos,mac " Support in this order

" Autoload plugins located at ~/.vim/bundle
call plug#begin('~/.vim/bundle')

" List of plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'
Plug 'evidens/vim-twig'

call plug#end()

" Airline integration
set guifont=Source\ Code\ Pro
let g:airline_powerline_fonts = 1
let g:airline_theme='kolor'

" Editor
syntax on
colorscheme molokai " Located at ~/.vim/colors
set title " Show file title in terminal tab
set showmode " Show current mode
set ruler " Show the cursor position
set number " Enable line numbers
set numberwidth=4 " Up to 9999 lines
set wrap " Wrap lines
set iskeyword+=_,$,@,%,# " None of these are word dividers
set cursorline " Highlight current line
set showcmd " Show the command being typed
set showmatch " Show matching brackets
set laststatus=2 " Always show status line
set history=1000 " Increase history from 20 default to 1000
set cmdheight=2 " Command bar height to # lines
set scrolloff=5 " Start scrolling before the cursor reaches the edge

" Indentation
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action
set expandtab " Expand tabs to spaces
set shiftwidth=4 " The # of spaces for indenting
set tabstop=4 " Tab key results in # spaces
set softtabstop=4 " Tab key results in # spaces
set shiftround " Round indent to nearest multiple of # spaces
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces

" Search
set ignorecase " Ignore case of searches
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set hlsearch " Highlight search results
set incsearch " Highlight dynamically as pattern is typed
set lazyredraw " Don't redraw while executing macros (good performance config)

" Errors
set noerrorbells " Disable error bells
set novisualbell " Disable visual blinking
set t_vb=
set tm=500

" Plugins
" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1c1c1c ctermbg=234
