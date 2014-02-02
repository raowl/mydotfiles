set nocompatible
let mapleader=","
set hidden "hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first. 

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set hidden " It hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first.  

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
" set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nostartofline        " dont move cursor after switching buffers
au BufNewFile,BufRead *.jinja2 set filetype=htmlm4

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

colorscheme desert
nmap <F8> :TagbarToggle<CR>
map <leader>n :NERDTreeToggle<CR>
set encoding=utf8

" navigate tabs

map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>
map <C-n> <Esc>:tabnew

" switch to last active tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

set t_Co=256
colorscheme xoria256-pluk
" colorscheme Mustang_Vim_Colorscheme_by_hcalves

""""""""""""""""""""""""""""""
" => CtrlP
" https://github.com/davidchan/my-vim/blob/master/.vimrc
" """"""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-b> :CtrlPBuffer<cr>

let g:ctrlp_working_path_mode = 'ra'

" exclude files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe " Windows
"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set nobackup  " this is the 70s git with files     
set noswapfile  

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

nmap <leader>p :setlocal paste! paste?<cr>

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%>80v.\+/

"set rtp+=/home/raowl/.vim/bundle/powerline/powerline/bindings/vim
"let g:Powerline_symbols = 'fancy'

"set statusline=%F%m%r%h%w\ 
"set statusline+=%{fugitive#statusline()}\    
"set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
"set statusline+=\ [line\ %l\/%L]          
"set statusline+=%{rvm#statusline()}
"
set noruler
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Documentation
let g:pymode_doc = 1 
let g:pymode_doc_key = 'K' 

let g:pymode_rope_lookup_project = 0

"Linting
let g:pymode_lint = 1 
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
" Auto check on save
let g:pymode_lint_write = 1 

" Support virtualenv
let g:pymode_virtualenv = 1 

" Enable breakpoints plugin
let g:pymode_breakpoint = 1 
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1 
let g:pymode_syntax_all = 1 
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0 


" insert pdb

nnoremap <leader>t Oimport pdb; pdb.set_trace()

"if inside a tmux code terminal then:
if !empty($tmux_project_name)
    let g:sessionfile='/home/raowl/.vim/sessions/' . $tmux_project_name . '.vim'

    fu! SaveSess()
		execute 'mksession! ' . g:sessionfile
	endfunction

	fu! RestoreSess()
		if filereadable(g:sessionfile)
		    execute 'so ' . g:sessionfile

		    "if bufexists(1)
			"    for l in range(1, bufnr('$'))
			"	    if bufwinnr(l) == -1
			"		    exec 'sbuffer ' . l
			"	    endif
			"    endfor
		    "endif
		endif
	endfunction

    autocmd VimLeave * call SaveSess()
    autocmd VimEnter * call RestoreSess()
endif


" syntastic
"let g:syntastic_disabled_filetypes=['html']
"let g:syntastic_mode_map = { 'mode': 'active',
"	\ 'active_filetypes': [],
"	\ 'passive_filetypes': ['html'] }

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1

" let g:syntastic_python_checkers=['pep8', 'pyflakes']
let g:syntastic_html_checkers=['tidy']
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
let g:syntastic_coffee_checkers = ['coffee']

" when split go to that new window
set splitbelow
set splitright

fu! SplitVertical()
	let nextline=line("w$")+1
	vsplit
	exe nextline
	normal! zt
	windo set scb
endfunction

map <Leader>sv :call SplitVertical() <CR>

" esc erases vim selection
" nnoremap <esc> :noh<return><esc> 
"
" use jj instead of scape
inoremap jj <ESC>

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'tpl' : 1,
    \ 'smarty' : 1,
    \ 'jinja' : 1,
    \}

"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=277   ctermbg=277
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=249 ctermbg=249

"let g:indentLine_char = '|'
let g:indentLine_color_term = 239
