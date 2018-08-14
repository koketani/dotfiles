call plug#begin()

tnoremap <silent> <ESC> <C-\><C-n>

"" general
Plug 'chriskempson/base16-vim'
Plug 'Shougo/vimshell'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
Plug 'terryma/vim-multiple-cursors'
" Plug 'junegunn/vim-easy-align'
" Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" autocmd FileType python
"        \ call deoplete#custom#buffer_option('auto_complete', v:false)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

"" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" general syntax
Plug 'w0rp/ale'
let g:ale_lint_delay = 1000
let g:ale_linters_explicit = 1
" gem install rubocop
" pip install flake8 yamllint
let g:ale_linters = {
    \ 'javascript': ['eslint', 'prettier'],
    \ 'python': ['flake8'],
    \ 'ruby': ['rubocup'],
    \ 'typescript': ['tslint', 'prettier'],
    \ 'yaml': ['yamllint']
    \ }
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 0

"" template
Plug 'mattn/sonictemplate-vim'
let g:sonictemplate_vim_template_dir = [
    \ '$HOME/.config/nvim/plugged/sonictemplate-vim/template',
    \ '$HOME/.dotfiles/template'
    \]

"" cpp
" apt install clang llvm build-essentials
Plug 'vim-jp/vim-cpp', { 'for': ['c', 'cpp'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
let g:deoplete#sources#clang#std = { 'cpp': 'c++14' }

"" golang
Plug 'fatih/vim-go'

"" scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

"" python
" Plug 'nvie/vim-flake8', { 'for': 'python' }
" Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
let g:jedi#force_py_version=3

"" java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

"" toml
Plug 'cespare/vim-toml', { 'for': 'toml' }

"" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" https://github.com/rust-lang-nursery/rustfmt#installation
let g:rustfmt_autosave = 1

"" docker
Plug 'honza/dockerfile.vim'

call plug#end()

"" coloring
colorscheme base16-ocean
"" numbering
set number
set ruler
" set spell
"" clipboard; share vim's yank and mac's clipboard
set clipboard+=unnamedplus
