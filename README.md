### 介绍

我平时一般用css/js/html做前端开发，go/python做后端开发，c/c++做系统开发，git做SCM工具，所以我参考[k-vim](https://github.com/wklken/k-vim)等项目做了一个简单的vim定制。

#### 重载的默认快捷键

#### 标签页
```
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>
```
#### 分屏窗口调整大小
nmap`
```
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>
```
### 依赖

#### Mac OS
```sh
brew install git ctags the_silver_searcher
```
#### CentOS Linux
```sh
yum install -y epel-release && yum -y update
yum install -y git ctags the_silver_searcher
```

### 安装

```sh
cp evim.vimrc ~/.vimrc
vim +PlugInstall
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
