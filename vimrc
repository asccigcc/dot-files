" Vimrc Configuration File
"
" This config file requires Vim 8.2
"
" Maintainer: asccigcc
" Created: December 23, 2016
" Updated: March 21, 2021
" Version: 0.0.1
" Sections:
" 	-> General 			                [GEN]
"	  -> Package Manager 		          [PKG]
"	  -> Vim UI 			                [VUI]
"	  -> Files			                  [FIL]
"	  -> Editing			                [EDT]
"   -> Helpers                    	[HLP]
"   -> Autocmds and lang specific 	[AUL]
"   -> Keymaps                    	[KEY]
"   -> Plugin Keymaps             	[PKM]
"   -> Plugin configuration       	[PCF]
" References:
"	  -> ggalindez 	   [https://github.com/ggalindezb/Dot-Files/blob/master/vimrc]
"   -> Amix vimrc    [http://amix.dk/vim/vimrc.html]
"   -> VimCasts      [http://vimcasts.org]
"   -> Gary Berhardt [https://github.com/garybernhardt/dotfiles/blob/master/.vimrc]
"   -> Andrew Radev  [http://andrewradev.com]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General [GEN]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings
set nocompatible
set laststatus=2
set encoding=utf-8
set hidden
set visualbell  " no sounds
set gcr=a:blinkon0  " disable cursor blink

" Set to auto read when a file is changed from the outside
set autoread

" Remember stuff
set history=256
set undolevels=512

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Packages [PKG]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install Plug if it's not available
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!mkdir -p ~/.vim/autoload'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" File parsers
Plug 'tpope/vim-markdown', {'for': 'markdown'}        " vim-markdown - Highlighting and filetype
Plug 'vim-scripts/ReloadScript'                       " ReloadScript - Guard for file changes

Plug 'christoomey/vim-tmux-navigator'                             " easy navigation b/w vim & tmux
" Vim interface extensions
Plug 'fholgado/minibufexpl.vim'                       " Elegant buffer explorer
Plug 'tpope/vim-fugitive'                             " Git wrapper so awesome, it should be illegal
Plug 'airblade/vim-gitgutter'                         " Git diff in the gutter
Plug 'bling/vim-airline'                              " Lean and mean status/tabline
Plug 'vim-airline/vim-airline-themes'                 " Collection of themes for airline
Plug 'ntpeters/vim-better-whitespace'                 " Highlight trailing whitespace
Plug 'scrooloose/syntastic'                         " Syntax checking hacks
Plug 'vim-scripts/taglist.vim'			      " Taglist visualize methods and class in a tree
Plug 'jeffkreeftmeijer/vim-numbertoggle'              " Numbertoggle toggle between relative and absolute line numbers
" Plug 'sjl/gundo.vim'				      " Gundo visualize vim undo into a tree

" Snippets
Plug 'vim-scripts/VisIncr'    			      " VisIncr Increment numbers and dates
Plug 'vim-scripts/L9'				      " L9 provides some utility functions

" File/Buffer searching
Plug 'kien/ctrlp.vim'                                 " Fuzzy file/buffer finder
Plug 'vim-scripts/FuzzyFinder'			      " Fuzzy finder
Plug 'mileszs/ack.vim'                                " Wrapper for ack, beyond grep
Plug 'scrooloose/nerdtree'			      " Nerdtree file navigator
Plug 'vim-scripts/SearchComplete'		      " SearchComplete autocomplete

" Motion
Plug 'tmhedberg/matchit'                              " Extended % matching
" Plug 'Lokaltog/vim-easymotion'                      " Vim motions on speed!
" Plug 'justinmk/vim-sneak'                           " The missing motion for Vim
" Plug 'tpope/vim-repeat'                             " Repeating supported plugin maps

" Text wrangling
Plug 'tpope/vim-commentary'                           " Comment stuff out
Plug 'godlygeek/tabular'                              " Text filtering and alignment
Plug 'kien/rainbow_parentheses.vim'                   " Better Rainbow Parentheses
Plug 'tpope/vim-surround'                             " Quoting/parenthesizing made simple
Plug 'ap/vim-css-color'                           " Preview colours in css file
Plug 'alvan/vim-closetag'			      " Closetag HTML close tags
Plug 'killphi/vim-ruby-refactoring'		      " Vim support for refactor code
Plug 'ryanoasis/vim-devicons'               " Add dev icons to vim
Plug 'derekprior/vim-trimmer'                                            " trim whitespace on save
Plug 'noprompt/vim-yardoc'                                                         " yardoc syntax


" Completion
Plug 'mattn/emmet-vim', {'for': 'html'}               " Emmet expanding abbreviations
" Plug 'Valloric/YouCompleteMe'                       " Code-completion engine for Vim
" Plug 'SirVer/ultisnips'                             " Ultimate snippet solution for Vim
" Plug 'honza/vim-snippets'                           " Default snippets
Plug 'ervandew/supertab'                            " Insert mode completions with Tab
Plug 'wesQ3/vim-windowswap'                                                  " swap windows around

" Filetype
Plug 'w0rp/ale'                                      " syntax checking and live RuboCop violations
Plug 'maximbaz/lightline-ale'                                        " ALE indicator for lightline
Plug 'vim-ruby/vim-ruby'                              " Vim support for Ruby
Plug 'tpope/vim-rails'                                " Vim support for Rails
Plug 'tpope/vim-bundler'			      " Vim support for Bundler
Plug 'thoughtbot/vim-rspec'			      " Vim support for RSpec
Plug 'pangloss/vim-javascript', {'for': 'javascript'} " Vim support for Javascript
Plug 'elzr/vim-json'				      " Vim support for JSON
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}    " Vim support for Coffeescript
Plug 'othree/html5.vim', {'for': 'html'}              " Vim support for HTML5
Plug 'slim-template/vim-slim', {'for': 'slim'}        " Vim support for Slim
Plug 'tpope/vim-haml', {'for': 'haml'}                " Vim support for HAML/SASS
Plug 'plasticboy/vim-markdown', {'for': 'mkd'}        " Vim support for Markdown
Plug 'digitaltoad/vim-jade'			      " Vim supoort for Jade
Plug 'tpope/vim-dispatch'                                               " run rspec specs from vim
Plug 't9md/vim-ruby-xmpfilter'                                            " inline ruby completion
Plug 'tpope/vim-endwise'                              " auto end addition in ruby

" Colorschemes
Plug 'altercation/vim-colors-solarized'		            " Port of solarized
Plug 'whatyouhide/vim-gotham'                         " Code never sleeps in Gotham City
Plug 'tomasr/molokai'                                 " Port of monokai
Plug 'joshdick/onedark.vim'                           " Port of onedark
Plug 'sjl/badwolf'                                    " Woof Woof
Plug 'morhetz/gruvbox'                                " Retro groove color scheme for Vim
Plug 'itchyny/lightline.vim'                          " minimalist status bar
Plug 'ryanoasis/vim-devicons'                         " icons

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim UI [VUI]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load color schema
let g:solarized_termcolors=256
syntax on
syntax enable                         " Syntax highlight
set background=dark
colorscheme solarized
set t_Co=256                          " 256 color term
hi Normal guibg=NONE ctermbg=NONE     " Set transparent background

" Editing position aid
set number relativenumber
set numberwidth=3
set cursorline

" Vim command line
set wildmenu                    " Autocomplete in cmd
set wildignore=*~,*.swp         " Ignore temp files
set showcmd                     " Show partial cmd
set cmdheight=1                 " Short cmd line
set showmode                                                   " show current mode down the bottom
set synmaxcol=128                          " no syntax highlighting for lines longer than 128 cols

" Search options
set smartcase                   " Ignore casing unless search a cased word
set hlsearch                    " Highlight matches
set incsearch		                " Real time match
set magic                       " Parse regex in search
set ignorecase                  " Ignore case when searching

" Status Line
set showcmd
set ruler                       " Show ruler
"set ch=2                         " Make command line two lines high

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

" Interaction
set timeoutlen=1000 ttimeoutlen=0         " remove delay from escape key when entering normal mode
set history=1000                                                  " store lots of :cmdline history
set mouse=a                                                        " mouse scrolling in vim splits
set lazyredraw                                                                " speed up scrolling
set regexpengine=1
set clipboard+=unnamedplus                                         " use system clipboard for copy

" Custom commands
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>   " automate clipboard copy/paste indentation
map <Leader>bi :!bundle install<cr>                                        " bundle install in vim
map <Leader>sp :!bundle exec rspec spec<cr> " run bundle exec rspec
nmap <leader>bp orequire 'pry'; binding.pry<esc>^                           " insert ruby debugger

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Files [FIL]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't write anything but the file
set nobackup
set nowb
set noswapfile

" Blowfish encryption
setlocal cryptmethod=blowfish

" Filetypes
filetype plugin indent on

match ErrorMsg '\s\+$'                                             " highlight trailing whitespace

" Sessions - Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing [EDT]
"  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"" Break long lines, per word, 80 chars per line
set wrap
set linebreak

"" Allow backspacing over everything
set backspace=indent,eol,start

nnoremap <C-J> <C-W><C-J>                                         " easy navigation between splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set matchpairs+=<:>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""-> Git [GIT]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType gitcommit set tw=72                       " auto wrap at 72 cols during commit message
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""-> Helpers [HLP]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

"" Show syntax highlighting groups for word under cursor
"" By VimCasts
nmap <leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""-> Autocmds and lang specific [AUL]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" autocmd!
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


"" Set [...] to 2-space indent
" autocmd WinEnter,FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber
set sts=2 ts=2 sw=2

"" " Text -> Git, Asciidoc
autocmd FileType text setlocal textwidth=80
autocmd FileType asciidoc setlocal textwidth=80

"" Set SASS to SASS. Duh
autocmd! BufRead,BufNewFile *.sass setfiletype sass

"" Don't change tabs for spaces in Makefiles
autocmd FileType make setlocal noexpandtab

"" Delete trailing white space on sav
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc

"autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
"autocmd BufWrite *.txt :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" -> Keymaps [KEY]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""
"" Vim keymaps
"""""""""""""""
"" Use spacebar to repeat last command
nore <Space> .
"" Use . as :
nore . :
let mapleader = ","

"" Paste from the clipboard without indenting
set pastetoggle=<Leader>p

"" Navigation keymaps
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

"" Buffer keymaps
map <Leader>bn :bnext<cr>
map <Leader>bm :bprevious<cr>
map <Leader>bd :bdelete<cr>

"" Window keymaps
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

"" Tab keymaps
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

"" Dismiss search highlight
nmap <Leader><Space> :nohl<cr>

"" Giga save. Handle with care
nmap <leader>ww :wall!<cr>
nmap <leader>wq :wqall!<cr>
nmap <leader>qq :qall!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" -> Plugin keymaps [PKM]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""
"" NERDTree
"""""""""""""""""""""
:noremap <Leader>n :NERDTreeToggle<CR>
:noremap <Leader>N :NERDTreeFind<CR>
let NERDTreeHijackNetrw=0 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything
let NERDCreateDefaultMappings=0 " I turn this off to make it simple
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1  " Show hidden files
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1  " minimal ui
let NERDTreeAutoDeleteBuffer = 1  " auto delete buffer of file deleted
let NERDTreeIgnore = ['\.DS_Store']   " ignore index files

"" railsvim
map <Leader>ra :AS<CR>
map <Leader>rs :RS<CR>

"" closetag
let b:closetag_html_style = 1
let b:unaryTagsStack = ''

"" fugitive
map <Leader>ggs :Gstatus<CR>
map <Leader>ggc :Gcommit<CR>
map <Leader>ggb :Gblame<CR>
""add the current file to commit
map <Leader>gga :Gwrite<CR>
map <Leader>ggd :Gdiff<CR>

"" spec vim
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>r :call RunAllSpecs()<CR>

"""""""""""""""""""""
"" Commentary keymaps
"""""""""""""""""""""
"xmap <Leader>c  <Plug>Commentary
"nmap <Leader>c  <Plug>Commentary
"nmap <Leader>cc <Plug>CommentaryLine
"nmap <Leader>cu <Plug>CommentaryUndo

""""""""""
"" Switch
""""""""""
nnoremap - :Switch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" -> Plugin configuration [PCF]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""
"" CtrlP
"""""""""""
"" When opening multiple files, open them in the background
let g:ctrlp_open_multiple_files = 'ijr'
:noremap <Leader>o :CtrlP<CR>

"""""""""""""
"" Airline
"""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

""""""""""""""""""""""""
"" Rainbow Parentheses
""""""""""""""""""""""""
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""
"" Syntastic
"""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"" let g:syntastic_always_populate_loc_list = 1
"" let g:syntastic_auto_loc_list = 0
"" let g:syntastic_check_on_open = 1
"" let g:syntastic_check_on_wq = 0

"" Better whitespace
autocmd BufWritePre * StripWhitespace

"" autocomplete
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

"" closetag
let b:closetag_html_style = 1
let b:unaryTagsStack = ''

""--------------- Ale -----------------------------------------------------------------------------
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

"" " Bind F8 to fixing problems with ALE
nmap <Leader>\ <Plug>(ale_fix)
""---------------- vim-gitgutter ------------------------------------------------------------------
set updatetime=100
""---------------- vim-surround -------------------------------------------------------------------
" set filetype=eruby                                                               " define filetype

let b:surround_{char2nr('=')} = "<%= \r %>"                       " `ctrl-s =` to insert print erb
let b:surround_{char2nr('-')} = "<% \r %>"                              " `ctrl-s -` to insert erb
""---------------- closetag -----------------------------------------------------------------------
 let g:closetag_filenames = "*.html.erb,*.html"                  " tag completion for erb files too
""---------------- vim-auto-save ------------------------------------------------------------------
let g:auto_save = 1                                               " enable AutoSave on Vim startup
""---------------- indentLine ---------------------------------------------------------------------
let g:indentLine_color_term = 239                                  " indentation lines more subtle
