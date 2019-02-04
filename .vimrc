" Vim Configuration : global settings
"=======================================
filetype plugin on

" Allow unicode characters in vimrc.
scriptencoding utf-8 

" wrap end of line
set wrap

" show line numbers
set number

" syntax highlighting
syntax on
set background=dark
set t_Co=256

"indent
set smartindent
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set smarttab
set expandtab

"search
set showmatch
set smartcase

set hlsearch
set incsearch

" copy/paste
"set paste
set clipboard=unnamedplus

" folding manual
set foldmethod=manual

" mouse
set mouse=a

" spell check, to be activated manually
set spelllang=en_us
set nospell

set showcmd "show incomplete commands in status bar
"Show @@@ in the last line if truncated
" set display=truncate
set scrolloff=10

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Match html tags etc (Not working in vim 7.4).
if has('syntax') && has('eval')
    packadd! matchit
endif

colorscheme default
set background=dark
set history=10000

" backup
set backup
set undofile
set backupdir=/scratch/abhshsha/.vimbackup//,/tmp/.vimbackup//,.
set directory=/scratch/abhshsha/.vimbackup//,/tmp/.vimbackup//,..
set undodir=/scratch/abhshsha/.vimbackup//,/tmp/.vimbackup//,..

set relativenumber
set splitbelow
set splitright

" Whitespace settings.
filetype indent on
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set list
set listchars=tab:Â¦Â·,trail:Â·
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Highlight current line
set cursorline
hi cursorline cterm=none term=none
highlight CursorLine guibg=#303000 ctermbg=236

" Find
set path+=**
set wildmenu
set wildmode=list:full
set wildignorecase
" Don't add .git to wildignore because it breaks Gdiff.
set wildignore=*/node_modules/*,*/www/*,*/dist/*,*/result/*,*/.idea/*,*~,*/ar/*,*/cs/*,*/da/*,*/de/*,*/el/*,*/es/*,*/fi/*,*/fr/*,*/fr-CA/*,*/he/*,*/hu/*,*/it/*,*/ja/*,*/ko/*,*/nl/*,*/no/*,*/pl/*,*/pt/*,*/pt-PT/*,*/ro/*,*/ru/*,*/sk/*,*/sv/*,*/th/*,*/tr/*,*/zh-Hans/*,*/zh-Hant/*,*/plugged/*

" show diff vertically
set diffopt+=vertical

" Vim Configuration : plugin definitions
"==========================================

" function! InstallYCM(info)
"   if a:info.status == 'installed' || a:info.force
"     !./install.py
"     !cd ./third_party/ycmd/third_party/tern_runtime && npm install
"   endif
" endfunction

" Start plugins definition
call plug#begin($HOME.'/.vim/plugins/plugged')

Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'
" Plug 'goatslacker/mango.vim'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-dist/PaperColor.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'bronson/vim-trailing-whitespace'
" Plug 'scrooloose/syntastic'
" Plug 'junegunn/vim-easy-align'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'maksimr/vim-jsbeautify'
" Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
" Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'moll/vim-node'
Plug 'syngan/vim-vimlint'
Plug 'ynkdir/vim-vimlparser'
Plug 'mattn/emmet-vim'

" Abhishek's plugin list.
Plug 'jiangmiao/auto-pairs' " Auto insert matching pair
Plug 'yggdroot/indentline' " Show indentation
Plug 'xolox/vim-misc' " Must for vim-session
Plug 'xolox/vim-session' " Auto save session
Plug 'junegunn/fzf', { 'dir': '~/.vim/fzf', 'do': './install --bin'  }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
" Use this plugin until ale fix option works.
Plug 'ruanyl/vim-fixmyjs' " eslint --fix
Plug 'qpkorr/vim-bufkill'
call plug#end()


" Vim Configuration : Plugins configuration
"=============================================

" [> NERDTree <]

" on vim enter opens nerd tree
function! OpenNerdTree()
    let s:exclude = ['COMMIT_EDITMSG', 'MERGE_MSG']
    if index(s:exclude, expand('%:t')) < 0
        NERDTreeFind
        exec "normal! \<c-w>\<c-w>"
    endif
endfunction
autocmd VimEnter * call OpenNerdTree()


" nerdtree window resize
let g:NERDTreeWinSize = 35

" show hidden files
let g:NERDTreeShowHidden=1

" single click to open nodes
" let g:NERDTreeMouseMode=3

" ignored files
let g:NERDTreeIgnore=['\.swp$', '\~$']
nnoremap <c-n> :NERDTreeToggle<cr>

" helps quiting when there's no buffers left but NerdTree
function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()


"" [> NERDCommenter <]
"
"noremap <c-_> :call NERDComment(0, "Toggle")<cr>


" [> Airline <]

" status line always opened
" set laststatus=2

" let g:airline#extensions#tabline#enabled = 1

"  powerline font
" let g:airline_powerline_fonts=1

" let g:airline_theme='bubblegum'

" [> EditorConfig <]

" to avoid issues with fugitive
" let g:EditorConfig_exclude_patterns = ['fugitive://.*']


" [> YankStack <]

"nmap <leader>p <Plug>yankstack_substitute_older_paste
"nmap <leader>P <Plug>yankstack_substitute_newer_paste


" [> Javascript libraries syntax <]

"let g:used_javascript_libs = 'jquery,underscore,requirejs,chai,handlebars,d3,tape'
let g:used_javascript_libs = 'jquery,requirejs,jasmine'


" [> YCM shortcuts <]
"
"function! Refactor()
"    call inputsave()
"    let g:newName = input("Enter the new variable name : ")
"    call inputrestore()
"    exec ":YcmCompleter RefactorRename " . g:newName
"endfunction
"
"nnoremap <leader>gt :YcmCompleter GetType<cr>
"nnoremap <leader>gd :YcmCompleter GetDoc<cr>
"nnoremap <leader>go :YcmCompleter GoTo<cr>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
"nnoremap <leader>gr :YcmCompleter GoToReferences<cr>
"nnoremap <leader>r :call Refactor()<cr>

" [> Emmet shortcuts <]
"
au FileType html,css,scss imap <leader>k  emmet#expandAbbrIntelligent("\<tab>")

"netrw configuration
let g:netrw_banner=0                " hide annoying banner
" let g:netrw_liststyle=3             " tree view
" let g:netrw_browser_split=4         " open in prior window
" let g:netrw_altv=1                  " open splits to the right
" let g:netrw_winsize = 20            " width 50%
" let g:netrw_list_hide=netrw_gitignore#Hide() " not working for some reason
let g:netrw_list_hide= '.*\.swp$,\.git\/$,.\~$'

" vim session options.
" let g:session_default_name='default'
let g:session_default_overwrite=1
" let g:session_autosave='yes'
" let g:session_autosave_to='default'
let g:session_autoload='yes'

" easytags configuration
" set cpoptions +=d
" set tags=./vimtags;
" let g:easytags_dynamic_files = 2
" let g:easytags_opts = ['--exclude=.git', '--exclude=www', '--exclude=dist', '--exclude=result', '--exclude=node_modules']

" ale configuration
let g:ale_linters_explicit = 1
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1
" let g:airline#extensions#ale#enabled = 1
" let g:ale_fix_on_save = 1

" Vim Configuration : global mapping
"======================================

" leader
let g:mapleader = ","
let g:localmapleader = "\\"

" move the current line below
" nnoremap <leader>- ddp

" move the current line above
" nnoremap <leader>_ ddkP

" switch tab
" nnoremap <S-right> :tabn<CR>
" nnoremap <S-left> :tabp<CR>

" insert mode uppercase the current word
"  <esc> : go to normal mode
"  v 	 : visual mode
"  iw 	 : select the current word
"  U 	 : uppercase selection
"  i 	 : back to insert mode
" inoremap <c-u> <esc>viwUi

" remove last search highlight
nnoremap <C-l> :nohlsearch<CR><C-l>

" Wrap a word in double quotes
" nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Wrap a word in single quotes
" nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" select inside parents
" onoremap in( :<c-u>normal! f(vi(<cr>

" select inside braces
" onoremap in{ :<c-u>normal! f{vi{<cr>

" select inside brackets
" onoremap in[ :<c-u>normal! f[vi[<cr>

" Open MYVIMRC in a vsplit
nnoremap <leader>ev :split $MYVIMRC<cr>

" Source MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Fix lint errors
noremap <leader>f :w<CR>:Fixmyjs<CR>

" ale mappings
nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

" close buffer
nnoremap <Leader>d :BD<CR>
" open terminal bash
" close terminal -> <C-D><leader>d
nnoremap <Leader>t :terminal bash<CR>

" fzf mappings
nnoremap <C-B> :Buffers<CR>
nnoremap <C-T> :Files<CR>
nnoremap <C-G> :GFiles<CR>
" :GFiles? is already mapped to backspace
" Below is conflicting with clear last search history.
" nnoremap <C-L> :BLines<CR>
nnoremap <C-C> :BCommits<CR>
" Files and buffers history
nnoremap <C-H>b :Hist<CR>
" Command history
nnoremap <C-H>: :Hist:<CR>
" Search history
nnoremap <C-H>/ :Hist/<CR>

" Nerdtree
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>m :NERDTreeToggle<CR>

" Vim Configuration : autocommands
"====================================

" Force filetype
autocmd BufRead,BufNewFile .eslintrc setfiletype json
autocmd BufRead,BufNewFile .jshintrc setfiletype json

" Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" open netrw
" augroup ProjectDrawer
"     autocmd!
"     autocmd VimEnter * :Vexplore
" augroup END

" Auto source vimrc on save
" autocmd bufwritepost *.vim source $MYVIMRC

" Strip trailing white spaces on save
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.css,*.js :call <SID>StripTrailingWhitespaces()

" Vim Configuration : commands
"====================================
command! MakeTags !ctags -R .
