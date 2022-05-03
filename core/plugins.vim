

" Plugin specification and lua stuff
lua require('lua-init')

" Use short names for common plugin manager commands to simplify typing.
" To use these shortcuts: first activate command line with `:`, then input the
" short alias, e.g., `pi`, then press <space>, the alias will be expanded to
" the full command automatically.
call utils#Cabbrev('pi', 'PackerInstall')
call utils#Cabbrev('pud', 'PackerUpdate')
call utils#Cabbrev('pc', 'PackerClean')
call utils#Cabbrev('ps', 'PackerSync')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      configurations for vim script plugin                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""UltiSnips settings"""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger='<c-j>'

" Do not look for SnipMate snippets
let g:UltiSnipsEnableSnipMate = 0

" Shortcut to jump forward and backward in tabstop positions
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Configuration for custom snippets directory, see
" https://jdhao.github.io/2019/04/17/neovim_snippet_s1/ for details.
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'my_snippets']

"""""""""""""""""""""""""" vlime settings """"""""""""""""""""""""""""""""
command! -nargs=0 StartVlime call jobstart(printf("sbcl --load %s/vlime/lisp/start-vlime.lisp", g:package_home))

"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""
" Do not use cache file
let g:Lf_UseCache = 0
" Refresh each time we call leaderf
let g:Lf_UseMemoryCache = 0

" Ignore certain files and directories when searching files
"let g:Lf_WildIgnore = {
"  \ 'dir': ['.git', '__pycache__', '.DS_Store'],
"  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
"  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
"  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
"  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
"  \ '*.mp3', '*.aac']
"  \}

" Do not show fancy icons for Linux server.
if g:is_linux
  let g:Lf_ShowDevIcons = 0
endif

" Only fuzzy-search files names
let g:Lf_DefaultMode = 'FullPath'

" Popup window settings
let w = float2nr(&columns * 0.8)
if w > 140
  let g:Lf_PopupWidth = 140
else
  let g:Lf_PopupWidth = w
endif

let g:Lf_PopupPosition = [0, float2nr((&columns - g:Lf_PopupWidth)/2)]

" Do not use version control tool to list files under a directory since
" submodules are not searched by default.
let g:Lf_UseVersionControlTool = 0

" Use rg as the default search tool
let g:Lf_DefaultExternalTool = "rg"

" show dot files
let g:Lf_ShowHidden = 1

" Disable default mapping
let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

" set up working directory for git repository
let g:Lf_WorkingDirectoryMode = 'a'

" " Search files in popup window
" nnoremap <silent> <leader>ff :<C-U>Leaderf file --popup<CR>

" Grep project files in popup window
nnoremap <silent> <leader>fg :<C-U>Leaderf rg --no-messages --popup<CR>

" Search vim help files
nnoremap <silent> <leader>fh :<C-U>Leaderf help --popup<CR>

" Search tags in current buffer
nnoremap <silent> <leader>ft :<C-U>Leaderf bufTag --popup<CR>

" Switch buffers
nnoremap <silent> <leader>fb :<C-U>Leaderf buffer --popup<CR>

" Search recent files
nnoremap <silent> <leader>fr :<C-U>Leaderf mru --popup<CR>

let g:Lf_PopupColorscheme = 'gruvbox_material'

" Change keybinding in LeaderF prompt mode, use ctrl-n and ctrl-p to navigate
" items.
let g:Lf_CommandMap = {'<C-J>': ['<C-N>'], '<C-K>': ['<C-P>']}

""""""""""""""""""""""""""""open-browser.vim settings"""""""""""""""""""
if g:is_win || g:is_mac
  " Disable netrw's gx mapping.
  let g:netrw_nogx = 1

  " Use another mapping for the open URL method
  nmap ob <Plug>(openbrowser-smart-search)
  xmap ob <Plug>(openbrowser-smart-search)
endif

""""""""""""""""""""""""""" vista settings """"""""""""""""""""""""""""""""""
let g:vista#renderer#icons = {
      \ 'member': '',
      \ }

" Do not echo message on command line
let g:vista_echo_cursor = 0
" Stay in current window when vista window is opened
let g:vista_stay_on_open = 0

nnoremap <silent> <Space>t :<C-U>Vista!!<CR>

""""""""""""""""""""""""vim-mundo settings"""""""""""""""""""""""
let g:mundo_verbose_graph = 0
let g:mundo_width = 80

nnoremap <silent> <Space>u :MundoToggle<CR>

""""""""""""""""""""""""""""vim-yoink settings"""""""""""""""""""""""""
if g:is_win || g:is_mac
  " ctrl-n and ctrl-p will not work if you add the TextChanged event to vim-auto-save events.
  " nmap <c-n> <plug>(YoinkPostPasteSwapBack)
  " nmap <c-p> <plug>(YoinkPostPasteSwapForward)

  " The following p/P mappings are also needed for ctrl-n and ctrl-p to work
  " nmap p <plug>(YoinkPaste_p)
  " nmap P <plug>(YoinkPaste_P)

  " Cycle the yank stack with the following mappings
  nmap [y <plug>(YoinkRotateBack)
  nmap ]y <plug>(YoinkRotateForward)

  " Do not change the cursor position
  nmap y <plug>(YoinkYankPreserveCursorPosition)
  xmap y <plug>(YoinkYankPreserveCursorPosition)

  " Move cursor to end of paste after multiline paste
  let g:yoinkMoveCursorToEndOfPaste = 0

  " Record yanks in system clipboard
  let g:yoinkSyncSystemClipboardOnFocus = 1
endif

""""""""""""""""""""""""""""vim-xkbswitch settings"""""""""""""""""""""""""
let g:XkbSwitchEnabled = 1

"""""""""""""""""""""""""""""" neoformat settings """""""""""""""""""""""
let g:neoformat_enabled_python = ['black', 'yapf']
let g:neoformat_cpp_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }
let g:neoformat_c_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

"""""""""""""""""""""""""vim-signify settings""""""""""""""""""""""""""""""
" The VCS to use
let g:signify_vcs_list = [ 'git' ]

" Change the sign for certain operations
let g:signify_sign_change = '~'

"""""""""""""""""""""""""vim-fugitive settings""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gpl :Git pull<CR>
" Note that to use bar literally, we need backslash it, see also `:h :bar`.
nnoremap <silent> <leader>gpu :15split \| term git push<CR>

"""""""""""""""""""""""""plasticboy/vim-markdown settings"""""""""""""""""""
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Whether to use conceal feature in markdown
let g:vim_markdown_conceal = 1

" Disable math tex conceal and syntax highlight
let g:tex_conceal = ''
let g:vim_markdown_math = 0

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1

"""""""""""""""""""""""""markdown-preview settings"""""""""""""""""""
" Only setting this for suitable platforms
if g:is_win || g:is_mac
  " Do not close the preview tab when switching to other buffers
  let g:mkdp_auto_close = 0

  " Shortcuts to start and stop markdown previewing
  nnoremap <silent> <M-m> :<C-U>MarkdownPreview<CR>
  nnoremap <silent> <M-S-m> :<C-U>MarkdownPreviewStop<CR>
endif

""""""""""""""""""""""""vim-grammarous settings""""""""""""""""""""""""""""""
if g:is_mac
  let g:grammarous#languagetool_cmd = 'languagetool'
  let g:grammarous#disabled_rules = {
      \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'ARROWS', 'SENTENCE_WHITESPACE',
      \        'WORD_CONTAINS_UNDERSCORE', 'COMMA_PARENTHESIS_WHITESPACE',
      \        'EN_UNPAIRED_BRACKETS', 'UPPERCASE_SENTENCE_START',
      \        'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'DASH_RULE', 'PLUS_MINUS',
      \        'PUNCTUATION_PARAGRAPH_END', 'MULTIPLICATION_SIGN', 'PRP_CHECKOUT',
      \        'CAN_CHECKOUT', 'SOME_OF_THE', 'DOUBLE_PUNCTUATION', 'HELL',
      \        'CURRENCY', 'POSSESSIVE_APOSTROPHE', 'ENGLISH_WORD_REPEAT_RULE',
      \        'NON_STANDARD_WORD', 'AU', 'DATE_NEW_YEAR'],
      \ }

  augroup grammarous_map
    autocmd!
    autocmd FileType markdown nmap <buffer> <leader>x <Plug>(grammarous-close-info-window)
    autocmd FileType markdown nmap <buffer> <c-n> <Plug>(grammarous-move-to-next-error)
    autocmd FileType markdown nmap <buffer> <c-p> <Plug>(grammarous-move-to-previous-error)
  augroup END
endif

""""""""""""""""""""""""unicode.vim settings""""""""""""""""""""""""""""""
nmap ga <Plug>(UnicodeGA)

""""""""""""""""""""""""""""vim-sandwich settings"""""""""""""""""""""""""""""
" Map s to nop since s in used by vim-sandwich. Use cl instead of s.
nmap s <Nop>
omap s <Nop>

""""""""""""""""""""""""""""vimtex settings"""""""""""""""""""""""""""""
if ( g:is_win || g:is_mac ) && executable('latex')
  " Hacks for inverse serach to work semi-automatically,
  " see https://jdhao.github.io/2021/02/20/inverse_search_setup_neovim_vimtex/.
  function! s:write_server_name() abort
    let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
    call writefile([v:servername], nvim_server_file)
  endfunction

  augroup vimtex_common
    autocmd!
    autocmd FileType tex call s:write_server_name()
    autocmd FileType tex nmap <buffer> <F9> <plug>(vimtex-compile)
  augroup END

  let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
        \ }

  " TOC settings
  let g:vimtex_toc_config = {
        \ 'name' : 'TOC',
        \ 'layers' : ['content', 'todo', 'include'],
        \ 'resize' : 1,
        \ 'split_width' : 30,
        \ 'todo_sorted' : 0,
        \ 'show_help' : 1,
        \ 'show_numbers' : 1,
        \ 'mode' : 2,
        \ }

  " Viewer settings for different platforms
  if g:is_win
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
  endif

  if g:is_mac
    " let g:vimtex_view_method = "skim"
    let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'

    augroup vimtex_mac
      autocmd!
      autocmd User VimtexEventCompileSuccess call UpdateSkim()
    augroup END

    " The following code is adapted from https://gist.github.com/skulumani/7ea00478c63193a832a6d3f2e661a536.
    function! UpdateSkim() abort
      let l:out = b:vimtex.out()
      let l:src_file_path = expand('%:p')
      let l:cmd = [g:vimtex_view_general_viewer, '-r']

      if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
      endif

      call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
    endfunction
  endif
endif

""""""""""""""""""""""""""""vim-startify settings""""""""""""""""""""""""""""
" Do not change working directory when opening files.
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1

""""""""""""""""""""""""""""vim-matchup settings"""""""""""""""""""""""""""""
" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

"""""""""""""""""""""""""" asyncrun.vim settings """"""""""""""""""""""""""
" Automatically open quickfix window of 6 line tall after asyncrun starts
let g:asyncrun_open = 6
if g:is_win
  " Command output encoding for Windows
  let g:asyncrun_encs = 'gbk'
endif

""""""""""""""""""""""""""""""firenvim settings""""""""""""""""""""""""""""""
if exists('g:started_by_firenvim') && g:started_by_firenvim
  if g:is_mac
    set guifont=Iosevka\ Nerd\ Font:h18
  else
    set guifont=Consolas
  endif

  " general config for firenvim
  let g:firenvim_config = {
      \ 'globalSettings': {
          \ 'alt': 'all',
      \  },
      \ 'localSettings': {
          \ '.*': {
              \ 'cmdline': 'neovim',
              \ 'priority': 0,
              \ 'selector': 'textarea',
              \ 'takeover': 'never',
          \ },
      \ }
  \ }

  augroup firenvim
    autocmd!
    autocmd BufEnter *.txt setlocal filetype=markdown laststatus=0 nonumber noshowcmd noruler showtabline=1
  augroup END
endif

""""""""""""""""""""""""""""""nvim-gdb settings""""""""""""""""""""""""""""""
nnoremap <leader>dp :<C-U>GdbStartPDB python -m pdb %<CR>

""""""""""""""""""""""""""""""wilder.nvim settings""""""""""""""""""""""""""""""
""call timer_start(250, { -> s:wilder_init() })
""
""function! s:wilder_init() abort
""  try
""    call wilder#setup({
""          \ 'modes': [':', '/', '?'],
""          \ 'next_key': '<Tab>',
""          \ 'previous_key': '<S-Tab>',
""          \ 'accept_key': '<C-y>',
""          \ 'reject_key': '<C-e>'
""          \ })
""
""    call wilder#set_option('pipeline', [
""          \   wilder#branch(
""          \     wilder#cmdline_pipeline({
""          \       'language': 'python',
""          \       'fuzzy': 1,
""          \       'sorter': wilder#python_difflib_sorter(),
""          \       'debounce': 30,
""          \     }),
""          \     wilder#python_search_pipeline({
""          \       'pattern': wilder#python_fuzzy_pattern(),
""          \       'sorter': wilder#python_difflib_sorter(),
""          \       'engine': 're',
""          \       'debounce': 30,
""          \     }),
""          \   ),
""          \ ])
""
""    let l:hl = wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}])
""    call wilder#set_option('renderer', wilder#popupmenu_renderer({
""          \ 'highlighter': wilder#basic_highlighter(),
""          \ 'max_height': 15,
""          \ 'highlights': {
""          \   'accent': l:hl,
""          \ },
""          \ 'left': [' ', wilder#popupmenu_devicons(),],
""          \ 'right': [' ', wilder#popupmenu_scrollbar(),],
""          \ 'apply_incsearch_fix': 0,
""          \ }))
""  catch /^Vim\%((\a\+)\)\=:E117/
""    echohl Error |echomsg "Wilder.nvim missing: run :PackerSync to fix."|echohl None
""  endtry
""endfunction


""----------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: Bufferline
""----------------------------------------------------------------------------------------------
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><mymap> :BufferLineMoveNext<CR>
nnoremap <silent><mymap> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" You can select a buffer by it's visible position in the bufferline using the
" BufferLineGoToBuffer command. This means that if you have 60 buffers open but
" only 7 visible in the bufferline then using BufferLineGoToBuffer 4 will go to
" the 4th visible buffer not necessarily the 5 in the absolute list of open
" buffers.

" <- (30) | buf31 | buf32 | buf33 | buf34 | buf35 | buf36 | buf37 (24) ->
" Using BufferLineGoToBuffer 4 will open buf34 as it is the 4th visible buffer.

" This can then be mapped using

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

nnoremap <silent><leader>n  :tabnext<CR>
nnoremap <silent><leader>p  :tabprevious<CR>
nnoremap <silent><leader>bo :tabnew<CR>
nnoremap <silent><leader>bc :tabclose<CR>

""--------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: CtrlSpace
""--------------------------------------------------------------------------------------------
" vnoremap <silent> q <C-Space> :CtrlSpace<CR>
" vnoremap <silent>   <C-Space> :CtrlSpace<CR>
" nnoremap <silent>   <C-Space> :CtrlSpace<CR>

let g:CtrlSpaceDefaultMappingKey = "<c-space>"
set hidden
set encoding=utf-8
" vnoremap <silent> q <C-Space> :CtrlSpace<CR>
vnoremap <silent>   <C-Space> :CtrlSpace<CR>
nnoremap <silent>   <C-Space> :CtrlSpace<CR>


""--------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: vim-easy-align
""--------------------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""--------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: Edge
""--------------------------------------------------------------------------------------------
""Important!!
if has('termguicolors')
    set termguicolors
endif

"" " The configuration options should be placed before `colorscheme edge`.
let g:edge_current_word              = 'bold'
let g:edge_diagnostic_line_highlight = 1
let g:edge_diagnostic_text_highlight = 1
let g:edge_diagnostic_virtual_text   = 'colored'
let g:edge_disable_italic_comment    = 1
let g:edge_enable_italic             = 1
let g:edge_menu_selection_background = 'blue'
let g:edge_spell_foreground          = 'colored'
let g:edge_style                     = 'default'
let g:edge_transparent_background    = 1

let g:colorscheme = 'edge'


"--------------------------------------------------------------------
" Plugin: friendly-snippets
"
" Setup variables so Friendly-Snippets can help provide
" more snippets for vsnip.
"--------------------------------------------------------------------
let g:vsnip_filetypes                   = {}
let g:vsnip_filetypes.c                 = ['c']
let g:vsnip_filetypes.cpp               = ['cpp']
let g:vsnip_filetypes.lua               = ['lua']
let g:vsnip_filetypes.md                = ['markdown']
let g:vsnip_filetypes.py                = ['python']
let g:vsnip_filetypes.rails             = ['ruby']
let g:vsnip_filetypes.sh                = ['shell']
let g:vsnip_filetypes.tex               = ['latex']


"--------------------------------------------------------------------
" Plugin: GitGutter
"--------------------------------------------------------------------
" let g:gitgutter_diff_base = 'origin/master'
let g:gitgutter_diff_base = 'master'
let g:gitgutter_map_keys  = 0               " We'll do our own key mapping

" Colors
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=blue

""--------------------------------------------------------------------------------------------
" Plugin: GitSigns
""--------------------------------------------------------------------------------------------

""--------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: LastPlace
""--------------------------------------------------------------------------------------------
let g:lastplace_ignore_buftype = [ 'quickfix', 'nofile', 'help' ]
let g:lastplace_ignore_filetype = ['gitcommit', 'gitrebase', 'svn', 'hgcommit']
let g:lastplace_open_folds = 1

"--------------------------------------------------------------------
" PLUGIN SETTINGS: rooter.nvim
"--------------------------------------------------------------------
lua << EOF
local NOREF_NOERR_TRUNC = { noremap = true, silent = true, nowait = true }
vim.cmd 'au TabEnter * NeoRoot'
vim.keymap.set('n', '<Leader>p', function() vim.cmd('NeoRootSwitchMode') end, NOREF_NOERR_TRUNC)
vim.keymap.set('n', '<Leader>pre', function() vim.cmd('NeoRootChange') end, NOREF_NOERR_TRUNC)
EOF


"--------------------------------------------------------------------
" PLUGIN SETTINGS: TagBar (shows the tags in a separate bar)
"--------------------------------------------------------------------
nnoremap   <silent> <Leader>t      :TagbarToggle<CR>                       " Open the [T]agbar plugin
let g:tagbar_left             = 0   " Put the tagbar on the right.
let g:tagbar_width            = 40  " Width of the Tagbar window in characters.
let g:tagbar_compact          = 0   " 0: omit the short help at the top of the window
                                    " 1: display the short help at the top of the window
let g:tagbar_iconchars = ['+', '-'] " A problem with the default is that they were too wide,
let g:tagbar_show_linenumbers = 0   " 0: Don't show any line numbers.
                                    " 1: Show absolute line numbers.
                                    " 2: Show relative line numbers.
                                    "-1: Use the global line number settings.
let g:tagbar_singleclick      = 1   " 1: single- instead of double-click is used to jump to the tag definition
let g:tagbar_sort             = 0   " 0: sorted according to their order in the source file
                                    " 1: sorted according to their name
                                    " and they pushed the rest of the characters out.

" BibTeX Support:
let g:tagbar_type_bib = {
    \ 'ctagstype' : 'bib',
    \ 'kinds'     : [
        \ 'a:Articles',
        \ 'b:Books',
        \ 'L:Booklets',
        \ 'c:Conferences',
        \ 'B:Inbook',
        \ 'C:Incollection',
        \ 'P:Inproceedings',
        \ 'm:Manuals',
        \ 'T:Masterstheses',
        \ 'M:Misc',
        \ 't:Phdtheses',
        \ 'p:Proceedings',
        \ 'r:Techreports',
        \ 'u:Unpublished',
    \ ]
\ }

" For makefile support:
let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}

" Markdown support:
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" Puppet Support:
let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
    \}

" Rust Support (Universal ctags):
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/path/to/your/universal/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

" XML support
let g:tagbar_type_xml = {
    \ 'ctagstype' : 'WSDL',
    \ 'kinds' : [
        \ 'n:namespaces',
        \ 'm:messages',
        \ 'p:portType',
        \ 'o:operations',
        \ 'b:bindings',
        \ 's:service'
    \ ]
\ }


"--------------------------------------------------------------------
" Plugin: Gutentags
"--------------------------------------------------------------------
let g:gutentags_ctags_extra_args  =['--fields=+niazS']
let g:gutentags_ctags_extra_args  =['--extra=+q']
let g:gutentags_ctags_extra_args +=['--c++-kinds=+defghmstuvcxp']
let g:gutentags_ctags_extra_args +=['--langmap=c++:.cc.cpp.h.hpp']
let g:gutentags_ctags_extra_args +=['--langmap=c:.c.h']
let g:gutentags_ctags_extra_args +=['--c-kinds=+defghmstuvcx']


"--------------------------------------------------------------------
" Plugin: Indent-Blankline
"--------------------------------------------------------------------
"lua << EOF
"vim.opt.termguicolors = true
"vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
"vim.cmd [[highlight IndentBlanklineIndent2 guibg=#181818 gui=nocombine]]
"
"lua << EOF

"require("indent_blankline").setup {
"    char                       = "",
"    buftype_exclude            = {"terminal", "tex"},
"    space_char_blankline       = " ",
"    show_current_context       = true,
"    show_current_context_start = true,
"
"    char_highlight_list = {
"        "IndentBlanklineIndent1",
"        "IndentBlanklineIndent2",
"    },
"    space_char_highlight_list = {
"        "IndentBlanklineIndent1",
"        "IndentBlanklineIndent2",
"    },
"    show_trailing_blankline_indent = false,
"}
"EOF
"--------------------------------------------------------------------
" Plugin: IndentLine
"--------------------------------------------------------------------
let g:indentLine_char = '│'        " Set the indentation character
let g:indentLine_fileTypeExclude = ['tex']


""----------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: Telescope
""----------------------------------------------------------------------------------------------
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').find_string()<cr>

""--------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: LastPlace
""--------------------------------------------------------------------------------------------
let g:lastplace_ignore_buftype = [ 'quickfix', 'nofile', 'help' ]
let g:lastplace_ignore_filetype = ['gitcommit', 'gitrebase', 'svn', 'hgcommit']
let g:lastplace_open_folds = 1
" Find LSP...
nnoremap <leader>flr   <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>flds  <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>flws  <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
nnoremap <leader>fldws <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>
nnoremap <leader>fd    <cmd>lua require('telescope.builtin').diagnostics()<cr>
nnoremap <leader>fli   <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
nnoremap <leader>fld   <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>fltd  <cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>

""--------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: LSPSaga
""--------------------------------------------------------------------------------------------
nnoremap <silent><C-K> :<cmd>  Lspsaga hover_doc<CR>]]
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>]]
inoremap <silent>gs <Cmd>Lspsaga signature_help<CR>]]
nnoremap <silent>gh <Cmd>Lspsaga lsp_finder<CR>]]
" buf_set_keymap('n',  'gh',         '<cmd>lua lspsaga.provider'.lsp_finder()<CR>', opts)

""----------------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: VimTex
""----------------------------------------------------------------------------------------------
set spelllang=en_us
let g:vimtex_grammar_vlty={'lt_directory': '/usr/bin/languagetool'}
let g:vimtex_compiler_progname = 'latexmk'
""vim.cmd[[ let g:vimtex_mappings_enabled = 0 ]]

let g:vimtex_compiler_latexrun_engines = {
\ '_'                : 'lualatex',
\ 'lualatex'         : 'lualatex',
\ 'pdflatex'         : 'pdflatex',
\ 'xelatex'          : 'xelatex'
\}

let g:vimtex_compiler_latexmk_engines = {
\ '_'                : '-lualatex',
\ 'lualatex'         : '-lualatex',
\ 'pdflatex'         : '-pdflatex',
\ 'dvipdfex'         : '-pdfdvi',
\ 'xelatex'          : '-xelatex',
\ 'context (pdftex)' : '-pdf -pdflatex=texexec',
\ 'context (luatex)' : '-pdf -pdflatex=context',
\ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
\}

let g:vimtex_view_general_viewer = 'okular'
let g:tex_flavor                 = 'latex'



""-----------------------------------------------------------------------------------------
"" PLUGIN SETTINGS: WinResizer
""-----------------------------------------------------------------------------------------
let g:winresizer_start_key   = '<Leader>w'
let g:winresizer_horz_resize = 1
let g:winresizer_vert_resize = 1


