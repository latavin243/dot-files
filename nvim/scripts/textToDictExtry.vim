function! TextToDictEntryFunction()
	silent! %norm i'ea'la 'A',
	silent! norm ggVG"+y
	silent! norm gg
endfunction


command! TextToDictEntry call TextToDictEntryFunction()
