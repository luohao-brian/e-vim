"Leader
let mapleader = ','
let g:mapleader = ','

" Basic
syntax on
set backspace=indent,eol,start
set history=2000
set nocompatible
filetype on
filetype plugin on
filetype indent on
set magic
set title
set nobackup
set novisualbell
set noerrorbells
set ruler
set showcmd
set showmode
set showmatch
set wildmenu
set cursorline
set nu
set guifont=*
set t_ti= t_te=
set encoding=utf-8
set termencoding=utf-8
set ffs=unix,dos,mac
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab
set expandtab
set smarttab
set shiftround

" Indent
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Theme
set background=dark
colorscheme desert

" Vim-Plug auto-install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    " lightline
    Plug 'itchyny/lightline.vim'
    " rainbow_parentheses
    " 括号显示增强
    Plug 'kien/rainbow_parentheses.vim'
    " 自动补全单引号，双引号等
    Plug 'Raimondi/delimitMate'
    " 自动补全html/xml标签
    Plug 'docunext/closetag.vim', { 'for': ['html', 'xml'] }

    " quick edit
    " 快速注释
    Plug 'scrooloose/nerdcommenter'

    " 快速加入修改环绕字符
    " for repeat -> enhance surround.vim, . to repeat command
    Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
    " trailingwhitespace
    " 快速去行尾空格 [, + <Space>]
    Plug 'bronson/vim-trailing-whitespace'
    " easyalign
    " 快速赋值语句对齐
    Plug 'junegunn/vim-easy-align'

    " git
    " fugitive
    Plug 'tpope/vim-fugitive'
    " gitgutter
    Plug 'airblade/vim-gitgutter'

    " tagbar
    Plug 'majutsushi/tagbar'

    "全局搜索，support by the_silver_searcher
    Plug 'mileszs/ack.vim'

    " 主题 solarized
    " solarized
    Plug 'altercation/vim-colors-solarized'
    " nerdtree nerdtreetabs
    Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
    " Golang
    Plug 'fatih/vim-go', {'for': 'go'}
    " Rust
    Plug 'rust-lang/rust.vim', {'for': 'rs'}
    " Python
    Plug 'hdima/python-syntax'
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'Glench/Vim-Jinja2-Syntax'
    " Javascript
    Plug 'othree/yajs.vim' | Plug 'pangloss/vim-javascript'
    " Json
    Plug 'elzr/vim-json', {'for': 'json'}
    " CSS
    Plug 'groenewege/vim-less'
    " Markdown
    Plug 'plasticboy/vim-markdown', {'for': 'md'}
    " Nginx
    Plug 'chr4/nginx.vim'
call plug#end()

" lightline {{{
    set laststatus=2
    if !has('gui_running')
        set t_Co=256
    endif
    set noshowmode
    let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" }}}

" vimgo {{{
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    let g:go_fmt_fail_silently = 1
    " format with goimports instead of gofmt
    let g:go_fmt_command = "goimports"
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'java'] }
" }}}

" rust {{{
    let g:rustfmt_autosave = 1
" }}}

" pythonsyntax {{{
     let python_highlight_all = 1
" }}}

" markdown {{{
    let g:vim_markdown_folding_disabled=1
" }}}

" javascript {{{
    " pangloss/vim-javascript
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
" }}}

" json {{{
    let g:vim_json_syntax_conceal = 0
" }}}

" css {{{
" }}}

" solarized {{{
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    let g:solarized_termcolors=256
" }}}

" ack {{{
    "ACK配置
    let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}
"
" rainbow_parentheses {{{
    " 不加入这行, 防止黑色括号出现, 很难识别
    " \ ['black',       'SeaGreen3'],
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" }}}

" nerdtree nerdtreetabs {{{
    " map <leader>n :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " open a NERDTree when vim starts up if no files were specified?
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " open NERDTree when vim starts up on opening a directory
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'

    " 关闭同步
    " let g:nerdtree_tabs_synchronize_view=0
    " let g:nerdtree_tabs_synchronize_focus=0
    " 是否自动开启nerdtree
    " thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0
" }}}

" delimitMate {{{
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
    " 关闭某些类型文件的自动补全
    "au FileType mail let b:delimitMate_autoclose = 0
" }}}

" closetag {{{
    let g:closetag_html_style=1
" }}}

" nerdcommenter {{{
    let g:NERDSpaceDelims=1
    let g:NERDAltDelims_python = 1
" }}}

" trailingwhitespace {{{
    map <leader><space> :FixWhitespace<cr>
" }}}

" easyalign {{{
    vmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
    endif
    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
    " Default:
    " If a delimiter is in a highlight group whose name matches any of the followings, it will be ignored.
    let g:easy_align_ignore_groups = ['Comment', 'String']
" }}}

" 标签导航
" tagbar {{{
    let g:tagbar_autofocus = 1
    " let g:tagbar_autoshowtag = 1
    " let g:tagbar_show_visibility = 1

    " go语言的tagbar配置
    " 1. install gotags 'go get -u github.com/jstemmer/gotags'
    " 2. make sure `gotags` in you shell PATH, you can call check it with `which gotags`
    " for gotags. work with tagbar
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
" }}}

" fugitive {{{
    " :Gdiff  :Gstatus :Gvsplit
    " not ready to open
    " <leader>gb maps to :Gblame<CR>
    " <leader>gs maps to :Gstatus<CR>
    " <leader>gd maps to :Gdiff<CR>  和现有冲突
    " <leader>gl maps to :Glog<CR>
    " <leader>gc maps to :Gcommit<CR>
    " <leader>gp maps to :Git push<CR>
" }}}

" gitgutter {{{
    " 同git diff,实时展示文件中修改的行
    " 只是不喜欢除了行号多一列, 默认关闭,gs时打开
    let g:gitgutter_map_keys = 0
    let g:gitgutter_enabled = 0
    let g:gitgutter_highlight_lines = 1
    nnoremap <leader>gs :GitGutterToggle<CR>
" }}}

" Keymaps
" Tab pages
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>

" 分屏窗口调整大小
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>

" 分屏窗口快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-K> <C-W><C-K>

" quickfix window快捷键
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" Tagbar 快捷键
nmap <Leader>t :TagbarToggle<CR>

" nerdtreetabs 快捷键
map <Leader>n <plug>NERDTreeTabsToggle<CR>
