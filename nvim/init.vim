call plug#begin('~/.vim/plugged')

" Multiple Plug commands can be written in a single line using | separators Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'
call plug#end()

" Use the system clipboard
set clipboard=unnamedplus

" Deoplete configuration
let g:deoplete#enable_at_startup = 1

" Configure deoplete-jedi
"" Close preview automatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:python3_host_prog = '/home/guso/venv_neovim/bin/python'

:filetype on
set syntax

set number relativenumber


autocmd BufReadPost,BufNewFile *.tex setfiletype=tex
let g:tex_flavor='latex'

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
