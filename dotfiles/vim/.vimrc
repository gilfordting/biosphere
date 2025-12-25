" Enabling useful Vim functionality
set nocompatible

" Enable type file detection
filetype on

" Enable plugins and load plugin for detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Turn on syntax highlighting and change color scheme
syntax on
colorscheme onedark

" Disable the default Vim startup message
set shortmess+=I

" Show line numbers and relative line numbers
set number
set relativenumber

" Always show the status line at the bottom, even if only one window open
set laststatus=2

" Override default backspace behavior
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" Commands
set showcmd " Show partial commands in bottom right

" Search settings
set incsearch " Highlight matches while typing
set ignorecase " Case-insensitive search (lowercase queries only)
set smartcase " Override ignorecase if capital letters in query
set showmatch " Show matching words during search
set hlsearch " Highlight matches when searching

" Enable mouse scrolling, clicking
set mouse=a

" History
set history=1000


" 6.191/6.004 Minispec syntax setup
filetype plugin indent on
autocmd BufNewFile,BufRead *.bsv set ft=bsv
autocmd BufNewFile,BufRead *.ms set ft=bsv
autocmd FileType bsv set shiftwidth=4 expandtab smarttab
let b:verilog_indent_modules = 1