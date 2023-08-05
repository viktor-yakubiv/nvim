try
	colorscheme stim
catch /^Vim\%((\a\+)\)\=:E185/
	echo "Stim color scheme is not installed yet"
endtry
