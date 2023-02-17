" neovim config vicc -- superset of ~/.vimrc
" ~/.config/nvim/init.vim 

"set nocompatible		" neovim is always nocompatible

" make backups
set backup " make backup file
"set backupdir=~/vimfiles/backup " where to put backup file
"set directory=~/vimfiles/temp " directory is the directory for temp file
set backupdir=~/.vimtmp,~/.bak,~/.tmp,/tmp
set backupext='.bak'

" main way #1 to use tabs: use a mix of tabs and spaces, but typing
" <Tab> and <BS> will behave like a tab appears every 4 (or 3) characters.
set noexpandtab			" do not subst tabs with spaces 
set tabstop=8			" Number of spaces that a <Tab> in the file counts for. 
" Language-specific
au FileType yaml set ts=2 sw=2 sts=2
au FileType html set ts=2 sw=2 sts=2

" Follow the leader....
let mapleader = ' '  " set leader key to space
set timeoutlen=500 " Set timeout length to 500 ms
set showcmd	    " shows that leaderkey was pressed for duruation timeoulen

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

" vimtip#173 -- switch between splits very fast
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_ 

" remap Ctrl-j and Ctrl-k to be same as Ctrl-n and Ctrl-p resp.
imap <C-J> <C-N>
"nmap <C-J> <C-N>
vmap <C-J> <C-N>
"nnoremap <C-J> <C-N>
xnoremap <C-J> <C-N>

imap <C-K> <C-P>
"nmap <C-K> <C-P>
vmap <C-K> <C-P>
"nnoremap <C-K> <C-P>
xnoremap <C-K> <C-P>

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
xnoremap <M-h> <ESC>:bn<CR>
nnoremap <M-h> <ESC>:bn<CR>
imap <M-l> <ESC>:bp<CR>
nmap <M-l> <ESC>:bp<CR>
xnoremap <M-l> <ESC>:bp<CR>
nnoremap <M-l> <ESC>:bp<CR>

set hlsearch
" Ctrl+\ clears highlighting search results
nmap <C-\> <ESC>:nohlsearch<CR>

map <Home> 1G
map <End> G


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
    
    " kanagawa theme - greyish bg - riding the great wave...
    Plug 'rebelot/kanagawa.nvim'
    " ego theme - black bg
    " Plug 'geetarista/ego.vim'

    " Telescope and deps
    " https://github.com/nvim-telescope/telescope.nvim
    Plug 'nvim-telescope/telescope.nvim'
    "Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    " or                                , { 'branch': '0.1.x' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } 
    Plug 'sharkdp/fd'
    Plug 'burntsushi/ripgrep'
    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " cmp-related (autocomplete)
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    " For vsnip users:
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    " For luasnip users:
    " Plug 'L3MON4D3/LuaSnip'
    " Plug 'saadparwaiz1/cmp_luasnip'
    " For ultisnips users:
    " Plug 'SirVer/ultisnips'
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    " For snippy users:
    " Plug 'dcampos/nvim-snippy'
    " Plug 'dcampos/cmp-snippy'

    "Language Servers
    " https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    " php:
    Plug 'phan/phan'
    " perl (perlls):
    Plug 'richterger/Perl-LanguageServer'
    
    " A flexible JSON/YAML linter for creating automated style guides, with baked in support for OpenAPI v2 & v3:
    Plug 'luizcorreia/spectral-language-server'
    " yaml:
    " Plug 'redhat-developer/yaml-language-server'

    " marksman, much more than markdown, but a zettlekasten thingy; install
    " binary from:
    " https://github.com/artempyanykh/marksman
    Plug 'artempyanykh/marksman'

    "Plug 'sourcegraph/go-langserver'		     " go
    "Plug 'sourcegraph/javascript-typescript-langserver'
    Plug 'rcjsuen/dockerfile-language-server-nodejs'
    Plug 'mads-hartmann/bash-language-server'

    
    

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
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
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
    " 
    " " Unmanaged plugin (manually installed and updated)
    " Plug '~/my-prototype-plugin'
    " 
    " " Initialize plugin system
    " " - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" color ego
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



function! CurrentLineInfo()
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "rust", "go", "php", "html", "css", "perl", 
	"bash", "yaml", "json", "markdown", "c", "lua", "vim", "help",
	"todotxt", "terraform", "sql", "regex", "mermaid", "markdown_inline", "ini", "diff",
	"comment", "dockerfile" 
    },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

--     -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
--     -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
--     -- the name of the parser)
--     -- list of language that will be disabled
--     disable = { "c", "rust" },
--     -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
--     disable = function(lang, buf)
--         local max_filesize = 100 * 1024 -- 100 KB
--         local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--         if ok and stats and stats.size > max_filesize then
--             return true
--         end
--     end,
-- 
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = true
  },
  incremental_selection = {
      enable = true
  },
}
EOF
endfunction
call CurrentLineInfo()

" remaps after plugin init ...

nnoremap <leader>ne <cmd>NERDTreeToggle<cr>
"
" https://github.com/nvim-telescope/telescope.nvim#pickers
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" requires ripgrep:
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nvim-cmp setup: https://github.com/hrsh7th/nvim-cmp
function! VimCmpLoader()
lua << EOFcmp
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  
  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- vim.nvim-lspconfig.root_dir = util.find_git_ancestor

  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['phan'].setup {}
  require('lspconfig')['perlls'].setup {}
  require('lspconfig')['spectral'].setup {}
  --require('lspconfig')['yamlls'].setup {}
  require('lspconfig')['marksman'].setup {}
  --require('lspconfig')['go-langserver'].setup {}
  --require('lspconfig')['javascript-typescript-langserver'].setup {}
  require('lspconfig')['dockerls'].setup {}
  require('lspconfig')['bashls'].setup {}
EOFcmp
endfunction

call VimCmpLoader()

" Folding...
" enable folding, and fold every indented blocks
" how to use zi/zm/zr >>> :help folding
" set foldenable
" set foldmethod=indent
" set foldlevel=1

" <space><space> to toggle folds.
nnoremap <leader><leader> za
vnoremap <leader><leader> za

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" set foldexpr=getline(v:lnum)[0]==\"\\t\"
set nofoldenable                     " Disable folding at startup.


" make starting a new scratch buffer (like on startup with no args, or via
" <leader>ss) a bit more offensive...
fun! StartNewOffensiveScratchBuffer()
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
    " (in this case, `fortune` is required, and it needs to support -o)
    call append('$', "")
    for line in split(system('fortune -no'), '\n')
        call append('$', '        ' . l:line)
    endfor

    " No modifications to this buffer
    setlocal nomodifiable nomodified

    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" when starting up (n)vim without filename (in scratch mode) do it in style
" set shortmess+=I
fun! StartingVim()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif
    
    " now disabling the default startup msg
    " now replace the default startup msg with something offensively
    call StartNewOffensiveScratchBuffer()
endfun

" <space>ss creates a scratch buffer (as if on startup)
nnoremap <leader>ss :call StartNewOffensiveScratchBuffer()<cr>
vnoremap <leader>ss :call StartNewOffensiveScratchBuffer()<cr>

" Run after "doing all the startup stuff"
autocmd VimEnter * call StartingVim()
