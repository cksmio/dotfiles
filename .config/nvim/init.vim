" neovim config chrisv -- superset of ~/.vimrc
" ~/.config/nvim/init.vim 

"set nocompatible		" neovim is always nocompatible

" make backups
set backup " make backup file
set backupdir=~/vimfiles/backup " where to put backup file
set directory=~/vimfiles/temp " directory is the directory for temp file

" main way #1 to use tabs: use a mix of tabs and spaces, but typing
" <Tab> and <BS> will behave like a tab appears every 4 (or 3) characters.
set noexpandtab			" do not subst tabs with spaces 
set tabstop=8			" Number of spaces that a <Tab> in the file counts for. 
" Language-specific
au FileType yaml set ts=2 sw=2 sts=2
au FileType html set ts=2 sw=2 sts=2

" softtabstop - Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.  It 'feels' like
" <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is
" used.  This is useful to keep the 'ts' setting at its standard value
" of 8, while being able to edit like it is set to 'sts'.  However, commands like
" 'x' still work on the actual characters.
set softtabstop=4

" shiftwidth - Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" autoindent - when noexpandtab is set, autoindent also allows 
" shifting tabs left/right when v/V with < and > resp.)
set autoindent

set wrap			" always wrap long lines

" smarttab - When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.
" A <BS> will delete a 'shiftwidth' worth of space at the start of the line
set smarttab

" allow Ctrl+W+_ to resize a split tompletely (keeping only the statusbar of
" other splits)
set winminheight=0
" alt-jk allow resizing up/down of horizontal splits (TBD: maybe also add hl)
" do know that if in the bottom split and pressing <M-k> your statusline moves
" up... but you can of course simply reverse it with <M-j>
nnoremap <M-k> :resize -1<CR>
nnoremap <M-u> :resize -10<CR>
nnoremap <M-j> :resize +1<CR>
nnoremap <M-d> :resize +10<CR>

" ctrl+hjkl jump between splits as expected (too lazy to type C-W...)
" nnoremap <C-h> <C-W><C-h><CR>
" nnoremap <C-j> <C-W><C-j><CR>
" nnoremap <C-k> <C-W><C-k><CR>
" nnoremap <C-l> <C-W><C-l><CR>

"Ctrl+S saves, both in insert- and normal mode...
imap <C-S> <ESC>:w<CR>
nmap <C-S> <ESC>:w<CR>

" Tip #646: moving lines up/down in a file -- note#2
" move the current line up or down
nmap <C-Down>  :m+<CR>==
nmap <C-Up> :m-2<CR>==
imap <C-Down>  <C-O>:m+<CR><C-O>==
imap <C-Up> <C-O>:m-2<CR><C-O>==
" move the selected block up or down
vmap <C-Down>  :m'>+<CR>gv=gv
vmap <C-Up> :m'<-2<CR>gv=gv

" move the current line left or right
nmap <C-Left> <<
nmap <C-Right> >>
imap <C-Left> <C-O><<
imap <C-Right> <C-O>>>
xnoremap <C-Right> >gv|
xnoremap <C-Left> <gv
nnoremap <C-Right> >>_
nnoremap <C-Left> <<_

" vimtip#173 -- switch between splits very fast
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 

" tabs
set showtabline=1          	" no tabs
"set showtabline=2          	" yes tabs; jump around with tabnext tabprev tab... etc
" " navigate tabs quickly with Ctrl+PageUp/PageDown 
" imap <C-N> <ESC>:tabnew<CR>
" nmap <C-N> <ESC>:tabnew<CR>
" imap <C-W> <ESC>:tabclose<CR>
" nmap <C-W> <ESC>:tabclose<CR>
" imap <C-PageUp> <ESC>:tabprev<CR>
" nmap <C-PageUp> <ESC>:tabprev<CR>
" imap <C-PageDown> <ESC>:tabnext<CR>
" nmap <C-PageDown> <ESC>:tabnext<CR>

" buffers
" navigate quickly next/prev with Alt-h/l
imap <M-h> <ESC>:bn<CR>
nmap <M-h> <ESC>:bn<CR>
imap <M-l> <ESC>:bp<CR>
nmap <M-l> <ESC>:bp<CR>

set hlsearch
" Ctrl+\ clears highlighting search results
nmap <C-\> <ESC>:nohlsearch<CR>

map <Home> 1G
map <End> G

" enable folding, and fold every indented blocks
" use zi/zm/zr >>> :help folding
set foldenable
set foldmethod=indent
set foldlevel=1
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

set number
set relativenumber
"set nocopyindent

" cursorline: no underlining of current/cursor line
set cursorline

" smartindent next line (c-like programmaming languages)
set smartindent

" warning: set autoindent may result in copy paste horrorshow
set noautoindent
"
" backupdir/bdir: where to store bak-files while editing
set backupdir=~/.vimtmp,~/.bak,~/.tmp,/tmp
set backupext='.bak'
" cmdheight: always have the statusbar visible; you may need its info in cmd mode...
set cmdheight=1

" cwh/cmdwinheight: number of screen lines to use for the command-line (!) window
set cmdwinheight=7

" prepare for 'bigger' files...
set numberwidth=5

" build statusline -- with some inspiration from https://shapeshed.com/vim-statuslines/
set laststatus=2           	" always show statusline with filename
set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
set statusline+=\ %n		" buffernr
set statusline+=\ %F		" filename
set statusline+=%m\ 		" [+] or [-] (only if set modifiable)
set statusline+=%r\ 		" readonly flag
set statusline+=%=		" nothing in middlecolumn-part
"set statusline+=%#CursorColumn#	" start of rightcolumn- part
set statusline+=\ %y		" space, then type of file e.g. [vim]
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}	" space+fileencoding (utf-8 etc)
set statusline+=\[%{&fileformat}\] 	" file format [unix/dos]
set statusline+=\ O%o:D%b:H%B		" 1-based offset:dec of char under cursor:idem_but_hex
set statusline+=\ %p%%		" pct through file
set statusline+=\ L%l:C%c		" buffernr:linenr:columnr
set statusline+=\ 		" extra padding whitespace



" plugins (using Plug)
"
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

" kanagawa theme - riding the great wave...
Plug 'rebelot/kanagawa.nvim'

" Telescope and deps
" https://github.com/nvim-telescope/telescope.nvim
"Plug 'phan/phan'				     " php
"Plug 'richterger/Perl-LanguageServer'		     " perl
"Plug 'sourcegraph/go-langserver'		     " go
"Plug 'sourcegraph/javascript-typescript-langserver'
"Plug 'rcjsuen/dockerfile-language-server-nodejs'
"Plug 'mads-hartmann/bash-language-server'
"Plug 'nvim-treesitter/nvim-treesitter' 
"Plug 'sharkdp/fd'
"Plug 'burntsushi/ripgrep'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
" or                                , { 'branch': '0.1.x' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
" 
" " Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" 
" " Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" 
" " On-demand loading
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" 
" " Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" 
" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }
" 
" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" 
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" 
" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
" 
" " Initialize plugin system
" " - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

color kanagawa
" color slate

" apply *after* loading colorscheme or some will get overridden
hi clear SignColumn
hi clear LineNr
hi clear CursorLineNr
hi clear CursorLineFold
hi clear CursorLineSign
hi clear CurSearch
hi clear CursorColumn
hi clear Cursorline
hi clear MarkdownUrl

set cursorline

" disable the default startup msg
" set shortmess+=I

fun! Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Start a new buffer ...
    enew

    " ... and set some options for it
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
	\ nofoldenable
        \ norelativenumber

    " Now we can just write to the buffer, whatever you want.
    call append('$', "")
    for line in split(system('fortune -so'), '\n')
        call append('$', '        ' . l:line)
    endfor

    " No modifications to this buffer
    setlocal nomodifiable nomodified

    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" Run after "doing all the startup stuff"
autocmd VimEnter * call Start()



