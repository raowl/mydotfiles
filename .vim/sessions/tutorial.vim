let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <S-Tab> =BackwardsSnippet()
inoremap <C-Tab> 	
map  :CtrlPBuffer
noremap ra :call RopeAutoImport()
noremap rs :call RopeChangeSignature()
noremap ra/ :call RopeCodeAssist()
noremap rm :call RopeExtractMethod()
noremap rl :call RopeExtractVariable()
noremap rai :call RopeFindImplementations()
noremap raf :call RopeFindOccurrences()
noremap rnc :call RopeGenerateClass()
noremap rnf :call RopeGenerateFunction()
noremap rnm :call RopeGenerateModule()
noremap rnp :call RopeGeneratePackage()
noremap rnv :call RopeGenerateVariable()
noremap rag :call RopeGotoDefinition()
noremap ri :call RopeInline()
noremap rf :call RopeIntroduceFactory()
noremap raj :call RopeJumpToGlobal()
noremap ra? :call RopeLuckyAssist()
noremap r1p :call RopeModuleToPackage()
noremap rv :call RopeMove()
noremap r1v :call RopeMoveCurrentModule()
noremap ro :call RopeOrganizeImports()
noremap rr :call RopeRename()
noremap r1r :call RopeRenameCurrentModule()
noremap rx :call RopeRestructure()
noremap rac :call RopeShowCalltip()
noremap rad :call RopeShowDoc()
noremap ru :call RopeUseFunction()
snoremap <silent> 	 i<Right>=TriggerSnippet()
map  :tabnew
nnoremap <silent>  :CtrlP
noremap pk :call RopeCloseProject()
noremap pnd :call RopeCreateDirectory()
noremap pnf :call RopeCreateFile()
noremap pnm :call RopeCreateModule()
noremap pnp :call RopeCreatePackage()
noremap pf :call RopeFindFile()
noremap p4f :call RopeFindFileOtherWindow()
noremap pg :call RopeGenerateAutoimportCache()
noremap po :call RopeOpenProject()
noremap pc :call RopeProjectConfig()
noremap pr :call RopeRedo()
noremap pu :call RopeUndo()
snoremap  b<BS>
snoremap % b<BS>%
snoremap ' b<BS>'
nnoremap ,t Oimport pdb; pdb.set_trace()
nmap ,p :setlocal paste! paste?
map ,e :e =expand("%:p:h") . "/" 
nmap ,tl :exe "tabn ".g:lasttab
map ,n :NERDTreeToggle
snoremap U b<BS>U
snoremap \ b<BS>\
snoremap ^ b<BS>^
snoremap ` b<BS>`
nmap gx <Plug>NetrwBrowseX
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> b<BS>
snoremap <silent> <S-Tab> i<Right>=BackwardsSnippet()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <C-Right> :bnext
map <C-Left> :bprev
nmap <F8> :TagbarToggle
inoremap <silent> 	 =TriggerSnippet()
inoremap <silent> 	 =ShowAvailableSnips()
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set backspace=indent,eol,start
set copyindent
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=es
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set runtimepath=~/.vim,~/.vim/bundle/ctrlp,~/.vim/bundle/fugitive,~/.vim/bundle/nerdtree,~/.vim/bundle/powerline,~/.vim/bundle/python-mode,~/.vim/bundle/snipmate,~/.vim/bundle/supertab,~/.vim/bundle/tagbar,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,~/.vim/bundle/python-mode/after,~/.vim/bundle/snipmate/after,~/.vim/after
set shiftround
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noswapfile
set tabstop=4
set title
set updatetime=1000
set visualbell
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/lzone/pyramidtut/tutorial
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +15 development.ini
badd +1 tutorial/models.py
badd +1 tutorial/views.py
silent! argdel *
edit development.ini
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:;
setlocal commentstring=;\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'dosini'
setlocal filetype=dosini
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'dosini'
setlocal syntax=dosini
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
