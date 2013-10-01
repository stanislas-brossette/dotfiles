"Map the 'Enter' key in Normal mode with adding a new line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
