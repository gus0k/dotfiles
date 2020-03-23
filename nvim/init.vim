call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips' " Snippets
Plug 'honza/vim-snippets' " More snippets
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

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


" Relative numbers
set nu rnu
set wildmode=longest,list   " get bash-like tab completions

filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
set textwidth=80

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

"" SPELLING 
imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u
set spell
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
set spellfile=$HOME/.config/nvim/spell/es.utf-8.add

""switch spellcheck languages
let g:myLang = 0
let g:myLangList = [ "nospell", "es_es", "en_us" ]
function! MySpellLang()
  "loop through languages
  let g:myLang = g:myLang + 1
  if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
  if g:myLang == 0 | set nospell | endif
  if g:myLang == 1 | setlocal spell spelllang=es_es | endif
  if g:myLang == 2 | setlocal spell spelllang=en_us | endif
  echo "language:" g:myLangList[g:myLang]
endf

map <F7> :call MySpellLang()<CR>
imap <F7> <C-o>:call MySpellLang()<CR>" COLORS

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

