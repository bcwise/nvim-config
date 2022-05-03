" Save key strokes (now we do not need to press shift to enter command mode).
" Vim-sneak has also mapped `;`, so using the below mapping will break the map
" used by vim-sneak
nnoremap ; :
xnoremap ; :


" " Shortcut for faster save and quit
" nnoremap <silent> <leader>w :<C-U>update<CR>
" " Saves the file if modified and quit
" nnoremap <silent> <leader>q :<C-U>x<CR>
" " Quit all opened buffers
" nnoremap <silent> <leader>Q :<C-U>qa!<CR>

" Navigation in the location and quickfix list
" nnoremap <silent> [l :<C-U>lprevious<CR>zv
" nnoremap <silent> ]l :<C-U>lnext<CR>zv
" nnoremap <silent> [L :<C-U>lfirst<CR>zv
" nnoremap <silent> ]L :<C-U>llast<CR>zv
" nnoremap <silent> [q :<C-U>cprevious<CR>zv
" nnoremap <silent> ]q :<C-U>cnext<CR>zv
" nnoremap <silent> [Q :<C-U>cfirst<CR>zv
" nnoremap <silent> ]Q :<C-U>clast<CR>zv

" Jump to matching pairs easily in normal mode
" nnoremap <Tab> %

" Go to start or end of line easier
" nnoremap H ^
" xnoremap H ^
" nnoremap L g_
" xnoremap L g_

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://superuser.com/q/310417/736190
" xnoremap < <gv
" xnoremap > >gv

" When completion menu is shown, use <cr> to select an item and do not add an
" annoying newline. Otherwise, <enter> is what it is. For more info , see
" https://superuser.com/a/941082/736190 and
" https://unix.stackexchange.com/q/162528/221410
" inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
" Use <esc> to close auto-completion menu
" inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

" Tab-complete, see https://vi.stackexchange.com/q/19675/15292.
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Edit and reload init.vim quickly
" nnoremap <silent> <leader>ev :<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>
" nnoremap <silent> <leader>sv :<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar>
"       \ call v:lua.vim.notify("Nvim config successfully reloaded!", 'info', {'title': 'nvim-config'})<cr>

" Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
nnoremap <expr> <leader>v printf('`[%s`]', getregtype()[0])

" Search in selected region
" xnoremap / :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>

" Find and replace (like Sublime Text 3)
" nnoremap <C-H> :%s/
" xnoremap <C-H> :s/

" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
nnoremap <silent> <leader>cd :<C-U>lcd %:p:h<CR>:pwd<CR>



" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

" Remove trailing whitespace characters
" nnoremap <silent> <leader><Space> :<C-U>StripTrailingWhitespace<CR>

" check the syntax group of current cursor position
" nnoremap <silent> <leader>st :<C-U>call utils#SynGroup()<CR>

" Clear highlighting
" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :<C-U>nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif

" Copy entire buffer.
" nnoremap <silent> <leader>y :<C-U>%y<CR>

" Toggle cursor column
" nnoremap <silent> <leader>cl :<C-U>call utils#ToggleCursorCol()<CR>

" Text objects for URL
" xnoremap <silent> iu :<C-U>call text_obj#URL()<CR>
" onoremap <silent> iu :<C-U>call text_obj#URL()<CR>

" Text objects for entire buffer
" xnoremap <silent> iB :<C-U>call text_obj#Buffer()<CR>
" onoremap <silent> iB :<C-U>call text_obj#Buffer()<CR>

" Do not move my cursor when joining lines.
" nnoremap J mzJ`z

" Break inserted text into smaller undo units.
" for ch in [',', '.', '!', '?', ';', ':']
"   execute printf('inoremap %s %s<C-g>u', ch, ch)
" endfor

" Keep cursor position after yanking
" nnoremap y myy
" xnoremap y myy

" augroup restore_after_yank
"   autocmd!
"   autocmd TextYankPost *  call s:restore_cursor()
" augroup END

" function! s:restore_cursor() abort
"   silent! normal `y
"   silent! delmarks y
" endfunction


"--------------------------------------------------------------------
" Settings: Key Mappings
"--------------------------------------------------------------------

vnoremap <silent> Q gq              " Disable Ex mode and use Q for formatting the current paragraph (or selection)
nnoremap <silent> Q gqap
vnoremap <silent> < <gv             " Remain in visual mode after '<' or '>'
vnoremap <silent> > >gv

"--------------------------------------------------------------------
" Settings: Center the Search Results on the Screen
"--------------------------------------------------------------------
nnoremap <silent> n  nzz
nnoremap <silent> N  Nzz
nnoremap <silent> *  nzz
nnoremap <silent> #  #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Make * and # work with visual selection
vnoremap <silent> * yq/i\V<Esc>p<CR>
vnoremap <silent> # yq?i\V<Esc>p<CR>

" Repeat last action for each line in the visual selection
vnoremap <silent> . :normal .<CR>

" Move through window splits with Ctrl-{hjkl}
nnoremap <silent> <C-h> :wincmd h<CR>
inoremap <silent> <C-h> <Esc>:wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
inoremap <silent> <C-j> <Esc>:wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
inoremap <silent> <C-k> <Esc>:wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
inoremap <silent> <C-l> <Esc>:wincmd l<CR>

" Make ' jump to saved line & column rather than just line
nnoremap ' `

"
" Abbreviations (typo corrections)
"
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev We w
cnoreabbrev W  w
cnoreabbrev Q  q
cnoreabbrev X  x


"
" <Leader> mappings
"
let mapleader=','                                                       " Change mapleader
nnoremap   <silent> <Leader>d        "_d
nnoremap   <silent> <Leader>D        "_D
nnoremap   <silent> <Leader>e        :NvimTreeToggle<CR>
"nnoremap   <silent> <Leader>fa       :execute 'Ag ' . input('Ag: ')<CR>
"nnoremap   <silent> <Leader>fb       :execute 'Buffers'<CR>
"nnoremap   <silent> <Leader>fc       :execute 'Colors'<CR>
"nnoremap   <silent> <Leader>fm       :execute 'Maps'<CR>
"nnoremap   <silent> <Leader>fr       :execute 'Rg ' . input('Rg: ')<CR>
"nnoremap   <silent> <Leader>fw       :call SearchWordWithAg()<CR>
"vnoremap   <silent> <Leader>fW       :call SearchVisualSelectionWithAg()<CR>
" nnoremap   <silent> <Leader>gb       :Gblame<CR>                             " [gb]lame: Executes the fugitive plugin's gBlame (git blame) command
" nnoremap   <silent> <Leader>gc       :Git add -p<CR>:Gcommit -v<CR>          " [G]it [c]ommit
" nnoremap   <silent> <Leader>gd       :Git diff --color<CR>                   " [G]it [d]iff
" nnoremap   <silent> <Leader>gD       :Git diff --color --cached<CR>          " [G]it [d]iff staged files
" nnoremap   <silent> <Leader>gdc      :let g:gitgutter_diff_base = 'CHAMELEON'
" nnoremap   <silent> <Leader>gdm      :let g:gitgutter_diff_base = 'master'
" nnoremap   <silent> <Leader>gh       :Gbrowse<CR>                            " Open file in [g]it[h]ub
" nnoremap   <silent> <Leader>gl       :Git log --oneline --decorate --graph --color<CR>      " [G]it [l]og
" nnoremap   <silent> <Leader>gL       :Git log --oneline --decorate --graph --color -p<CR>   " [G]it [l]og with diffs
" nnoremap   <silent> <Leader>gm       :Gmove<Space>                           " [G]it [m]ove
" nnoremap   <silent> <Leader>gp       :Git push<CR>                           " [G]it [p]ush
" nnoremap   <silent> <Leader>gP       :Git pull --rebase<CR>                  " [G]it [p]ull
" nnoremap   <silent> <Leader>gr       :Gremove<CR>                            " [G]it [r]emove
" nnoremap   <silent> <Leader>gs       :Gstatus<CR>                            " [G]it [s]tatus
" nnoremap   <silent> <Leader>gt       :Git ctags<CR>                          " [G]it c[t]ags
" nnoremap   <silent> <Leader>ha       :GitGutterStageHunk<CR>
" nnoremap   <silent> <Leader>hn       :GitGutterNextHunk<CR>zz
" nnoremap   <silent> <Leader>hp       :GitGutterPrevHunk<CR>zz
" nnoremap   <silent> <Leader>hu       :GitGutterUndoHunk<CR>
" nnoremap   <silent> <Leader>hv       :GitGutterPreviewHunk<CR>
" nnoremap   <silent> <Leader>i        :IndentLinesToggle<CR>                  " Toggles the indentation lines on/off
"nmap       <silent> <Leader>ide      :ToggleNERDTreeAndTagbar<CR>            " [IDE] Opens both NERDTree and tagbar in a single horizontally-split window
"nnoremap   <silent> <Leader>j        :let pos=getpos('.')<ESC>i<CR><ESC>:call setpos('.', pos)<CR>
" nnoremap <silent> <Leader>l        :ListToggle uses <leader>-l to toggle the list command (see also listchars)
" Make commands
" m : make
" Make black side:      mb,  c(lean) d(ebug) r(elease) (e.g. mb, mbc, mbd, mbr)
" Make red side:        mr,  c(lean) d(ebug) r(elease) (e.g. mr, mrc, mrd, mrr)
" Make el6:             m6,  c(lean) d(ebug) r(elease) (e.g. m6, m6c, m6d, m6r)
" Make el6(neon):       m6,  c(lean) d(ebug) r(elease) (e.g. m6, m6c, m6d, m6r)
" Make el7:             m7,  c(lean) d(ebug) r(elease) (e.g. m7, m7c, m7d, m7r)
" Make el7(snapdragon): m7s, c(lean) d(ebug) r(elease) (e.g. m7, m7c, m7d, m7r)
"                                Make <target>     PUBSUB_IMPL        TC_LIST_QUAL                                      TC_LIST
nnoremap <silent> <Leader>m     :make
nnoremap <silent> <Leader>ma    :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains<CR>
nnoremap <silent> <Leader>mc    :make clean        PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains<CR>
nnoremap <silent> <Leader>md    :make debug        PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains<CR>
nnoremap <silent> <Leader>mr    :make release      PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains<CR>
" Make: black side
nnoremap <silent> <Leader>mb    :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains.coredx                    TC_LIST=toolchain-Linux-wrl7-ti-66ak2xxx-hf-vfp-neon   <CR>
nnoremap <silent> <Leader>mbc   :make clean        PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains.coredx                    <CR>
nnoremap <silent> <Leader>mbd   :make arch-debug   PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains.coredx                    TC_LIST=toolchain-Linux-wrl7-ti-66ak2xxx-hf-vfp-neon   <CR>
nnoremap <silent> <Leader>mbr   :make arch-release PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains.coredx                    TC_LIST=toolchain-Linux-wrl7-ti-66ak2xxx-hf-vfp-neon   <CR>
" Make: red side
nnoremap <silent> <Leader>mr    :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains.coredx                    TC_LIST=toolchain-Linux-xilinx2018.1-aarch64-linux-gnu <CR>
nnoremap <silent> <Leader>mrc   :make clean        PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains.coredx                    <CR>
nnoremap <silent> <Leader>mrd   :make arch-debug   PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains.coredx                    TC_LIST=toolchain-Linux-xilinx2018.1-aarch64-linux-gnu <CR>
nnoremap <silent> <Leader>mrr   :make arch-release PUBSUB_IMPL=coredx TC_LIST_QUAL=toolchains.coredx                    TC_LIST=toolchain-Linux-xilinx2018.1-aarch64-linux-gnu <CR>
" Make: el6
nnoremap <silent> <Leader>m6    :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el6Builds TC_LIST=toolchain-Linux-gcc5.3.0-x86_64                <CR>
nnoremap <silent> <Leader>m6c   :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el6Builds <CR>
nnoremap <silent> <Leader>m6d   :make arch-debug   PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el6Builds TC_LIST=toolchain-Linux-gcc5.3.0-x86_64                <CR>
nnoremap <silent> <Leader>m6r   :make arch-release PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el6Builds TC_LIST=toolchain-Linux-gcc5.3.0-x86_64                <CR>
" Make: el6(neon)
nnoremap <silent> <Leader>m6n   :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el6Builds TC_LIST=toolchain-Linux-wrl7-ti-66ak2xxx-hf-vfp-neon   <CR>
nnoremap <silent> <Leader>m6nc  :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el6Builds TC_LIST=toolchain-Linux-wrl7-ti-66ak2xxx-hf-vfp-neon   <CR>
nnoremap <silent> <Leader>m6nd  :make arch-debug   PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el6Builds TC_LIST=toolchain-Linux-wrl7-ti-66ak2xxx-hf-vfp-neon   <CR>
nnoremap <silent> <Leader>m6nr  :make arch-release PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el6Builds TC_LIST=toolchain-Linux-wrl7-ti-66ak2xxx-hf-vfp-neon   <CR>
" Make: el7
nnoremap <silent> <Leader>m7    :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el7Builds TC_LIST=toolchain-Linux-el7-gcc5.3.0-x86_64            <CR>
nnoremap <silent> <Leader>m7c   :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el7Builds <CR>
nnoremap <silent> <Leader>m7d   :make arch-debug   PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el7Builds TC_LIST=toolchain-Linux-el7-gcc5.3.0-x86_64            <CR>
nnoremap <silent> <Leader>m7r   :make arch-release PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el7Builds TC_LIST=toolchain-Linux-el7-gcc5.3.0-x86_64            <CR>
" Make: el7(snapdragon)
nnoremap <silent> <Leader>m7s   :make arch         PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el7Builds TC_LIST=toolchain-Linux-poky-2.5.1-snapdragon          <CR>
nnoremap <silent> <Leader>m7sc  :make clean        PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el7Builds <CR>
nnoremap <silent> <Leader>m7sd  :make debug        PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el7Builds TC_LIST=toolchain-Linux-poky-2.5.1-snapdragon          <CR>
nnoremap <silent> <Leader>m7sr  :make release      PUBSUB_IMPL=coredx TC_LIST_QUAL=framework/cmake/toolchains/el7Builds TC_LIST=toolchain-Linux-poky-2.5.1-snapdragon          <CR>
" Make: miscelaneous
nnoremap   <silent> <Leader>mci      :make ci<CR>
nnoremap   <silent> <Leader>mcov     :make coverage<CR>
nnoremap   <silent> <Leader>ml       :make lib<CR>
nnoremap   <silent> <Leader>mt       :make test PUBSUB_IMPL=coredx<CR>
" Open File Commands
nnoremap   <silent> <Leader>of       :FSHere<cr>                             " [vim-fswitch] Switch to the file and load it into the current window
nnoremap   <silent> <Leader>ol       :FSRight<cr>                            " [vim-fswitch] Switch to the file and load it into the window on the right
nnoremap   <silent> <Leader>oL       :FSSplitRight<cr>                       " [vim-fswitch] Switch to the file and load it into a new window split on the right
nnoremap   <silent> <Leader>oh       :FSLeft<cr>                             " [vim-fswitch] Switch to the file and load it into the window on the left
nnoremap   <silent> <Leader>oH       :FSSplitLeft<cr>                        " [vim-fswitch] Switch to the file and load it into a new window split on the left
nnoremap   <silent> <Leader>ok       :FSAbove<cr>                            " [vim-fswitch] Switch to the file and load it into the window above
nnoremap   <silent> <Leader>oK       :FSSplitAbove<cr>                       " [vim-fswitch] Switch to the file and load it into a new window split above
nnoremap   <silent> <Leader>oj       :FSBelow<cr>                            " [vim-fswitch] Switch to the file and load it into the window below
nnoremap   <silent> <Leader>oJ       :FSSplitBelow<cr>                       " [vim-fswitch] Switch to the file and load it into a new window split below
" nnoremap <silent> <Leader>q        :ListToggle uses this to toggle the quick fix list
nnoremap   <silent> <Leader>qe       :copen<cr> :cf error.err<CR>            " Quickfix: load error file (error.err)
nnoremap   <silent> <Leader>s        :setlocal spell!<CR>                    " Toggle [s]pell checking
nnoremap   <silent> <Leader>so       :source $MYVIMRC<CR>                    " [SO]urce my vimrc file (reload it)
nnoremap   <silent> <Leader>t       :TagbarToggle<CR>                       " Open the [T]agbar plugin
"nnoremap  <silent> <Leader>tb       " Telescope
"nnoremap  <silent> <Leader>tc       " Telescope
"nnoremap  <silent> <Leader>tf       " Telescope
"nnoremap  <silent> <Leader>tg       " Telescope
"nnoremap  <silent> <Leader>th       " Telescope
nnoremap   <silent> <Leader>u        :UndotreeToggle<CR>                     " Toggle the undo-tree panel
" nnoremap <silent> <Leader>w        :This is reserved for winresizer.  See the plugin section for this remapping. <DON'T REMOVE>
nnoremap   <silent> <Leader>W        :setlocal wrap!<CR>                     " [w]ord wrap toggle for the current file
" Quickly fix spelling errors choosing the first result
nnoremap   <silent> <Leader>z        z=1<CR>

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


