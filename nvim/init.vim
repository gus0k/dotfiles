filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
call plug#begin('~/.vim/plugged')

"" Snippets
Plug 'SirVer/ultisnips' " Snippets
Plug 'honza/vim-snippets' " More snippets
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jpalardy/vim-slime'

"" Latex only
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

"" Markdown only
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'vimwiki']}
Plug 'iamcco/markdown-preview.nvim', {'for': ['markdown', 'vimwiki'], 'do': { -> mkdp#util#install() } }

Plug 'vimwiki/vimwiki'

"" Autocompletition
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

let g:python3_host_prog = '/home/guso/.config/nvim/venv/bin/python'

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif

set undodir=/tmp/.vim-undo-dir
set undofile

set noswapfile                  " Don't use swapfile
set nobackup			" Don't create annoying backup files
set nowritebackup

au FocusLost * :wa              " Set vim to save the file on focus out.


" Relative numbers
set nu rnu
set wildmode=longest,list   " get bash-like tab completions
set textwidth=80

set tabstop=4
set shiftwidth=4
set expandtab


"" Moving around virtual lines
nnoremap j gj
nnoremap k gk

"" AUTOCOMPLETITION
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

"" LATEX Specific
let g:tex_flavor = "latex"

au BufNewFile,BufRead *.md,*.markdown,*.mmd setlocal filetype=markdown

"" SNIPPETS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]



"" VIMWIKI
let g:vimwiki_table_mappings=0
let g:vimwiki_global_ext=0
let wiki_1 = {}
let wiki_1.path = '~/github/vimwiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

let g:mkdp_browser = 'firefox'

"" COPY-PASTE
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

