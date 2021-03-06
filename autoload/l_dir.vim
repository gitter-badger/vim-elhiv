function! l_dir#new(path)
	let l:dir= {
		\ 'path' : a:path,
		\ 'exists' : isdirectory(a:path) }
	function! l:dir.parent()
		let l:s= l_s#new()
		let l:last_slash_idx= l:s.ridx(self.path, '/', len(self.path) - 2)
		if l:last_slash_idx < 1 "0 or -1
			return l#null()
		endif
		return l_dir#new(self.path[0:l:last_slash_idx - 1])
	endfunction
	return l:dir
endfunction
