" vimrc configuration file
" Maintainer: asccigcc
" Created: December 23, 2016
" Last update: Nov 1st, 2020
" Version: 0.0.1
" Sections:
"   -> Package Manager 		  [PKG]
"   -> General 			        [GEN]
"   -> Vim UI 			        [VUI]
"   -> Editing			        [EDT]
"   -> Files			          [FIL]
"   -> Helpers              [HLP]
"   -> Keymaps              [KEY]
"   -> Plugin Settings      [PUG]
" References:
"   -> ggalindez     [https://github.com/ggalindezb/Dot-Files/blob/master/vimrc]
"   -> Amix vimrc    [http://amix.dk/vim/vimrc.html]
"   -> VimCasts      [http://vimcasts.org]
"   -> Gary Berhardt [https://github.com/garybernhardt/dotfiles/blob/master/.vimrc]
"   -> Andrew Radev  [http://andrewradev.com]


" -------------------- [PKG]

" -------------------- Install Plug

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!mkdir -p ~/.vim/autoload'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" --------------------- Navigation

Plug 'scrooloose/nerdtree' " file menu
Plug 'junegunn/fzf.vim' " fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jeffkreeftmeijer/vim-numbertoggle' " auto toggling between line number modes
" Plug 'christoomey/vim-tmux-navigator' " easy navigation b/w vim & tmux
Plug 'ervandew/supertab' " tab autocomplete
" Plug 'wesQ3/vim-windowswap' " swap windows around
" Plug 'mileszs/ack.vim' " Wrapper for ack, beyond grep
" Plug 'Valloric/YouCompleteMe'      " Code-completion engine for Vim

" --------------------- Edition

Plug 'tpope/vim-repeat' " Repeating supported plugin maps
Plug 'tpope/vim-endwise' " auto end addition in ruby
Plug 't9md/vim-ruby-xmpfilter' " inline ruby completion
Plug 'w0rp/ale' " syntax checking and live RuboCop violations
Plug 'maximbaz/lightline-ale' " ALE indicator for lightline
Plug 'vim-scripts/ReloadScript' " ReloadScript - Guard for file changes
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'godlygeek/tabular' " Text filtering and alignment
Plug 'kien/rainbow_parentheses.vim' " Better Rainbow Parentheses
Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple
Plug 'derekprior/vim-trimmer' " trim whitespace on save
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace
Plug 'tmhedberg/matchit' " Extended % matching

" --------------------- Syntax

" Plug 'vim-ruby/vim-ruby' " Vim support for Ruby
" Plug 'fatih/vim-go' " Vim support for Go
Plug 'tpope/vim-rails' " Vim support for Rails
" Plug 'othree/html5.vim', {'for': 'html'} " Vim support for HTML5
" Plug 'tpope/vim-haml', {'for': 'haml'} " Vim support for HAML/SASS
" Plug 'plasticboy/vim-markdown', {'for': 'md'} " Vim support for Markdown
" Plug 'kchmck/vim-coffee-script', {'for': 'coffee'} " Vim support for Coffeescript
" Plug 'elzr/vim-json' " Vim support for JSON
Plug 'sheerun/vim-polyglot' " all the syntax
" Plug 'posva/vim-vue' " vue js syntax
Plug 'yoheimuta/vim-protolint' " linter for protos
Plug 'scrooloose/syntastic' " Syntax checking hacks

" --------------------- Helpers

Plug 'janko-m/vim-test' " vim rspec runner
" Plug 'tpope/vim-dispatch' " run rspec specs from vim
Plug 'vim-scripts/L9' " L9 provides some utility functions
Plug 'killphi/vim-ruby-refactoring' " Vim support for refactor code
Plug 'tpope/vim-bundler' " Vim support for Bundler
Plug 'tpope/vim-fugitive' " Git wrapper so awesome, it should be illegal
" Plug 'airblade/vim-gitgutter' " Git diff in the gutter

" --------------------- Appareance

Plug 'itchyny/lightline.vim' " minimalist status bar
Plug 'ryanoasis/vim-devicons' " fancy icons in vim
Plug 'bling/vim-airline' " Lean and mean status/tabline
Plug 'vim-airline/vim-airline-themes' " Collection of themes for airline
Plug 'bling/vim-bufferline'

" --------------------- Colors

Plug 'altercation/vim-colors-solarized' " Port of solarized
Plug 'whatyouhide/vim-gotham' " Code never sleeps in Gotham City
Plug 'tomasr/molokai' " Port of monokai
Plug 'joshdick/onedark.vim' " Port of onedark
Plug 'morhetz/gruvbox' " Retro groove color scheme for Vim
Plug 'baeuml/summerfruit256.vim' " Friendly with eyes

call plug#end()

" -------------------- [GEN]

set nocompatible
set laststatus=2
set encoding=utf-8
set hidden
set visualbell  " no sounds
set gcr=a:blinkon0  " disable cursor blink
set autoread " Set to auto read when a file is changed from the outside
set history=1000 " Remember stuff
set undolevels=1000

" -------------------- [VUI]

colorscheme onedark
autocmd ColorScheme * highlight CocErrorFloat guifg=#ffffff
autocmd ColorScheme * highlight CocInfoFloat guifg=#ffffff
autocmd ColorScheme * highlight CocWarningFloat guifg=#ffffff
autocmd ColorScheme * highlight SignColumn guibg=#adadad

syntax enable " Syntax highlight
hi Normal guibg=NONE ctermbg=NONE " Set transparent background

" Status Line
set showcmd
set ruler                       " Show ruler
set ch=2                         " Make command line two lines high

" Interface improvments
set novisualbell                " Disable flashes
set t_vb=                       " No visual bell
set noerrorbells                " Fuck bells!
set lazyredraw                  " Don't redraw while executing macros

" Windows
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Cursor highlights
set cursorline
set cursorcolumn

" highlight trailing whitespace
match ErrorMsg '\s\+$'
" -------------------- [EDT]

" Editing position aid
set number relativenumber
set numberwidth=3
set cursorline

" Vim command line
set wildmenu                    " Autocomplete in cmd
set wildignore=*~,*.swp         " Ignore temp files
set showcmd                     " Show partial cmd
set cmdheight=1                 " Short cmd line
set showmode                    " show current mode down the bottom
set synmaxcol=128               " no syntax highlighting for lines longer than 128 cols
" Go plugin workaround for slow edition
set nocursorcolumn
set re=1
syntax sync minlines=256

" Search options
set smartcase                   " Ignore casing unless search a cased word
set hlsearch                    " Highlight matches
set incsearch		                " Real time match
set magic                       " Parse regex in search
set ignorecase                  " Ignore case when searching

" Interaction
set timeoutlen=1000 ttimeoutlen=0 " remove delay from escape key when entering normal mode
set mouse=a " mouse scrolling in vim splits
set regexpengine=1

" Use 2-space tabs, standard
set tabstop=2
set softtabstop=2
set shiftwidth=2
set modelines=1                                 " only use setting at bottom of page for this file

" Use spaces for tabs
set expandtab
set smarttab

" Indent
set autoindent
set smartindent
set ai
set si

" Break long lines, per word, 80 chars per line
set wrap
set linebreak

" Allow backspacing over everything
set backspace=indent,eol,start

" Vim plugin for showing matching parens
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2
set matchpairs+=<:>

" Searching
set rtp+=/usr/local/opt/fzf " command line fuzzy finder
set incsearch " search as characters are entered

nnoremap \\ :noh<return> " Clear highlighting on escape in normal mode

" Use spacebar to repeat last command
nore <Space> .
" Use . as :
nore . :
let mapleader = ","

" -------------------- [FIL]

" Don't write anything but the file
set nobackup
set nowb
set noswapfile

" Blowfish encryption
setlocal cryptmethod=blowfish

" Filetypes
filetype plugin indent on

" Sessions - Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" autocmd!
let ruby_fold=1
autocmd FileType ruby normal zR
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType haml set omnifunc=hamlcomplete#Complete
autocmd FileType yaml set omnifunc=yamlcomplete#Complete
autocmd FileType sass set omnifunc=sasscomplete#Complete
autocmd FileType go autocmd BufWritePre <buffer> GoFmt
autocmd FileType text setlocal textwidth=80
autocmd FileType asciidoc setlocal textwidth=80
" Don't change tabs for spaces in Makefiles
autocmd FileType make setlocal noexpandtab

" Set [...] to 2-space indent
set sts=2 ts=2 sw=2

" Set SASS to SASS. Duh
autocmd! BufRead,BufNewFile *.sass setfiletype sass

" Delete trailing white space on sav
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc

" autocmd BufWrite *.py :call DeleteTrailingWS()
" autocmd BufWrite *.coffee :call DeleteTrailingWS()
" autocmd BufWrite *.txt :call DeleteTrailingWS()

" -------------------- [HLP]

" -------------------- [KEY]

" easy navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Handy commands
map <Leader>bi :!bundle install<cr> " bundle install in vim
nmap <leader>bp orequire 'pry'; binding.pry<esc>^ " insert ruby debugger
nmap <leader>db odebugger;<esc>^ " insert js debugger
" Buffer keymaps
map <Leader>bn :bnext<cr>
map <Leader>bm :bprevious<cr>
map <Leader>bd :bdelete<cr>
map <Leader>bf :Buffers<cr>
" map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>   " automate clipboard copy/paste indentation
" vmap <C-x> :!pbcopy<CR>
" vmap <C-c> :w !pbcopy<CR><CR>
" map <Leader>sp :!bundle exec rspec spec<cr> " run bundle exec rspec

" Paste from the clipboard without indenting
" set pastetoggle=<Leader>p

" Navigation keymaps
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Tab keymaps
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" Dismiss search highlight
nmap <Leader><Space> :nohl<cr>

" Giga save. Handle with care
nmap <leader>ww :wall!<cr>
nmap <leader>wq :wqall!<cr>
nmap <leader>qq :qall!<cr>

" Insert a new-line and esc
nnoremap o o<Esc>
nnoremap O O<Esc>

" -------------------- [PUG]

" Tabularize --------------
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Show syntax highlighting groups for word under cursor
" By VimCasts
nmap <leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" closetag
let b:closetag_html_style = 1
let b:unaryTagsStack = ''

" NERDTree
:noremap <Leader>n :NERDTreeToggle<CR>
:noremap <Leader>N :NERDTreeFind<CR>
let NERDTreeHijackNetrw=0 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything
let NERDCreateDefaultMappings=0 " I turn this off to make it simple
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1  " Show hidden files
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1  " minimal ui
let NERDTreeAutoDeleteBuffer = 1  " auto delete buffer of file deleted
let NERDTreeIgnore = ['\.DS_Store']   " ignore index files
let g:NERDTreeQuitOnOpen=1 " close nerdtree when open file

set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font:h11

" fugitive
map <Leader>ggs :Gstatus<CR>
map <Leader>ggc :Gcommit<CR>
map <Leader>ggb :Gblame<CR>
" add the current file to commit
map <Leader>gga :Gwrite<CR>
map <Leader>ggd :Gdiff<CR>

" railsvim
map <Leader>ra :AS<CR>
map <Leader>rs :RS<CR>

" space-r runs current spec file
map <Leader>r :TestFile<CR>
"space-s runs nearest spec
map <Leader>s :TestNearest<CR>
" space-a runs all specs
map <Leader>a :TestSuite<CR>

let test#strategy = "basic" " execute test commands in a split window

" open files extra files in hidden buffers
let g:ctrlp_open_multiple_files = '1jr'
" fzf
" remap fuzzy finder to ctrl-t
nnoremap <leader>o :Files<CR>

let g:fzf_layout = { 'down': '40%' }

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
endif

" Switch
nnoremap - :Switch<cr>

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gotham256'

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Better whitespace
autocmd BufWritePre * StripWhitespace

" autocomplete
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

" Ale ------------------
let g:ale_fixers = {
 \   'go': ['gofmt'],
 \   'javascript': ['eslint', 'prettier'],
 \   'ruby': ['rubocop'],
 \   'vue': ['prettier'],
 \   'yaml': ['prettier']
 \}

let g:ale_linters = {
 \   'go': ['golint'],
 \   'javascript': ['eslint', 'prettier'],
 \   'erb': ['erb'],
 \   'ruby': ['rubocop', 'sorbet', 'brakeman', 'rails_best_practices']
 \}

" Bind Leader to fixing problems with ALE
nmap <Leader>\ <Plug>(ale_fix)
" vim-gitgutter --------------------
set updatetime=100

"vim-surround ----------------------
let b:surround_{char2nr('=')} = "<%= \r %>"                       " `ctrl-s =` to insert print erb
let b:surround_{char2nr('-')} = "<% \r %>"                              " `ctrl-s -` to insert erb
"---------------- closetag -----------------------------------------------------------------------
let g:closetag_filenames = "*.html.erb,*.html"                  " tag completion for erb files too
"---------------- vim-auto-save ------------------------------------------------------------------
let g:auto_save = 1                                               " enable AutoSave on Vim startup
"---------------- indentLine ---------------------------------------------------------------------
let g:indentLine_color_term = 239                                  " indentation lines more subtleS

" Tagbar ------------
"  the F8 key will toggle the Tagbar window
nmap <F8> :TagbarToggle<CR>

" Lightline -------------------
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'filetype', 'fileencoding'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok'
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left'
      \ }
      \}

let g:lightline#ale#indicator_checking = "\uf110"                " indicator icons
let g:lightline#ale#indicator_warnings = "\uf071  "              " whitespace intentional
let g:lightline#ale#indicator_errors = "\uf05e    "              " whitespace intentional
let g:lightline#ale#indicator_ok = "\uf00c"

" terminal
noremap <leader>tv :botright vnew <Bar> :terminal<cr>
noremap <leader>th :botright new <Bar> :terminal<cr>
" Terminal exit mapping
" :tnoremap <Esc> <C-\><C-n>
" Open terminal mapping

" :imap ii <Esc>
