" Prefer tabs, 2-space long
set noexpandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set number relativenumber

set ignorecase smartcase

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

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
