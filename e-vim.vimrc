"Leader
let mapleader = ','
let g:mapleader = ','

" Basic
syntax on
set backspace=indent,eol,start
set history=2000
filetype on
filetype plugin on
filetype indent on
set title
"set ruler                   " 打开状态栏标尺
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set nobackup "不创建备份文件
set noswapfile "不创建交换文件
set nowritebackup " 表示编辑的时候不需要备份文件
set novisualbell "进入virutal模式，不要发出响声
set noerrorbells "出错时，不要发出响声
set ruler
set showcmd
set showmode "输入的命令显示出来
set showmatch "设置匹配模式, 相当于括号匹配
set wildmenu
"set cursorline
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
set nocompatible "close compatible mode
set shiftwidth=4 " Indents will have a width of 4

" 标签页, 总是显示
set showtabline=2

" Theme
set background=dark
"colorscheme desert

" enable true color
if (has("termguicolors"))
    set termguicolors
endif

" Mouse
set mouse=

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2


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

    " 快速加入修改环绕字符
    " for repeat -> enhance surround.vim, . to repeat command
    Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
    " trailingwhitespace
    " 快速去行尾空格 [, + <Space>]
    Plug 'bronson/vim-trailing-whitespace'
    " easyalign
    " 快速赋值语句对齐
    Plug 'junegunn/vim-easy-align'

    "代码结构浏览
    Plug 'majutsushi/tagbar'
    "文件系统浏览器
    Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
    "根据文件内容查找文件
    Plug 'mhinz/vim-grepper'

    " 主题 solarized
    " solarized
    Plug 'altercation/vim-colors-solarized'

    " Golang
    Plug 'fatih/vim-go', {'for': 'go'}
    " Rust
    Plug 'rust-lang/rust.vim', {'for': 'rs'}
    " Python
    Plug 'hdima/python-syntax'
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'Glench/Vim-Jinja2-Syntax'
    " Json
    Plug 'elzr/vim-json', {'for': 'json'}
    " Markdown
    Plug 'plasticboy/vim-markdown', {'for': 'md'}

call plug#end()

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

" json {{{
    let g:vim_json_syntax_conceal = 0
" }}}

" solarized {{{
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    let g:solarized_termcolors=256
" }}}

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
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    " 默认窗口size
    let g:NERDTreeWinSize = 20

    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '^[.][[dir]]', 'vendor$[[dir]]', '\.DS_Store$[[file]]', '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " open a NERDTree when vim starts up if no files were specified?
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " open NERDTree when vim starts up on opening a directory
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

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

" 键盘映射
" 移除行尾空格
" trailingwhitespace {{{
    map <leader><space> :FixWhitespace<cr>
" }}}

" easyalign
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>'  },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }


" Tab pages
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>

" 分屏窗口调整大小
nmap    h=  :resize +3<CR>
nmap    h-  :resize -3<CR>
nmap    w,  :vertical resize -5<CR>
nmap    w.  :vertical resize +5<CR>

" Tagbar 快捷键
nmap <Leader>t :TagbarToggle<CR>

" nerdtreetabs 快捷键
map <Leader>n <plug>NERDTreeTabsToggle<CR>


" vim-grepper插件
nnoremap <leader>g :Grepper -tool ag<cr>


