call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips' " Snippets
Plug 'honza/vim-snippets' " More snippets
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'

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
set wildmode=longest,list   " get bash-like tab completions

"" AUTOCOMPLETITION
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

"" LATEX Specific

let g:tex_flavor = "latex"

"" SNIPPETS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


