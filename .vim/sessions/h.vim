let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <C-Tab> 	
inoremap <silent> <S-Tab> =BackwardsSnippet()
map  :CtrlPBuffer
noremap ru :call RopeUseFunction()
noremap rad :call RopeShowDoc()
noremap rac :call RopeShowCalltip()
noremap rx :call RopeRestructure()
noremap r1r :call RopeRenameCurrentModule()
noremap rr :call RopeRename()
noremap ro :call RopeOrganizeImports()
noremap r1v :call RopeMoveCurrentModule()
noremap rv :call RopeMove()
noremap r1p :call RopeModuleToPackage()
noremap ra? :call RopeLuckyAssist()
noremap raj :call RopeJumpToGlobal()
noremap rf :call RopeIntroduceFactory()
noremap ri :call RopeInline()
noremap rag :call RopeGotoDefinition()
noremap rnv :call RopeGenerateVariable()
noremap rnp :call RopeGeneratePackage()
noremap rnm :call RopeGenerateModule()
noremap rnf :call RopeGenerateFunction()
noremap rnc :call RopeGenerateClass()
noremap raf :call RopeFindOccurrences()
noremap rai :call RopeFindImplementations()
noremap rl :call RopeExtractVariable()
noremap rm :call RopeExtractMethod()
noremap ra/ :call RopeCodeAssist()
noremap rs :call RopeChangeSignature()
noremap ra :call RopeAutoImport()
snoremap <silent> 	 i<Right>=TriggerSnippet()
map  :tabnew
nnoremap <silent>  :CtrlP
noremap pu :call RopeUndo()
noremap pr :call RopeRedo()
noremap pc :call RopeProjectConfig()
noremap po :call RopeOpenProject()
noremap pg :call RopeGenerateAutoimportCache()
noremap p4f :call RopeFindFileOtherWindow()
noremap pf :call RopeFindFile()
noremap pnp :call RopeCreatePackage()
noremap pnm :call RopeCreateModule()
noremap pnf :call RopeCreateFile()
noremap pnd :call RopeCreateDirectory()
noremap pk :call RopeCloseProject()
snoremap  b<BS>
snoremap % b<BS>%
snoremap ' b<BS>'
map ,sv :call SplitVertical() 
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
set paste
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
cd ~/projects/h/h
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +98 assets.py
badd +2 events.py
badd +168 models.py
badd +28 app.py
badd +15 __init__.py
badd +30 ~/projects/h/src/horus/horus/__init__.py
badd +65 forms.py
badd +2 interfaces.py
badd +49 ~/projects/h/src/horus/horus/interfaces.py
badd +1 ~/projects/h/lib/python2.7/site-packages/hem/interfaces.py
badd +77 lib.py
badd +91 schemas.py
badd +1 api/__init__.py
badd +50 api/store.py
badd +1 api/token.py
silent! argdel *
edit api/store.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <S-Tab> =RopeLuckyAssistInsertMode()
inoremap <buffer> <silent> <C-Space> =RopeCodeAssistInsertMode()
inoremap <buffer> <silent> <Nul> =RopeCodeAssistInsertMode()
noremap <buffer> <silent> g :RopeGotoDefinition
noremap <buffer> <silent> d :RopeShowDoc
noremap <buffer> <silent> f :RopeFindOccurrences
noremap <buffer> <silent> m :emenu Rope . 	
nnoremap <buffer> <silent> ,r :Pyrun
vnoremap <buffer> <silent> ,r :Pyrun
nnoremap <buffer> <silent> ,b :call pymode#breakpoint#Set(line('.'))
onoremap <buffer> C :call pymode#motion#select('^\s*class\s', 0)
nnoremap <buffer> <silent> K :call pymode#doc#Show(expand('<cword>'))
vnoremap <buffer> <silent> K :call pymode#doc#Show(@*)
onoremap <buffer> M :call pymode#motion#select('^\s*def\s', 0)
nnoremap <buffer> [C :call pymode#motion#move('^\(class\|def\)\s', 'b')
nnoremap <buffer> [M :call pymode#motion#move('^\s*def\s', 'b')
onoremap <buffer> [[ :call pymode#motion#move('^\(class\|def\)\s', 'b')
onoremap <buffer> [C :call pymode#motion#move('^\(class\|def\)\s', 'b')
onoremap <buffer> [M :call pymode#motion#move('^\s*def\s', 'b')
vnoremap <buffer> [[ :call pymode#motion#vmove('^\(class\|def\)\s', 'b')
vnoremap <buffer> [M :call pymode#motion#vmove('^\s*def\s', 'b')
nnoremap <buffer> ]C :call pymode#motion#move('^\(class\|def\)\s', '')
nnoremap <buffer> ]M :call pymode#motion#move('^\s*def\s', '')
onoremap <buffer> ]] :call pymode#motion#move('^\(class\|def\)\s', '')
onoremap <buffer> ]C :call pymode#motion#move('^\(class\|def\)\s', '')
onoremap <buffer> ]M :call pymode#motion#move('^\s*def\s', '')
vnoremap <buffer> ]] :call pymode#motion#vmove('^\(class\|def\)\s', '')
vnoremap <buffer> ]M :call pymode#motion#vmove('^\s*def\s', '')
onoremap <buffer> aC :call pymode#motion#select('^\s*class\s', 0)
vnoremap <buffer> aC :call pymode#motion#select('^\s*class\s', 0)
onoremap <buffer> aM :call pymode#motion#select('^\s*def\s', 0)
vnoremap <buffer> aM :call pymode#motion#select('^\s*def\s', 0)
onoremap <buffer> iC :call pymode#motion#select('^\s*class\s', 1)
vnoremap <buffer> iC :call pymode#motion#select('^\s*class\s', 1)
onoremap <buffer> iM :call pymode#motion#select('^\s*def\s', 1)
vnoremap <buffer> iM :call pymode#motion#select('^\s*def\s', 1)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:XCOMM,n:>,fb:-
setlocal commentstring=#%s
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
setlocal expandtab
if &filetype != 'python'
setlocal filetype=python
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
setlocal formatoptions=cq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=s*\\(from\\|import\\)
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal indentexpr=pymode#indent#Indent(v:lnum)
setlocal indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except
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
setlocal omnifunc=RopeOmni
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
set scrollbind
setlocal scrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.py
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'python'
setlocal syntax=python
endif
setlocal tabstop=4
setlocal tags=~/projects/h/.git/python.tags,~/projects/h/.git/tags,./tags,./TAGS,tags,TAGS
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 50 - ((0 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
50
normal! 09|
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
