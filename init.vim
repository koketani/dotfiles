""" junegunn/vim-plug
call plug#begin()
"" general
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
Plug 'chriskempson/base16-vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'junegunn/vim-easy-align'
" Plug 'jiangmiao/auto-pairs'
"" for uri open (vim has similar feature, but it is only for url)
Plug 'tyru/open-browser.vim'
nmap gx <Plug>(openbrowser-open)

"" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
"" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"" run command
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'thinca/vim-quickrun'
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
    \ 'runner'    : 'vimproc',
    \ 'runner/vimproc/sleep': 50,
    \ 'runner/vimproc/updatetime' : 60,
    \ 'runner/vimproc/read_timeout': 100,
    \ 'outputter' : 'error',
    \ 'outputter/error/success' : 'buffer',
    \ 'outputter/error/error'   : 'quickfix',
    \ 'outputter/buffer/split'  : ':rightbelow 8sp',
    \ 'outputter/buffer/close_on_empty' : 1,
    \ }
let g:quickrun_config.cpp = {
    \ 'command' : 'clang++',
    \ 'cmdopt' : '-std=c++14 -g -Wall -Wextra -O2',
    \ }
let g:quickrun_no_default_key_mappings = 1
"" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"" lint/fix/completion/definition/reference/hover/symbol by ale
Plug 'w0rp/ale'
let g:ale_lint_delay = 1000
let g:ale_linters_explicit = 1
"" requisite: pip install flake8 yamllint proselint
""            npm install -g jsonlint
""            npm install -g eslint
""            npm install -g tsserver tslint
""            npm install -g markdownlint-cli
""            apt install tidy
""            apt install golint
let g:ale_linters = {
    \ 'cpp': ['clang'],
    \ 'go': ['golint', 'govet'],
    \ 'html': ['tidy'],
    \ 'json': ['jsonlint'],
    \ 'javascript': ['eslint'],
    \ 'markdown': ['markdownlint', 'proselint'],
    \ 'python': ['flake8'],
    \ 'text': ['proselint'],
    \ 'typescript': ['tslint'],
    \ 'yaml': ['yamllint']
    \ }
""    \ 'typescript': ['tslint', 'tsserver'],
let g:ale_cpp_clang_executable = 'clang++'
let g:ale_cpp_clang_options = '-std=c++14 -g -Wall -Wextra -O2'
"" requisite: npm install -g prettier eslint tslint prettier
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'cpp': ['clang-format'],
    \ 'go': ['gofmt'],
    \ 'html': ['prettier'],
    \ 'javascript': ['eslint'],
    \ 'json': ['prettier']
    \ }
"    \ 'typescript': ['tslint', 'prettier'],
let g:ale_fix_on_save = 0
let g:ale_cpp_clangformat_options = '-style=google'
let g:ale_completion_enabled = 0
"" template
Plug 'mattn/sonictemplate-vim'
let g:sonictemplate_vim_template_dir = '$HOME/.dotfiles/template'
"" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
let g:lsp_async_completion = 1
" for debugging
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand("~/.vim-lsp.log")
"" cpp
"" requisite: apt install clang llvm build-essentials clang-tools
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
let g:go_gocode_propose_builtins = 0
"" scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
"" java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
"" toml
Plug 'cespare/vim-toml', { 'for': 'toml' }
"" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" https://github.com/rust-lang-nursery/rustfmt#installation
let g:rustfmt_autosave = 1
"" typescript
Plug 'leafgarland/typescript-vim', { 'type': 'typescript' }
"" docker
Plug 'honza/dockerfile.vim'
"" plantuml
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
let g:slumlord_separate_win = 1
"" markdown, restructured text, textile, asciidoc
"" along with tyru/open-browser.vim
Plug 'previm/previm'
call plug#end()


""" basic settings

"" allocate space as leader key
let mapleader = ' '
let maplocalleader = ' '
"" key mappings
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>f :ALEFix<cr>
nnoremap <leader>d :LspDefinition<cr>
nnoremap <leader>h :LspHover<cr>
nnoremap <leader>rn :LspRename<cr>
nnoremap <leader>rf :LspReference<cr>
nnoremap <leader>td :LspTypeDefinition<cr>

"" coloring: just make sure and load from background
colorscheme base16-ocean
"" numbering
set number
set ruler
" set spell
set clipboard&
set clipboard^=unnamedplus
set autoindent
set cindent
set noswapfile

""" language
"" c++
"" set cpp's indent size according to clang-format
"" check `cinoptions-values`
autocmd Filetype cpp setlocal sw=2 sts=2
"" setu cpp's lsp
"" requisuite: clangd
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
"" python
"" set python's lsp
"" requisite: pip install python-language-server
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
"" golang
"" set golang's lsp
"" requisite: go get -u golang.org/x/tools/cmd/gopls
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif
"" requisite: go get -u github.com/sourcegraph/go-langserver
"" if executable('go-langserver')
""     au User lsp_setup call lsp#register_server({
""         \ 'name': 'go-langserver',
""         \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
""         \ 'whitelist': ['go'],
""         \ })
"" endif
"" typescript
"" set lsp for js and ts
"" requisite: npm install -g typescript typescript-language-server
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server-ts',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server-js',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \ })
endif
"" java
"" set lsp for java
"" requisite: https://download.eclipse.org/jdtls/milestones
if executable('java')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     '/usr/bin/java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-classpath /opt/maven/boot/plexus-classworlds-2.6.0.jar',
        \     '-jar',
        \     fnamemodify("~", ":p") . '/.eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.200.v20180922-1751.jar',
        \     '-configuration',
        \     fnamemodify("~", ":p") . '/.eclipse.jdt.ls/config_linux',
        \     '-data',
        \     fnamemodify("~", ":p") . '/.eclipse.jdt.ls/workspace'
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif
