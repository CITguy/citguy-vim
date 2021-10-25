" =============================================================================='
" NOTE: system-dependent configs configs should be handled in user config (~/.vimrc)
"       e.g., colorscheme, memory, lazyredraw, plugin configs/mappings, etc.
" --------------------------------------------------------------------
" TODO:
"   - [x] figure out how to get folding to include inline comments as part of
"         the folded content (e.g., "#...", "//...", etc.)
"         Solution: `set foldignore=`
" ==============================================================================
set nocompatible  " Reset settings to Vim defaults (not Vi)

" --------------------------------------------------------------------
" Global Settings
" --------------------------------------------------------------------
""" Global Flags (boolean)
set noerrorbells      " [global]
set   equalalways     " [global] equals window sizes on add/remove of new window
set noexrc            " [global] Do NOT auto load .vimrc, .exrc, and .gvimrc in current directory (#SECURITY)
set   hlsearch        " [global] switch on highlighting for the last used search pattern
set   incsearch       " [global] do incremental searching
set   lazyredraw      " [global] seems to help when trying to edit file with deep folds
set   ruler           " [global] toggle display of cursor position ('statusline' overrides this setting) [see 'statusline']
"set   showcmd         " [global] toggle display of incomplete commands (ON with `nocompatible`)
"set   showmode        " [global] (ON with `nocompatible`)
set   smarttab        " [global] when on, <Tab> inserts blanks according to `shiftwidth` (sometimes `tabstop` or `softtabstop`).
set   visualbell      " [global] use visual bell instead of beeping
set   wildmenu        " [global] CLI completion operates in an enhanced mode.

""" Global Options (non-boolean)
" [global] backspace over autoindent, line breaks, and start of insert
set backspace=indent,eol,start
" [global]
set cmdheight=1
" [global] (see 'equalalways')
set eadirection=both
" [global]
set encoding=utf-8
" [global]
set laststatus=2
"" [global]
"set sessionoptions=folds,help,tabpages,unix
" [global]
set wildignore=*.swp,*.bak,*.pyc,*.class


" --------------------------------------------------------------------
" Global/Window Settings
" --------------------------------------------------------------------
" [global, window] (lcs) characters to toggle with 'list' option [see 'list']
set listchars=tab:..,eol:$
" [global, window] scrolloff (number of lines to show around the cursor)
set scrolloff=4
" [global, window] Set side scrolloff, similar to scrolloff but horizontal
set sidescrolloff=4
" [global, window] statusline == fileformat, encoding, ('b' + buffer num), RO, PREVIEW, mod flag, filepath, spacer, col, line/total lines, pct
set statusline=%{&ff}\ %{&fenc}\ \b%1.3n\ %Y\ %r\ %W\ %m\ %F%=\ %1.7c\ %1.7l/%L\ %p%%


" --------------------------------------------------------------------
" Global/Buffer Settings
" --------------------------------------------------------------------
set noautoread        " [global, buffer] autoread files if they change outside of Vim


" --------------------------------------------------------------------
" Window Settings
" --------------------------------------------------------------------
""" Window Flags (boolean)
set nocursorcolumn    " [window] toggle display of cursor column
set   cursorline      " [window] Show Cursor Line
set   foldenable      " [window] enable folding
set nolinebreak       " [window] toggle wrapping long lines via 'breakat' chars
set nolist            " [window] toggle display of hidden characters (tab, space, $) [see `listchars`]
set   number          " [window] display current line number
set norelativenumber  " [window] toggle relative line numbers from current line [see 'number']
set nowrap            " [window] toggle line wrapping

""" Window Options (non-boolean)
set foldcolumn=0      " [window]
set foldignore=       " [window] (blank) = nothing ignored; inline `# ...` comments are included in folded content
set foldlevel=20      " [window] keep ALL levels of folds open on file open [see 'foldnestmax']
set foldmethod=indent " [window] fold based on indent
set foldminlines=1    " [window] Number of screen lines above whith a fold can be displayed


" --------------------------------------------------------------------
" Buffer Settings
" --------------------------------------------------------------------
""" Buffer Flags (boolean)
set noautoindent      " [buffer] Use smartindent instead (see `smartindent`)
set   expandtab       " [buffer] expand <Tab> to configured spaces from 'softtabstop'
set   smartindent     " [buffer] smart autoindenting when staring a new line (see also `cindent`)
" softtabstop={value} " [buffer]

""" Buffer Options (non-boolean)
set shiftwidth=2  " [buffer] shift width (2 spaces)
set tabstop=2  " [buffer] <Tab> = {value} spaces


" -----------------------------------------------------------------------------
" Filetype Detection
"
" Setting                   | Detection | Plugin  | Indent
" ------------------------- | --------- | ------- | ------
" filetype on               | ON        | OFF     | OFF
" filetype plugin on        | ON        | ON      | OFF
" filetype plugin indent on | ON        | ON      | ON
"
" Detection: enables syntax highlighting, option settings, etc.
"   - runs $VIMRUNTIME/filetype.vim
" Plugin: enables loading plugin files
"   - $VIMRUNTIME/ftplugin.vim
"   - $VIMRUNTIME/ftplugin/{filetype}.vim
" Indent: enables loading indent files
"   - $VIMRUNTIME/
" -----------------------------------------------------------------------------
filetype plugin indent on


" ==============================================================================
" MAPPINGS
" ==============================================================================
let mapleader=","

" mapping CTRL+Arrow to switch between split windows
map <C-H> <C-W><Left>
map <C-J> <C-W><Down>
map <C-K> <C-W><Up>
map <C-L> <C-W><Right>


"" Remap j and k to be non-linewise (based on _visual_ lines, not actual lines)
" Most helpful when lines wrap; otherwise same as default j and k movement.
map j gj
map k gk

" Turn off K binding
" (disables keyword lookup under the cursor, because I keep triggering it accidentally)
noremap K <NOP>

" Disable Ex mode
" TODO: what does this mean?
noremap Q <NOP>

" Clear Search Highlighting
" A shortcut I liked from the Komodo editor.
noremap <C-\> :nohls<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" ==============================================================================
" FUNCTIONS
" ==============================================================================

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Do the business: (remove trailing white space)
  %s/\s\+$//e

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Cleanup whitespace before save
"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
