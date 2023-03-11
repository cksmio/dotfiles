" neovim config vicc -- superset of ~/.vimrc
" ~/.config/nvim/init.vim 

set shell=/bin/bash

let mapleader = "\<Space>"
set timeoutlen=500  " Set timeout length to 500 ms
set showcmd	    " shows that leaderkey was pressed for duruation timeoulen

"set nocompatible   " neovim is always nocompatible

" backups etc ==================================================================
set backup " make backup file
set backupdir=~/vimfiles/bak
set directory=~/vimfiles/temp
set backupext='.bak'
" Permanent undo
set undodir=~/vimfiles/undo
set undofile

" tabs, as in... #space, -denting, etc. =================================
" main way #1 to use tabs: use a mix of tabs and spaces, but typing
" <Tab> and <BS> will behave like a tab appears every 4 (or 3) characters.
set noexpandtab			" do not subst tabs with spaces 
set tabstop=8			" Number of spaces that a <Tab> in the file counts for. 

" softtabstop - Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.  It 'feels' like
" <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is
" used.  This is useful to keep the 'ts' setting at its standard value
" of 8, while being able to edit like it is set to 'sts'.  However, commands like
" 'x' still work on the actual characters.
set softtabstop=4

" shiftwidth - Number of spaces to use for each step of (auto)indent.
set shiftwidth=4
" Language-specific
au FileType yaml set ts=2 sw=2 sts=2
au FileType json set ts=2 sw=2 sts=2
au FileType html set ts=2 sw=2 sts=2
au FileType css set ts=2 sw=2 sts=2
au FileType xml set ts=2 sw=2 sts=2

" smarttab - When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.
" A <BS> will delete a 'shiftwidth' worth of space at the start of the line
set smarttab

" autoindent - when noexpandtab is set, autoindent also allows 
" shifting tabs left/right when v/V with < and > resp.)
set autoindent

" tabs, as in... those file-seperator-thingies up top ================= 
set showtabline=1          	" no tabs
"set showtabline=2          	" yes tabs; jump around with tabnext tabprev tab... etc
"" if tabs then navigate tabs quickly with Ctrl+PageUp/PageDown 
"imap <C-N> <ESC>:tabnew<CR>
"nmap <C-N> <ESC>:tabnew<CR>
"imap <C-W> <ESC>:tabclose<CR>
"nmap <C-W> <ESC>:tabclose<CR>
"imap <C-PageUp> <ESC>:tabprev<CR>
"nmap <C-PageUp> <ESC>:tabprev<CR>
"imap <C-PageDown> <ESC>:tabnext<CR>
"nmap <C-PageDown> <ESC>:tabnext<CR>

" buffers ===================================================================
" navigate quickly next/prev with Alt-h/l
imap <M-h> <ESC>:bn<CR>
nmap <M-h> <ESC>:bn<CR>
xnoremap <M-h> <ESC>:bn<CR>
nnoremap <M-h> <ESC>:bn<CR>
imap <M-l> <ESC>:bp<CR>
nmap <M-l> <ESC>:bp<CR>
xnoremap <M-l> <ESC>:bp<CR>
nnoremap <M-l> <ESC>:bp<CR>

" window-(re)sizing etc =====================================================
set wrap			" always wrap long lines

" allow Ctrl+W+_ to resize a split tompletely (keeping only the statusbar of
" other splits)
set winminheight=0
" alt-jk allow resizing up/down of horizontal splits 
" do know that if in the bottom split and pressing <M-k> your statusline moves
" up... but you can of course simply reverse it with <M-j>
nnoremap <M-k> :resize -1<CR>
nnoremap <M-u> :resize -10<CR>
nnoremap <M-j> :resize +1<CR>
nnoremap <M-d> :resize +10<CR>

" moving (stuff) around ======================================================
map <Home> 1G
map <End> G
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

" quick timesaving shortcuts =================================================
"Ctrl+S saves, both in insert- and normal mode...
imap <C-S> <ESC>:w<CR>
nmap <C-S> <ESC>:w<CR>


" eyecandy to improve *productivity* =========================================
set number
set relativenumber
"set nocopyindent
set cursorline " no underlining of current/cursor line
set smartindent " indent next line (c-like programmaming languages)
set noautoindent " warning: set autoindent may result in copy paste horrorshow
set cmdheight=1 " always have the statusbar visible;
set cmdwinheight=7 " number of screen lines to use for the command-line (!) window
set numberwidth=5 " allow 'bigger' files

" build statusline ===========================================================
"  -- cf. https://shapeshed.com/vim-statuslines/
set laststatus=2           	" always show statusline with filename
set statusline=
set statusline+=\ %n		" buffernr
set statusline+=\ %F		" filename
set statusline+=%m\ 		" [+] or [-] (only if set modifiable)
set statusline+=%r\ 		" readonly flag
set statusline+=%=		" nothing in middlecolumn-part
set statusline+=\ %y		" space, then type of file e.g. [vim]
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}	" space+fileencoding (utf-8 etc)
set statusline+=\[%{&fileformat}\] 	" file format [unix/dos]
set statusline+=\ O%o:D%b:H%B		" 1-based offset:dec of char under cursor:idem_but_hex
set statusline+=\ %p%%		" pct through file
set statusline+=\ L%l:C%c		" buffernr:linenr:columnr
set statusline+=\ 		" extra padding whitespace


" Plug-ins ==================================================================
call plug#begin()
    " The default plugin directory will be as follows:
    "   - Vim (Linux/macOS): '~/.vim/plugged'
    "   - Vim (Windows): '~/vimfiles/plugged'
    "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
    " You can specify a custom plugin directory by passing it as the argument
    "   - e.g. `call plug#begin('~/.vim/plugged')`
    "   - Avoid using standard Vim directory names like 'plugin'
    " Make sure you use single quotes
    "
    " GUI enhancements
    Plug 'itchyny/lightline.vim'
    Plug 'andymass/vim-matchup'    

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    " vipga= / gaip=
    "Plug 'junegunn/vim-easy-align'
    "
    " Theme / colors
    " kanagawa theme - greyish bg - riding the great wave...
    Plug 'rebelot/kanagawa.nvim'
    " ego theme - black bg
    " Plug 'geetarista/ego.vim'
    
    " Hierarchical file-explorer
    Plug 'preservim/nerdtree'
    " ...or load it on-demand
    " Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    
    " Fuzzy finder
    Plug 'airblade/vim-rooter'
    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Telescope and deps
    " https://github.com/nvim-telescope/telescope.nvim
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'

    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } 
    Plug 'sharkdp/fd'
    Plug 'burntsushi/ripgrep'

    " Semantic Language support / cmp-related (autocomplete)
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/lsp_extensions.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
    Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
    Plug 'hrsh7th/cmp-path', {'branch': 'main'}
    Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'hrsh7th/cmp-cmdline'

    " Only because nvim-cmp _requires_ snippets
    " For vsnip users:
    Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
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

    " Syntactic language support (Language Servers)
    " https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    Plug 'cespare/vim-toml', {'branch': 'main'}
    "Plug 'stephpy/vim-yaml'
    " Plug 'redhat-developer/yaml-language-server'
    Plug 'rust-lang/rust.vim'
    Plug 'rhysd/vim-clang-format'
    "Plug 'fatih/vim-go'
    "Plug 'dag/vim-fish'
    "Plug 'godlygeek/tabular'
    "Plug 'plasticboy/vim-markdown'
    
    " marksman, much more than markdown, but a zettlekasten thingy; install
    " binary from:
    " https://github.com/artempyanykh/marksman
    Plug 'artempyanykh/marksman'

    " JSON/YAML linter for creating automated style guides, with baked in support for OpenAPI v2 & v3:
    " not a lot of use of this one... and folds terribly...
    "Plug 'luizcorreia/spectral-language-server' 

    Plug 'phan/phan' "php
    Plug 'richterger/Perl-LanguageServer' "perlls
    "Plug 'sourcegraph/go-langserver'		     " go
    "Plug 'sourcegraph/javascript-typescript-langserver'
    Plug 'rcjsuen/dockerfile-language-server-nodejs'
    Plug 'mads-hartmann/bash-language-server'

    " 
    " " Any valid git URL is allowed
    " Plug 'https://github.com/junegunn/vim-github-dashboard.git'
    " 
    " " Multiple Plug commands can be written in a single line using | separators
    " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " 
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

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    " don't auto-exit with q if multiple buffers are open...
    noremap <C-q> :confirm qall<CR>
end

" colors, highlighting, etc ===========================================================
" deal with colors a la jonhoo...
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif
set background=dark
let base16colorspace=256
let g:base16_shell_path="~/dev/others/base16/templates/shell/scripts/"
"colorscheme base16-gruvbox-dark-hard
syntax on
hi Normal ctermbg=NONE

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

set hlsearch
" Ctrl+\ clears highlighting search results
nmap <C-\> <ESC>:nohlsearch<CR>
set cursorline

" treesitter ==================================================================
function! CurrentLineInfo()
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- list of parser names, or "all" 
  ensure_installed = { "rust", "go", "php", "html", "css", "perl", 
	"bash", "json", "markdown", "c", "lua", "vim", "help",
	"todotxt", "terraform", "sql", "regex", "mermaid", "markdown_inline", "ini", "diff",
	"comment", "dockerfile" 
    },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = true,
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

" remaps for Plugins ==========================================================
nnoremap <leader>ne <cmd>NERDTreeToggle<cr>

"let g:rooter_patterns = ['.git', '.dotfiles', 'Makefile']

"" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ga <Plug>(EasyAlign)
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)

" https://github.com/nvim-telescope/telescope.nvim#pickers
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" requires ripgrep:
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"
" nvim-cmp setup: https://github.com/hrsh7th/nvim-cmp
function! VimCmpLoader()
lua << EOFcmp
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local lspconfig = require'lspconfig'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine -- get rid of snippets as soon as we can...
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
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
    }, { 
	{ name = 'path' }, 
    }),
    experimental = {
	ghost_text = true,
    },
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
   --local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- vim.nvim-lspconfig.root_dir = util.find_git_ancestor

  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  lspconfig['phan'].setup {}
  lspconfig['perlls'].setup {}
  --lspconfig['spectral'].setup {}
  --lspconfig['yamlls'].setup {}
  lspconfig['marksman'].setup {}
  lspconfig['dockerls'].setup {}
  lspconfig['bashls'].setup {}
  --require('lspconfig').['phan'].setup {}
  --require('lspconfig').['perlls'].setup {}
  --require('lspconfig').['spectral'].setup {}
  --require('lspconfig').['marksman'].setup {}
  ----require('lspconfig').['go-langserver'].setup {}
  ----require('lspconfig').['javascript-typescript-langserver'].setup {}
  --require('lspconfig').['dockerls'].setup {}
  --require('lspconfig').['bashls'].setup {}


-- Enable completing paths in :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

-- Setup lspconfig.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end


  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      completion = {
	postfix = {
	  enable = false,
	},
      },
    },
  },
  capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

EOFcmp
endfunction

call VimCmpLoader()

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
autocmd CursorHold,CursorHoldI *.pl :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
autocmd CursorHold,CursorHoldI *.pm :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
autocmd CursorHold,CursorHoldI *.js :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
autocmd CursorHold,CursorHoldI *.php :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Javascript
let javaScript_fold=0

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" Don't confirm .lvimrc
let g:localvimrc_ask = 0

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=1
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Sane splits
set splitright
set splitbelow

" proper search
set incsearch

" =============================================================================
" # GUI settings
" =============================================================================
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set colorcolumn=80 " and give me a colored column
set laststatus=2
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.
au TextYankPost * silent! lua vim.highlight.on_yank() " Highlight yank

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Jump to start and end of line using the home row keys
map H ^
map L $

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" Open new file adjacent to current file
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Folding (when in nvim, use treesitter) ======================================
" enable folding, and fold every indented blocks
" how to use zi/zm/zr >>> :help folding
set foldenable
set foldmethod=indent
set foldlevel=1

" treesitter folding is a mess... try out again later when more stable
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" " set foldexpr=getline(v:lnum)[0]==\"\\t\"
" set nofoldenable                     " Disable folding at startup.

" <space><Tab> to toggle folds.
nnoremap <leader><Tab> za
vnoremap <leader><Tab> za

" scratchbuffers ==============================================================
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

" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *-ori set readonly
autocmd BufRead *-old set readonly
autocmd BufRead *-pre set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.yaml set filetype=yaml
autocmd BufRead *.yml set filetype=yaml
autocmd BufRead *.pl set filetype=perl
autocmd BufRead *.pm set filetype=perl
autocmd BufRead *.qf3 set filetype=php
autocmd BufRead *.qfx set filetype=php

" Script plugins
autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim

" Run after "doing all the startup stuff"
autocmd VimEnter * call StartingVim()

