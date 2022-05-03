

" ===================================================================
" Basic settings that need to be done early.
" ===================================================================
set nocompatible              " Eliminate vi backwards-compatability
set numberwidth=4             " The width of the number column
set number                    " Enable line numbers
filetype plugin on            " required!
filetype indent on            " required!
syntax on                     " Syntax highlighting

let g:python3_host_prog = '/usr/bin/python3'
let g:python2_host_prog = '/usr/bin/python2'

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase


" change fillchars for folding, vertical split, end of buffer, and message separator
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

" Paste mode toggle, it seems that Nvim's bracketed paste mode
" does not work very well for nvim-qt, so we use good-old paste mode
set pastetoggle=<F12>

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
endif


" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

" " File and script encoding settings for vim
" set fileencoding=utf-8
" set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" Micrimum lines to keep above and below cursor when scrolling
set scrolloff=5

" Use mouse to select and resize windows, etc.
set mouse=nic  " Enable mouse in several mode
set mousemodel=popup  " Set the behaviour of mouse

set noshowmode
" Ask for confirmation when handling unsaved or read-only files
set confirm

" set visualbell noerrorbells  " Do not use visual and errorbells
" set history=500  " The number of command and search history to keep

" Auto-write the file based on some condition
" set autowrite

" Show hostname, full path of file and last-mod time on the window title. The
" meaning of the format str for strftime can be found in
" http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
" lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
set title
set titlestring=
set titlestring=%{utils#Get_titlestr()}

" Persistent undo even after you close a file and re-open it
" set undofile

" Do not show "match xx of xx" and other messages during auto-completion
" set shortmess+=c

" Do not show search match count on bottom right (seriously, I would strain my
" neck looking at it). Using plugins like vim-anzu or nvim-hlslens is a better
" choice, IMHO.
" set shortmess+=S

set pumheight=10  " Maximum number of items to show in popup menu
set pumblend=10  " pseudo transparency for completion menu

set winblend=5  " pseudo transparency for floating window

" Insert mode key word completion setting
set complete+=kspell complete-=w complete-=b complete-=u complete-=t

set spelllang=en,cjk  " Spell languages
set spellsuggest+=9  " show 9 spell suggestions at most

" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround

set virtualedit=block  " Virtual edit is useful for visual block edit

" Correctly break multi-byte characters such as CJK,
" see https://stackoverflow.com/q/32669814/6064933
set formatoptions+=mM

" Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
set tildeop

" External program to use for grep command
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

set signcolumn=auto:2

" " Remove certain character from file name pattern matching
" set isfname-==
" set isfname-=,

" diff options
set diffopt=
set diffopt+=vertical  " show diff in vertical position
set diffopt+=filler  " show filler for deleted lines
set diffopt+=closeoff  " turn off diff when one file window is closed
set diffopt+=context:3  " context for diff
set diffopt+=internal,indent-heuristic,algorithm:histogram

"--------------------------------------------------------------------
" Settings: General Setting Options
"--------------------------------------------------------------------
set autoread                              " Automatically read a file when it is changed from the outside
set backspace        =indent,eol,start    " Allow backspacing over everything in insert mode
set cursorcolumn                          " Show cursor column (initialized here, but turned on and off in autocmd section)
set history          =10000               " Keep 10000 lines of command history
set modelines        =0                   " Prevent some security exploits
set nostartofline                         " Don't jumpt to the first character when paging
set ruler                                 " Show the cursor position all the time
set showmatch                             " Jumps to the matching brace, etc.
set updatetime      =250                  " Update after 1/4 second of no activity (check for external file change, etc.)
if has('shada') " ignore /tmp and /mnt in shada history
  set shada=!,%,'100,<9999,f1,s1000
"set  shada=| %,<8000,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
"           | | |     |   |   |
"           | | |     |   |   |
"           | | |     |   |   |
"           | | |     |   |   + Max size of an item contentsin Kbytes
"           | | |     |   + file marks 0-9,A-Z are stored
"           | | |     + Max lines saved each register
"           | | + files marks saved
"           | + save/restore buffer list
"           + Save/restore global variables that only contain uppercase letters.
"   history is by default for:
"   "/" Max number of files for which marks are remembered
"   ":" Maximum number of items in the command-line history
"   "0" Max number of items in teh input-line history
" endif
" if has('nvim')
    " set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
    " "           | |    |   |   |    | |  + viminfo file path
    " "           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
    " "           | |    |   |   |    + disable 'hlsearch' loading viminfo
    " "           | |    |   |   + command-line history saved
    " "           | |    |   + search history saved
    " "           | |    + files marks saved
    " "           | + lines saved each register (old name for <, vi6.2)
    " "           + save/restore buffer list
else
    set viminfo='100,<50,s10,h,rA:,rB:
endif

" stop loading config if it's on tiny or small
if !1 | finish | endif

set title
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Finding files - Search down into subfolders
set path+=**
"set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

"
" Performance
"
" Vim runs atrociously slow when dealing with long lines.
" The following commands are used to combat this issue.
"
set lazyredraw


"--------------------------------------------------------------------
" Settings: BACKUP, SWAP, UNDO
" The her/central.vim will create the backup, swap, and undo
" directories and set the flag so that all three will be active.
"--------------------------------------------------------------------
set undolevels      =10000               " Entries of the undo list


"--------------------------------------------------------------------
" Settings: CODE COMPLETION
"--------------------------------------------------------------------

" Completion behaviour
" set completeopt+=noinsert  " Auto select the first completion entry
" set completeopt+=menuone  " Show menu even if there is only one item
" set completeopt-=preview  " Disable the preview window

" Old setting
" set completeopt=menu,menuone,noselect


"--------------------------------------------------------------------
" Settings: COLOR
"--------------------------------------------------------------------
" Enable true color support. Do not set this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
set termguicolors

set background=dark
" set t_Co=256                    " Force 256 colors in terminal
set termguicolors               " Use true-colors.

" true color
set winblend=0
"set wildoptions=pum
set pumblend=5

let g:gruvbox_contrast_dark='hard'
" colorscheme ayu
" colorscheme elflord
" colorscheme flattened_dark
" colorscheme goldenrod
" colorscheme gruvbox
" colorscheme molokai
" colorscheme nightflight
" colorscheme nightflight2
colorscheme solarized
" colorscheme solarized8_dark_high
" colorscheme space-vim-dark



"--------------------------------------------------------------------
" Settings: Cursor
" bar:   insert mode
" block: normal mode
"
" Cursor Shapes:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
"--------------------------------------------------------------------
" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
" set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20

if exists('$TMUX')
    let &t_ti = "\ePtmux;\e\e[1 q\e\\"
    let &t_SI = "\ePtmux;\e\e[5 q\e\\"
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"
    let &t_te = "\ePtmux;\e\e[0 q\e\\"
else
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif


"--------------------------------------------------------------------
" Settings: DISPLAY
"--------------------------------------------------------------------
set guioptions=                 " Disable everything in gvim
set icon title                  " Try to change the terminal title
set mouse=a                     " Turn off the mouse: Part 1: set to all
set mouse=                      " Turn off the mouse: Part 2: set to nothing
set scrolloff=5                 " Have 5 lines ahead of the cursor in screen whenever possible
set showcmd                     " Show commands as they are typed, in lower right corner


"--------------------------------------------------------------------
" Settings: FOLD
"
" Comments:
" Adding this to your .vimrc will temporarily disable folding when you open
" the file, but folds can still be restored with zc
"--------------------------------------------------------------------
set nofoldenable
"set foldmethod=syntax          " Note: this can cause performance problems.
"set foldcolumn=5
"set foldlevel=0


"--------------------------------------------------------------------
" Settings: GREP
"--------------------------------------------------------------------
let Grep_Path = '/usr/bin/ag'


"--------------------------------------------------------------------
" Settings: Highlights
"--------------------------------------------------------------------
" Highlight functions and namespaces (simlight plugin)
" highlight Function guifg=#afdfdf ctermfg=152
" highlight Namespace guifg=#a8a8a8 ctermfg=248

" Don't let the colorschemes change the background color:
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

" Color notifications
highlight NotifyGreen  gui=bold guifg=#8dfa81 cterm=bold ctermfg=119
highlight NotifyRed    gui=bold guifg=#e47574 cterm=bold ctermfg=167
highlight NotifyYellow gui=bold guifg=#fffb87 cterm=bold ctermfg=227

" Highlight merge conflict markers
match Todo '\v^(\<|\=|\>){7}([^=].+)?$'

" Give completion menu, some sane colors.
highlight Pmenu guibg=brown gui=bold
highlight Pmenu ctermbg=238 gui=bold

" Better diff colors.
highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green
highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none
highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none
highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none

" Highlight the colors past 80 columns
"set cc=+1  " highlight column after 'textwidth'
"set cc=+1,+2,+3  " highlight three columns after 'textwidth'
"hi ColorColumn ctermbg=darkgrey  guibg=lightgrey
"execute "set colorcolumn=" . join(range(81,335), ',')

" Highlight the following cursor/column/number column.
" Some of this has to be done as an authcmd, since other calls May
" be changing them, that we have no idea when.
" To see all of  the possible attributes, see the following:
"   CursorLine
"   CursorLineNR
"   CursorColumn
"
highlight CursorLineNr term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" highlight clear cursorline
" augroup CLClear
"     set cursorline
"     autocmd! ColorScheme * highlight CursorLineNR cterm=bold ctermbg=DarkGrey ctermfg=Yellow
" augroup End

" highlight CursorLineNR cterm=bold
" augroup CLNRSet
"     set cursorline
"     autocmd! ColorScheme * highlight CursorLineNR cterm=bold ctermbg=DarkGrey ctermfg=Yellow
" augroup END
set cursorline
set cursorlineopt=line,number
autocmd ColorScheme * highlight CursorLine   cterm=bold,reverse
autocmd ColorScheme * highlight CursorLineNr cterm=bold         term=bold gui=bold ctermfg=yellow 

" Highlight the cursor column
set cursorcolumn
highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"highlight CursorColumn ctermfg=Black ctermbg=Yellow cterm=bold guifg=Black guibg=yellow gui=NONE



" Settings: MATCHING
" Syntax: hi MatchParen cterm=STYLE ctermbg=BGCOL ctermfg=FGCOL
" Styles: bold underline none
hi MatchParen cterm=NONE,bold ctermfg=green ctermbg=red       ""Intensify matching parenthesis

" augroup BgHighlight
  " autocmd!
  " autocmd WinEnter * set cul
  " autocmd WinLeave * set nocul
" augroup END

" if &term =~ "screen"
  " autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  " autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
" endif


"--------------------------------------------------------------------
" Settings: INDENTATION
"--------------------------------------------------------------------
set autoindent          " Enable auto indenting on new lines (and be smart about it)
set nocindent           " C-indent only works well on c-style languages, bad for normal text.  Turn it on where needed.
set copyindent          " Copies the indentation from the line above


"--------------------------------------------------------------------
" Settings: INPUT
"--------------------------------------------------------------------
" set clipboard+=unnamedplus   " Use system clipboard as default register (fails)
set clipboard=unnamed,unnamedplus   " Use system clipboard as default register (fails)
set confirm                         " Instead of failing after a missing !, ask what to do
set display+=lastline               " Display as much as possible of a window's last line
set noequalalways                   " Don't resize all remaining splits when opening/closing a split
set nojoinspaces                    " Use only one space after '.' when joining lines, instead of two
set splitright splitbelow           " Put new vertical splits to the right/below of the current one
set virtualedit=onemore,block       " Allow the cursor one beyond last character and everywhere in V-block mode.


set formatoptions+=j            " Handle comments when joining lines


"--------------------------------------------------------------------
" Settings: LISTCHARS
"--------------------------------------------------------------------
"" listchars
"" tab:\|\
"" trail:·
"" precedes:«
"" extends:»
""set listchars=precedes:«,extends:»,tab:\ \ ,trail:·
set list listchars=tab:<->,extends:»,precedes:«,nbsp:␣,trail:·
set list


"--------------------------------------------------------------------
" Settings: SEARCH
"--------------------------------------------------------------------
set hlsearch        " Highlight search
set ignorecase      " Ignore case when searching.
set incsearch       " Incremental search
set nowrapscan      " does not wrap back to the beginning for search.
set smartcase       " Searches ignoring case unless an uppercase is pressed.

" This mapping allows us to press <enter> to search for the current
" token under the cursor without stepping to the next match (like # or *)
" and set the highlight.
" The second incantation does the same thing, except it does not do a word search.
" Fix the one below for FreeBSD
:nnoremap <silent><CR>  :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
":nnoremap <silent><CR>  :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls
:nnoremap <silent><F10> :let @/='<C-R>=expand("<cword>")<CR>'<CR>:set hls<CR>

" Shortcuts: search/replace
" A function is for replacing the current-under-cursor word with
" another pattern/word. Simply, it copies the word under cursor and inserts it
" into a substitution command call. You only need to type the replacement pattern
" and press the Enter key to actually replace the text:
" replace the word under cursor
" Select 's' to search/replace
nmap ; :%s/\<<c-r><c-w>\>//g<left><left>
" nmap ; :%s/\<<c-r><c-w>\>/

" Shortcuts: Substitute
" Setup command to replace current word with last yanked, cut, etc. word.
" Select "S" to replace
nnoremap <silent>S :let @x=@"<CR>"_diw"xP


"--------------------------------------------------------------------
" Settings: TAB
"--------------------------------------------------------------------
set expandtab           " By default, we will expand tabs to spaces, turn this off when needed (i.e. a Makefile)
set nosmarttab          " This is for c-style programs, turn it on when needed.  Causes problems with normal text.
set shiftround          " When at 3 spaces, and hit > ... go to 4, not 7
set shiftwidth=4
set softtabstop=4
set tabstop=4


"--------------------------------------------------------------------
" Timeout
"--------------------------------------------------------------------
"" timeout:      Mappings
"" timeoutlen:   (default:1000ms) Time in milliseconds to a mapped sequence to complete.
"" ttimeout:     Mappings
"" ttimeoutlen:  (default: 50ms) Terminal waits for a keystroke sequence
set timeout
set timeoutlen=250
set ttimeout
set ttimeoutlen=50
set updatetime=500  " For CursorHold events


"--------------------------------------------------------------------
" Settings: WRAP
"--------------------------------------------------------------------
set nowrap
set sidescroll=10



