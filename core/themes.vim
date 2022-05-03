let s:theme_setup_dict = {}
if has('termguicolors')
    set termguicolors
endif

function! s:theme_setup_dict.gruvbox8() dict abort
  " Italic options should be put before colorscheme setting,
  " see https://github.com/morhetz/gruvbox/wiki/Terminal-specific#1-italics-is-disabled
  let g:gruvbox_italics=1
  let g:gruvbox_italicize_strings=1
  let g:gruvbox_filetype_hi_groups = 1
  let g:gruvbox_plugin_hi_groups = 1
  colorscheme gruvbox8_hard
endfunction

function! s:theme_setup_dict.onedark() dict abort
  colorscheme onedark
endfunction

"----------------------------------------------------------------------------------------------
" PLUGIN SETTINGS: Edge
"---------------------------------------------------------------------------------------------
function! s:theme_setup_dict.edge() dict abort
  let g:edge_enable_italic = 1
  let g:edge_better_performance = 1
" Important!!

" The configuration options should be placed before `colorscheme edge`.
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
colorscheme edge
endfunction



function! s:theme_setup_dict.sonokai() dict abort
  let g:sonokai_enable_italic = 1
  let g:sonokai_better_performance = 1
  colorscheme sonokai
endfunction

function! s:theme_setup_dict.gruvbox_material() dict abort
  let g:gruvbox_material_enable_italic = 1
  let g:gruvbox_material_better_performance = 1
  colorscheme gruvbox-material
endfunction

function! s:theme_setup_dict.nord() dict abort
  colorscheme nord
endfunction

function! s:theme_setup_dict.doom_one() dict abort
  colorscheme doom-one
endfunction

function! s:theme_setup_dict.everforest() dict abort
  let g:everforest_enable_italic = 1
  let g:everforest_better_performance = 1
  colorscheme everforest
endfunction

function! s:theme_setup_dict.nightfox() dict abort
  colorscheme nordfox
endfunction

function! s:theme_setup_dict.kanagawa() dict abort
  colorscheme kanagawa
endfunction

" Theme to directory name mapping, because theme repo name is not necessarily
" the same as the theme name itself.
let s:theme2dir = {
      \ 'gruvbox8' : 'vim-gruvbox8',
      \ 'onedark': 'onedark.nvim',
      \ 'edge' : 'edge',
      \ 'sonokai': 'sonokai',
      \ 'gruvbox_material': 'gruvbox-material',
      \ 'nord': 'nord.nvim',
      \ 'doom_one': 'doom-one.nvim',
      \ 'everforest' :'everforest',
      \ 'nightfox': 'nightfox.nvim',
      \ 'kanagawa': 'kanagawa.nvim',
      \ }

" let s:theme = utils#RandElement(keys(s:theme2dir))
" let s:these = 'edge'
let s:theme = 'edge'
let s:these = 'edge'
let s:colorscheme_func = printf('s:theme_setup_dict.%s()', s:theme)

if !has_key(s:theme_setup_dict, s:theme)
  let s:msg = "Invalid colorscheme function: " . s:colorscheme_func
  call v:lua.vim.notify(s:msg, 'error', {'title': 'nvim-config'})
  finish
endif

let s:status = utils#add_pack(s:theme2dir[s:theme])
if !s:status
  echomsg printf("Theme %s not installed. Run PackerSync to install.", s:theme)
  finish
endif

execute 'call ' . s:colorscheme_func
if g:logging_level == 'info'
  let s:msg1 = "Colorscheme: " . s:theme
  call v:lua.vim.notify(s:msg1, 'info', {'title': 'nvim-config'})
endif
