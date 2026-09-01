" vimrc configuration file
" Maintainer:  asccigcc
" Created:     December 23, 2016
" Last update: August 30, 2026
" Version:     0.4.0
"
" IMPORTANT: Vim has no trailing-comment syntax after :map commands --
" everything to end of line becomes part of the mapping's RHS. Every
" comment below therefore sits on its own line ABOVE the mapping.
"
" Sections:
"   -> Package Manager        [PKG]
"   -> General                [GEN]
"   -> Vim UI                 [VUI]
"   -> Editing                [EDT]
"   -> Files                  [FIL]
"   -> Keymaps                [KEY]
"   -> Plugin Settings        [PUG]
"   -> Claude Code           [CLD]

" -------------------- [PKG]

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!mkdir -p ~/.vim/autoload'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" --------------------- Navigation
Plug 'preservim/nerdtree'
" Only the vim plugin is managed here. The fzf binary and its base plugin
" (which defines fzf#run) come from Homebrew via the 'rtp+=' below -- the
" 'junegunn/fzf' Plug installed a second copy under ~/.fzf, free to drift out
" of sync, and its './install --all' hook rewrites your shell rc files.
Plug 'junegunn/fzf.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'ervandew/supertab'

" --------------------- Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 't9md/vim-ruby-xmpfilter'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
" rainbow_parentheses.vim was last touched in 2013 and hung three
" 'autocmd Syntax *' handlers off every buffer. This is the maintained
" equivalent and hooks in once.
Plug 'luochen1990/rainbow'
" Normal-mode verbs and text objects. All pure vimscript, ~1ms each.
" splitjoin:  gS / gJ, one-line <-> multiline (ruby hashes, do/end, go structs)
" targets:    ci, da( cin) -- operate on the *next* delimited region
" unimpaired: ]q [q quickfix (ALE + vim-test land there), ]b, yo* toggles
" abolish:    crs crc crm cru case coercion, :S case-preserving substitute
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

" --------------------- Syntax
Plug 'tpope/vim-rails'
Plug 'sheerun/vim-polyglot'

" --------------------- Helpers
Plug 'janko-m/vim-test'
Plug 'killphi/vim-ruby-refactoring'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" --------------------- Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --------------------- Colors
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'baeuml/summerfruit256.vim'

call plug#end()

" matchit ships with Vim -- the standalone plugin was redundant.
packadd! matchit

" Force vim-repeat's autoload now, so <Plug>(RepeatDot) exists before the
" <Space> mapping below is ever pressed. repeat#invalidate() is what pulls the
" autoload in, but its body is 'autocmd! repeat_custom_motion' and vim-repeat
" only creates that group lazily inside repeat#set() -- so on a fresh start it
" raised E216 into v:errmsg, silenced but still set. Declaring the group first
" makes the call clean.
augroup repeat_custom_motion
  autocmd!
augroup END
silent! call repeat#invalidate()

" -------------------- [GEN]

set nocompatible
set encoding=utf-8
set laststatus=2
set hidden
set autoread
set history=1000
set undolevels=1000
set lazyredraw

" 24-bit colour. Inside tmux, Vim needs these two escapes spelled out
" before termguicolors takes effect -- without it everything degrades to
" 256 colours no matter what the terminal supports.
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" -------------------- [VUI]

syntax enable
colorscheme onedark

" Re-apply after any :colorscheme so these survive a theme switch.
augroup vimrc_colors
  autocmd!
  autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
augroup END
highlight Normal guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE

set showcmd
set ruler
set cmdheight=1
set showmode

" 'belloff=all' is the only one of these that silences everything. The old
" trio did not: 't_vb=' is dead unless 'visualbell' is on (it was not), and
" 'noerrorbells' only covers bells attached to error messages -- so Vim still
" beeped on things like a failed search or Esc in normal mode.
set belloff=all

" 'equalalways' was already Vim's default.
set splitbelow splitright

set cursorline
set nocursorcolumn

" -------------------- [EDT]

set number relativenumber
set numberwidth=3

set wildmenu
set wildignore=*~,*.swp

" 128 was low enough to strip colour from ordinary long lines.
set synmaxcol=200
syntax sync minlines=256

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

" Interaction
set timeoutlen=1000 ttimeoutlen=0
set mouse=a
set updatetime=100
set clipboard=unnamed

" Indentation: 2 spaces, no tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent

set signcolumn=yes

set wrap
set linebreak
set backspace=indent,eol,start
set modelines=1

set matchpairs+=<:>
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

" fzf lives under /opt/homebrew on Apple Silicon, /usr/local on Intel.
if isdirectory('/opt/homebrew/opt/fzf')
  set rtp+=/opt/homebrew/opt/fzf
elseif isdirectory('/usr/local/opt/fzf')
  set rtp+=/usr/local/opt/fzf
endif

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" -------------------- [FIL]

set nobackup
set nowritebackup
set noswapfile

" Persistent undo -- undolevels alone is lost when the file closes.
if has('persistent_undo')
  let s:undodir = expand('~/.vim/undo')
  if !isdirectory(s:undodir)
    call mkdir(s:undodir, 'p', 0700)
  endif
  let &undodir = s:undodir
  set undofile
endif

" blowfish is cryptographically broken; blowfish2 is the supported one.
set cryptmethod=blowfish2

filetype plugin indent on
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" The old omnifunc block was removed: Vim's own ftplugins already set
" html/css/javascript/php/ruby/python correctly, while hamlcomplete,
" yamlcomplete and sasscomplete do not exist in Vim 9 and the python
" line downgraded completion to the Python 2 implementation.

let ruby_fold = 1

augroup vimrc_filetypes
  autocmd!
  autocmd FileType text,asciidoc setlocal textwidth=80
  autocmd FileType make setlocal noexpandtab
  autocmd BufRead,BufNewFile *.sass setfiletype sass
  " Folds are computed but start open, replacing an autocmd that ran zR.
  autocmd FileType ruby setlocal foldlevel=99
  " vim-surround ERB wrappers must be buffer-local, so they belong here
  " rather than at global scope where they only hit the first buffer.
  autocmd FileType eruby let b:surround_{char2nr('=')} = "<%= \r %>"
  autocmd FileType eruby let b:surround_{char2nr('-')} = "<% \r %>"
augroup END

" -------------------- [KEY]

let mapleader = ","

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" '.' is easier to reach than ':', so they are swapped. Repeat moves to
" <Space>, routed through <Plug>(RepeatDot) for two reasons: it picks up
" plugin repeats from vim-surround/commentary, and satisfying
" hasmapto() stops vim-repeat from silently reclaiming '.' the first
" time any tpope plugin calls repeat#set().
nnoremap . :
nmap <Space> <Plug>(RepeatDot)

" Fast vertical motion. J/K's originals are restored below.
nnoremap J 5j
nnoremap K 5k
xnoremap J 5j
xnoremap K 5k

" Join lines and keyword lookup, displaced by the J/K maps above.
nnoremap <Leader>J J
nnoremap <Leader>K K

" Open a blank line without leaving normal mode. This used to live on
" o/O directly, which made them unusable for ordinary insertion and
" broke the debugger mappings below. <Leader>o belongs to fzf :Files,
" so these use the vim-unimpaired convention instead.
nnoremap ]<Space> o<Esc>
nnoremap [<Space> O<Esc>

" Clear search highlight
nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap \\ :nohlsearch<CR>

" Ruby / JS debugger insertion
nnoremap <Leader>bp orequire 'pry'; binding.pry<Esc>^
nnoremap <Leader>db odebugger;<Esc>^

" Bundler
nnoremap <Leader>bi :!bundle install<CR>

" Buffers
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bm :bprevious<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bf :Buffers<CR>

" Tabs
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>

" Write / quit everything
nnoremap <Leader>ww :wall!<CR>
nnoremap <Leader>wq :wqall!<CR>
nnoremap <Leader>qq :qall!<CR>

" -------------------- [PUG]

" Tabularize. Moved off <Leader>a= / <Leader>a: because <Leader>a is
" TestSuite, which forced a timeoutlen wait on every alignment.
nnoremap <Leader>= :Tabularize /=<CR>
xnoremap <Leader>= :Tabularize /=<CR>
nnoremap <Leader>: :Tabularize /:\zs<CR>
xnoremap <Leader>: :Tabularize /:\zs<CR>

" Show the syntax groups under the cursor. Was on <Leader>s, which
" TestNearest shadowed completely.
function! s:SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
nnoremap <Leader>? :call <SID>SynStack()<CR>

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>N :NERDTreeFind<CR>
let NERDTreeHijackNetrw = 0
let NERDTreeMouseMode = 1
let NERDCreateDefaultMappings = 0
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden = 1
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.DS_Store']

set guifont=DroidSansMono\ Nerd\ Font:h11

" Fugitive. :Gstatus/:Gcommit/:Gblame were renamed in fugitive 3.
nnoremap <Leader>ggs :Git<CR>
nnoremap <Leader>ggc :Git commit<CR>
nnoremap <Leader>ggb :Git blame<CR>
nnoremap <Leader>gga :Gwrite<CR>
nnoremap <Leader>ggd :Gdiffsplit<CR>

" vim-rails alternate/related. Moved off <Leader>ra / <Leader>rs, which
" <Leader>r (TestFile) delayed by a full timeoutlen.
nnoremap <Leader>A :A<CR>
nnoremap <Leader>R :R<CR>

" vim-ruby-refactoring claimed the whole <Leader>r namespace (,rap ,rapn ,rit
" ,rel ,relv ,rcpc ,riv), which made <Leader>r below -- TestFile, the most
" pressed key here -- sit through a full timeoutlen before firing. Its :R*
" commands (:RExtractLet, :RInlineTemp, ...) still work; only the maps are off.
let g:ruby_refactoring_map_keys = 0

" vim-test
nnoremap <Leader>r :TestFile<CR>
nnoremap <Leader>s :TestNearest<CR>
nnoremap <Leader>a :TestSuite<CR>
let test#strategy = "vimterminal"
let g:test#vimterminal#term_position = "botright"

" fzf
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>F :Rg <C-R><C-W><CR>
let g:fzf_layout = { 'down': '40%' }

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme = 'minimalist'

" Rainbow parentheses. :RainbowToggle turns it off per buffer.
let g:rainbow_active = 1

" GitGutter. It reads git asynchronously, so the cost is off the main loop.
let g:gitgutter_map_keys = 0
nnoremap <Leader>hs :GitGutterStageHunk<CR>
nnoremap <Leader>hu :GitGutterUndoHunk<CR>
nnoremap <Leader>hp :GitGutterPreviewHunk<CR>
" ]h / [h rather than GitGutter's default ]c / [c: those two are Vim's builtin
" next/prev-change in diff mode, and <Leader>ggd above opens :Gdiffsplit --
" taking them broke diff navigation exactly where diffs get used. 'h' also
" matches the <Leader>h* hunk maps above.
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" splitjoin takes gJ by default, which shadows the built-in join-without-space.
" gJ stays vim's; splitjoin's join moves next to its split on gS.
let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''
nnoremap gS :SplitjoinSplit<CR>
nnoremap gK :SplitjoinJoin<CR>

" Better whitespace. vim-trimmer was removed -- both stripped on save.
"
" The plugin's own save hook, not a 'BufWritePre * StripWhitespace'. The
" command strips unconditionally; the hook honours
" better_whitespace_filetypes_blacklist (diff, git, gitcommit, markdown, help,
" qf, fugitive). That distinction matters: stripping markdown silently deletes
" two-space hard line breaks, and stripping gitcommit rewrites the message
" buffer git handed you.
let g:strip_whitespace_on_save = 1
" The hook asks for confirmation by default, which the old autocmd never did.
let g:strip_whitespace_confirm = 0

" ALE. Syntastic was removed: running two linting frameworks at once
" double-linted every buffer and cost ~16ms of startup.
"
" Timing matters more than the linter list here. The default lints on every
" keystroke, and brakeman -- the one heavy tool that was actually installed --
" scans the whole project at ~1s a run. Insert-leave plus save is the cadence
" that gives the same answers without the drag.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

" Only linters named below run. Without this ALE also runs everything it can
" autodetect, which is how brakeman and friends creep back in.
let g:ale_linters_explicit = 1

" rubocop 1.31+ keeps a resident server, so each lint skips the ~1s of booting
" rubocop itself. This is what makes lint-on-save feel immediate.
let g:ale_ruby_rubocop_options = '--server'

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_fixers = {
 \   'go': ['goimports'],
 \   'python': ['ruff_format', 'ruff'],
 \   'sh': ['shfmt'],
 \   'ruby': ['rubocop'],
 \   'javascript': ['prettier'],
 \   'vue': ['prettier'],
 \   'json': ['prettier'],
 \   'yaml': ['prettier']
 \}

" rubocop's autocorrect is style-opinionated and project-dependent -- letting
" it rewrite on every save turns one-line edits into large diffs on any repo
" whose .rubocop.yml disagrees with yours. It stays on <Leader>\, deliberate.
" gofmt/ruff/shfmt/prettier are canonical formatters, so those do run on save.
let g:ale_fix_on_save_ignore = { 'ruby': ['rubocop'] }

" 'erb' was never a filetype -- .html.erb detects as 'eruby', so that entry
" never fired. 'prettier' was listed as a linter, but it is a fixer and ALE
" ignored it. golint was archived by the Go team in 2021; gopls replaces it
" and starts lazily per Go buffer, so it costs nothing at startup.
let g:ale_linters = {
 \   'go': ['gopls', 'govet'],
 \   'python': ['ruff'],
 \   'sh': ['shellcheck'],
 \   'ruby': ['rubocop'],
 \   'eruby': ['erb'],
 \   'slim': ['slimlint'],
 \   'yaml': ['yamllint'],
 \   'javascript': ['eslint']
 \}

nmap <Leader>\ <Plug>(ale_fix)

" ALE populates the location list; these walk it. (]q / [q from unimpaired
" walk the quickfix list, which is where vim-test puts failures.)
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)
" On <Leader>e, not <Leader>ad: any <Leader>a? mapping makes <Leader>a
" (TestSuite) wait out timeoutlen, since it is then only a prefix.
nnoremap <Leader>e :ALEDetail<CR>

" brakeman is a project-wide security scan, not a buffer linter -- wrong shape
" for ALE, which is why it cost a second per keystroke. On demand instead.
nnoremap <Leader>bs :botright new <Bar> terminal brakeman -q --no-progress<CR>

" Terminal splits
nnoremap <Leader>tv :botright vnew <Bar> terminal<CR>
nnoremap <Leader>th :botright new <Bar> terminal<CR>

" -------------------- [CLD]

" Claude edits files on disk, outside Vim. 'autoread' alone never notices:
" it only re-checks on a handful of events, so a buffer you are looking at
" goes stale and the next :w silently overwrites what Claude just wrote.
" checktime forces the check. Skipped in command-line/terminal modes, where
" reloading a buffer underneath you is disruptive rather than helpful.
augroup vimrc_autoread
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold *
        \ if mode() !~# '[crt!]' && empty(getcmdwintype()) | silent! checktime | endif
  autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo 'Buffer reloaded -- file changed on disk' | echohl None
augroup END

" Root Claude at the repo, not the file's directory, so it picks up CLAUDE.md
" and can see the whole tree.
" FugitiveWorkTree() rather than finddir('.git', ...): in a git worktree or a
" submodule '.git' is a *file*, so finddir found nothing and the root fell back
" to the cwd -- pointing Claude at whatever directory Vim happened to start in.
" Fugitive is already loaded and handles all three layouts.
function! s:ClaudeRoot() abort
  let l:root = exists('*FugitiveWorkTree') ? FugitiveWorkTree() : ''
  return empty(l:root) ? getcwd() : l:root
endfunction

" a:args is a List of argv entries, and term_start() takes a List for a reason:
" ':terminal' splits its command on whitespace and never goes through a shell,
" so shellescape() was actively wrong here -- it passed the literal quotes
" through as text. A question came out as [ 'what | is | this | @file.rb' ],
" leaving a stray apostrophe glued to the path so the @-reference never
" resolved. A List hands each argument over verbatim, no quoting involved.
function! s:ClaudeTerm(args) abort
  botright vertical call term_start(['claude'] + a:args, { 'cwd': s:ClaudeRoot() })
endfunction

" Compose the question in Vim -- where you have your own editing keys -- then
" hand it over with an @-reference so Claude reads the file itself. Piping the
" buffer text through the shell would fight quoting to no benefit, and Claude
" resolves @paths against the repo root anyway.
function! s:ClaudeAsk(ref) abort
  if empty(expand('%:.'))
    echohl WarningMsg | echo 'No file in this buffer' | echohl None
    return
  endif
  let l:q = input('claude ' . a:ref . ' > ')
  redraw
  if empty(l:q)
    return
  endif
  " One argv entry -- claude takes the whole prompt as a single argument.
  call s:ClaudeTerm([l:q . ' ' . a:ref])
endfunction

" Bare session, and resume the last one in this directory.
nnoremap <Leader>cc :call <SID>ClaudeTerm([])<CR>
nnoremap <Leader>cr :call <SID>ClaudeTerm(['--continue'])<CR>

" Ask about the current file, or about the visual selection by line range.
nnoremap <Leader>ca :call <SID>ClaudeAsk('@' . expand('%:.'))<CR>
xnoremap <Leader>ca :<C-u>call <SID>ClaudeAsk('@' . expand('%:.')
      \ . ' (lines ' . line("'<") . '-' . line("'>") . ')')<CR>
