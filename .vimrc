" vimrc configuration file
" Maintainer: asccigcc
" Created: December 23, 2016
" Last update: December 23, 2016
" Version: 0.0.1
" Sections:
" 	-> General 			[GEN]
"	-> Package Manager 		[PKG]
"	-> Vim UI 			[VUI]
"	-> Files			[FIL]
"	-> Editing			[EDT]
"    	-> Helpers                    	[HLP]
"    	-> Autocmds and lang specific 	[AUL]
"    	-> Keymaps                    	[KEY]
"    	-> Plugin Keymaps             	[PKM]
"    	-> Plugin configuration       	[PCF]
" References:
"	-> ggalindez 	 [https://github.com/ggalindezb/Dot-Files/blob/master/vimrc]
"    	-> Amix vimrc    [http://amix.dk/vim/vimrc.html]
"    	-> VimCasts      [http://vimcasts.org]
"    	-> Gary Berhardt [https://github.com/garybernhardt/dotfiles/blob/master/.vimrc]
"    	-> Andrew Radev  [http://andrewradev.com]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General [GEN]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings
set nocompatible
set laststatus=2
set encoding=utf-8
set hidden

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

" Dependencies
Plug 'tomtom/tlib_vim', {'for': 'asciidoc'}           " tlib - for vim-asciidoc
Plug 'dahu/Asif', {'for': 'asciidoc'}                 " asif - for vim-asciidoc
Plug 'vim-scripts/SyntaxRange', {'for': 'asciidoc'}   " SyntaxRange - for vim-asciidoc
Plug 'tpope/vim-markdown', {'for': 'markdown'}        " vim-markdown - Highlighting and filetype
Plug 'vim-scripts/ReloadScript'                       " ReloadScript - Guard for file changes

" Vim interface extensions
Plug 'fholgado/minibufexpl.vim'                       " Elegant buffer explorer
Plug 'tpope/vim-fugitive'                             " Git wrapper so awesome, it should be illegal
Plug 'airblade/vim-gitgutter'                         " Git diff in the gutter
Plug 'bling/vim-airline'                              " Lean and mean status/tabline
Plug 'vim-airline/vim-airline-themes'                 " Collection of themes for airline
Plug 'ntpeters/vim-better-whitespace'                 " Highlight trailing whitespace
" Plug 'scrooloose/syntastic'                         " Syntax checking hacks
" Plug 'sjl/gundo.vim'				      " Gundo visualize vim undo into a tree
Plug 'vim-scripts/taglist.vim'			      " Taglist visualize methods and class in a tree

" Key snippets
Plug 'vim-scripts/VisIncr'    			      " VisIncr Increment numbers and dates
" Plug 'vim-scripts/L9'				      " L9 provides some utility functions 

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
Plug 'tpope/vim-endwise.git'			      " End close in ruby
Plug 'ap/vim-css-color.git'                           " Preview colours in css file
Plug 'alvan/vim-closetag'			      " Closetag HTML close tags
Plug 'killphi/vim-ruby-refactoring'		      " Vim support for refactor code


" Completion
Plug 'mattn/emmet-vim', {'for': 'html'}               " Emmet expanding abbreviations
" Plug 'Valloric/YouCompleteMe'                       " Code-completion engine for Vim
" Plug 'SirVer/ultisnips'                             " Ultimate snippet solution for Vim
" Plug 'honza/vim-snippets'                           " Default snippets
" Plug 'ervandew/supertab'                            " Insert mode completions with Tab

" Filetype
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

" Colorschemes
Plug 'altercation/vim-colors-solarized'		      " Port of solarized 
Plug 'whatyouhide/vim-gotham'                         " Code never sleeps in Gotham City
Plug 'tomasr/molokai'                                 " Port of monokai
Plug 'joshdick/onedark.vim'                           " Port of onedark
Plug 'sjl/badwolf'                                    " Woof Woof

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim UI [VUI]
"  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing position aid
set number
set numberwidth=3
set cursorline

" Vim command line
set wildmenu                    " Autocomplete in cmd
set wildignore=*~,*.swp         " Ignore temp files
set showcmd                     " Show partial cmd
set cmdheight=1                 " Short cmd line

" Search options
set smartcase                   " Ignore casing unless search a cased word
set hlsearch                    " Highlight matches
set incsearch		                " Real time match
set magic                       " Parse regex in search

" Interface improvments
set novisualbell                " Disable flashes
set t_vb=                       " No visual bell
set noerrorbells                " Fuck bells!
set lazyredraw                  " Don't redraw while executing macros

syntax on                       " Syntax highlight
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
set t_Co=256                    " 256 color term

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Files [FIL]
"  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't write anything but the file
set nobackup
set nowb
set noswapfile

" Blowfish encryption
setlocal cryptmethod=blowfish

" Filetypes
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing [EDT]
"  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 2-space tabs, standard
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Use spaces for tabs
set expandtab
set smarttab

" Indent
set autoindent
set smartindent

" Break long lines, per word, 80 chars per line
set wrap
set linebreak

" Allow backspacing over everything
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Helpers [HLP]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show syntax highlighting groups for word under cursor
" By VimCasts
nmap <leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,
	"name")')
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Autocmds and lang specific [AUL]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd!

" Set [...] to 2-space indent
autocmd WinEnter,FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber
set sts=2 ts=2 sw=2

" Text -> Git, Asciidoc
autocmd FileType text setlocal textwidth=80
autocmd FileType asciidoc setlocal textwidth=80

" Set SASS to SASS. Duh
autocmd! BufRead,BufNewFile *.sass setfiletype sass

" Set F# lex to F#
autocmd! BufRead,BufNewFile *.fsl setfiletype fsharp
autocmd! BufRead,BufNewFile *.fsy setfiletype fsharp

" Don't change tabs for spaces in Makefiles
autocmd FileType make setlocal noexpandtab

" Delete trailing white space on sav
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.txt :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Keymaps [KEY]
"  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""
" Vim keymaps
""""""""""""""
" Use spacebar to repeat last command
nore <Space> .
" Use . as :
nore . :
let mapleader = ","

" Paste from the clipboard without indenting
set pastetoggle=<Leader>p

" Navigation keymaps
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Buffer keymaps
map <Leader>bn :bnext<cr>
map <Leader>bN :bprevious<cr>
map <Leader>bd :bdelete<cr>

" Window keymaps
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab keymaps
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" Dismiss search highlight
nmap <Leader><Space> :nohl<cr>

" Giga save. Handle with care
nmap <leader>ww :wall!<cr>
nmap <leader>wq :wqall!<cr>
nmap <leader>qq :qall!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Plugin keymaps [PKM]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""
" Commentary keymaps
""""""""""""""""""""
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
nmap <Leader>cu <Plug>CommentaryUndo

"""""""""
" Switch
"""""""""
nnoremap - :Switch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Plugin configuration [PCF]
"  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""
" CtrlP
" """"""""""
" " When opening multiple files, open them in the background
" let g:ctrlp_open_multiple_files = 'i'
"
" """"""""""""
" " Airline
" """"""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

"""""""""""""""""""""""
" Rainbow Parentheses
"""""""""""""""""""""""
" This can probably be configured in the colorscheme. Makes more sense
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3']]

au VimEnter *
RainbowParenthesesToggle
au Syntax *
RainbowParenthesesLoadRound
au Syntax *
RainbowParenthesesLoadSquare
au Syntax *
RainbowParenthesesLoadBraces
""""""""""""
" Syntastic
""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
