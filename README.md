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
yum install -y git ctags

# vim配置及初始化
cp e-vim.vimrc ~/.vimrc
vim +PlugInstall
```
#### Debian Linux

```sh
# 安装依赖包
apt-get install git ctags

# vim配置及初始化
cp e-vim.vimrc ~/.vimrc
vim +PlugInstall
```

### 使用技巧

### Leader按键
Leader按键被定义为','符号

### undo & redo

* u 撤销
* ctrl + r 反撤销


#### 标签页
```
1. 新建标签
nnoremap <C-n> :tabnew<CR> 

2. 关闭标签
nnoremap <C-x> :tabclose<CR>

3. 移动到前一个标签
nnoremap <S-Left> :tabprevious<CR>

4. 移动到下一个标签
nnoremap <S-Right> :tabnext<CR>

```

#### 分屏窗口

开启或者关闭分屏
```
1. 垂直分屏
:vs [file2]

2.水平分屏
:sv [file2]

3. 新建文件水平分屏
:new [newfile]
```

分屏窗口默认操作快捷键如下：
```
1. 把光标移到下一个屏中
ctrl+w w

2. 把光标移到上一个屏中
ctrl+w p

3. 把光标移到右边的屏中
ctrl+w l

4. 把光标移到左边的屏中
ctrl+w h

5. 把光标移到上边的屏中
ctrl+w k

6. 把光标移到下边的屏中
ctrl+w j

7. 减少当前窗口高度（对上下分屏才有用）
ctrl+w - 亲测字体大小会发生变化

8. 增加当前窗口高度（对上下分屏才有用）
ctrl+w + 亲测字体大小会发生变化

9. 增加当前窗口宽度（对左右分屏才有用）
ctrl+w > 按完ctrl w 后松开,同时按下shift >

10. 减少当前窗口宽度（对左右分屏才有用）
ctrl+w < 按完ctrl w 后松开,同时按下shift <

11. 使所有窗口恢复均等
ctrl+w =

12. 关闭除当前分屏外的其他分屏
ctrl+w o(最后一个分屏不能用此快捷键关闭)

13. 关闭当前分屏
ctrl+w c (最后一个分屏不能用此快捷键关闭)

14. 关闭当前分屏
ctrl+w q (可用来关闭最后一个分屏)

15. 向右移动
ctrl+w L

16. 向左移动
ctrl+w H

17. 向上移动
ctrl+w K

18. 向下移动
ctrl+w J

19. 向下旋转窗口
ctrl+w r

20. 向上旋转窗口
ctrl+w R

21. 当前窗口与下一个窗口对调
ctrl+w x
```

重新定义调整分屏窗口的大小快捷键:

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
1. 开启文件树分屏窗口
map <Leader>n <plug>NERDTreeTabsToggle<CR>
```

#### Tagbar符号列表
```
1. 开启符号列表分屏窗口
nmap <Leader>t :TagbarToggle<CR>
```

#### 开启git diff显示
```
nnoremap <leader>gs :GitGutterToggle<CR>
```

#### 清除多余空格

```
map <leader><space> :FixWhitespace<cr>
```

### 相对行号

numbertoggle插件开启关闭快捷键，参考:help numbertoggle
```
nnoremap <silent> <C-L> :set relativenumber!<cr>
```
### Quickfix窗口

一般在输入:make的时候会自动弹出quickfix窗口，开启或者关闭quickfix窗口, 下面快捷键重新定义了quickfix窗口的开启和关闭
```
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
```
quickfix窗口默认快捷键

```
:copen 打开Quickfix窗口
:cclose 关闭Quickfix窗口
:cn 跳到下一个Error的所在行
:cp 调到上一个Error的所在行
```
重定义错误切换快捷键
```
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cp>
```

### ctags

1. 在源代码目录下执行ctags -R .
2. ctrl + ], 找到光标所在位置的标签定义的地方
3. Ctrl + T, 回到跳转之前的标签处

### 参考
- [k-vim](https://github.com/wklken/k-vim)
- [amix/vimrc](https://github.com/amix/vimrc)
