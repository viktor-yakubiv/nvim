try
	" colorscheme stim
	colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
	echo 'Color scheme is not installed yet'
endtry
