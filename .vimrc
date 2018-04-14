set nocompatible
filetype off

execute pathogen#infect()

syntax on
filetype plugin indent on

command WW w | !./make
nnoremap <F9> :!%:p<Enter>
nnoremap <F10> :!pycodestyle.py --first --show-source --show-pep8 %:p<Enter>
nnoremap <CR> :noh<CR><CR>
set number
set laststatus=2
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P\ %{fugitive#statusline()}
set diffopt=vertical
set splitright

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set fileformat=unix


let $BASH_ENV = "~/.bash_aliases"

function! Yapf()                                                                
  let bufnr = bufnr('%')
  tabnew
  execute 'b' . bufnr
  vnew                                                                    
  setlocal buftype=nofile                                                 
  setlocal bufhidden=wipe                                                 
  setlocal noswapfile
  read !yapf #                                                            
  0delete_
  let &filetype=getbufvar('#', '&filetype')
  execute 'autocmd BufWipeout <buffer> diffoff!'
  diffthis
  wincmd p                                                                
  diffthis
endfunction

"function! Yapf()
"    exe "normal \<C-w>s\<C-w>T"
"	vnew
"	setlocal buftype=nofile
"	read !yapf #
"	windo diffthis
"	wincmd p
""	#colorscheme jimdiff
"endfunction

"set t_CO=256
"set termguicolors
"#colorscheme apprentice
colorscheme apprentice
set background=dark

set backspace=indent,eol,start
set colorcolumn=80

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
set cursorline
set foldlevel=2

let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
let g:ale_fixers = {
\    'python': ['remove_trailing_lines', 'trim_whitespace', 'isort', 'yapf']
\}
let g:ale_completion_enabled = 1  
nnoremap <leader>z :exec '!python' shellescape(@%, 1)<cr>
