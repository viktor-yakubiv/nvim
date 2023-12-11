" Prefer tabs, 2-space long
set noexpandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set number relativenumber
set splitright

" Smart search
set ignorecase smartcase " case-insensitive unless upper case used somewhere
set magic " RegExp special chars don't require escaping

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Text up to 80 characters long
set colorcolumn=80,100,120
set nowrap " easier to navigate
set textwidth=80 " automatically add hard text wraps at 80th coolumn

" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

" Show hidden characters
set list listchars=tab:→\ ,trail:~,eol:¬,extends:❯,precedes:❮,nbsp:␣

" Persistent undo even after you close a file and re-open it
set undofile

set clipboard+=unnamedplus
