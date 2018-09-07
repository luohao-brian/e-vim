### 介绍

我平时一般用css/js/html做前端开发，go/python做后端开发，c/c++做系统开发，git做SCM工具, 这是我的vim配置。

### 安装

#### Mac OS

```sh
# 安装依赖包
brew install git ctags the_silver_searcher

# vim配置及初始化
cp e-vim.vimrc ~/.vimrc
vim +PlugInstall
```
#### CentOS Linux

```sh
# 安装依赖包
yum install -y epel-release && yum -y update
yum install -y git ctags the_silver_searcher

# vim配置及初始化
cp e-vim.vimrc ~/.vimrc
vim +PlugInstall
```
#### Debian Linux

```sh
# 安装依赖包
apt-get install git ctags silversearcher-ag

# vim配置及初始化
cp e-vim.vimrc ~/.vimrc
vim +PlugInstall
```

### 使用技巧

#### 标签页
```
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>
```

#### 分屏窗口

分屏窗口快捷键重定义如下：
```
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-K> <C-W><C-K>
```
调整分屏窗口的大小:
```
"垂直调节
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
"水平调节
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>
```

#### NERDTree文件列表

```
map <Leader>n <plug>NERDTreeTabsToggle<CR>
```

#### Tagbar符号列表
```
nmap <Leader>t :TagbarToggle<CR>
```

#### 全局搜索
```
:Ack Keyword
```
使用Ack插件支持全局搜索，调用ag命令，弹出quickfix window:

```
:cn     下一条
:cp     上一条
:ccl    关闭quickfix
:cope   重新开启quickfix
:CTRL+j 切换到quickfix
:CTRL+k 切换回编辑窗口
```

#### 开启git diff显示
```
nnoremap <leader>gs :GitGutterToggle<CR>
```

#### 清除多余空格

```
map <leader><space> :FixWhitespace<cr>
```

### FAQ

#### git commit打印未知命令错误

```
E538: No mouse support: mouse=a
line   68:
E492: Not an editor command:     Plug 'vim-airline/vim-airline'
line   69:
......
```

git默认的编辑器命令为vi, 不兼容vim配置语法，可以配置git编辑器为vim
```
git config --global core.editor vim

```

### 参考
- [k-vim](https://github.com/wklken/k-vim)
- [amix/vimrc](https://github.com/amix/vimrc)
