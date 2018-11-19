"Shortcuts
"In the following I will list some of the most important shortcuts just added. For more shortcuts refer to the plugin documentation.

"F3 - Toggle 目录树-NERDTree
"F4 - Search Ack: 使用`Ag`进行搜索字符串
"F6 - 一键`格式化`整个文件
"F8 - Toggle Tagbar
"F9 - Toggle Paste 切换`粘贴模式`
"Ctrl-n - Toggle NERDTree(Normal Mode) 
"Ctrl-P - search file 
"\g - Goto definition in YouCompleteMe
"Tab - Complete / Jump to next completion mark
"Shift-Tab - Jump to last completion mark
"YouCompleteMe 
"Ctrl+N, 下一个，完成
"Ctl+P, 上一个
"UltiSnips 
"Tab - 自动完成code snip
"Shift-Tab 上一个code Snip

"支持UTF-8编码
set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required


" 支持系统剪切板
set clipboard=unnamed
nnoremap <F9> :set invpaste paste?<CR>
set pastetoggle=<F9>
set showmode

"设置行号
"set nu
"set number

" 设置颜色
" 确保`airline`,会有`颜色条`。
set t_Co=256

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" visual block replace
" `:B cmd` eg: `:B s/srd/dst/`
Plugin 'vim-scripts/vis'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" UsingVimWithDjango
" Vim Modeline
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"分割布局（Split Layouts）
" Ctrl-j 切换到下方的分割窗口
" Ctrl-k 切换到上方的分割窗口
" Ctrl-l 切换到右侧的分割窗口
" Ctrl-h 切换到左侧的分割窗口
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"代码折叠（Code Folding）
"`开启`折叠功能
set foldmethod=indent
set foldlevel=99
"你必须手动输入`za`来`折叠`（和`取消折叠`）。
"使用`空格键`,启用折叠。
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
""专业贴士: 希望看到折叠代码的`文档字符串`？
let g:SimpylFold_docstring_preview=1

"Python代码缩进
"要支持`PEP8风格`的缩进，请在`.vimrc文件`中添加下面的`代码`：
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

"自动缩进
"自动缩进有用，但是在某些情况下（比如函数定义有多行的时候），并不总是会达到你想要的效果，
"尤其是在符合`PEP8标准`方面。
"我们可以利用indentpython.vim插件，来解决这个问题：
Plugin 'vim-scripts/indentpython.vim'


" 对`BadWhitespace`进行声明,否则后面`Match BadWhitespace`会报错
"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred

"`标示`不必要的`空白字符`
"我们希望避免出现多余的`空白字符`。
"可以让`Vim`帮我们`标示`出来，使其很容易发现并`删除`。
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"这会将多余的`空白字符``标示`出来，很可能会将它们变成`红色``突出`。


" Plugin 'mattn/emmet-vim'
Plugin 'mattn/emmet-vim'

"Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" 目录树插件
Plugin 'scrooloose/nerdtree'
" 这个插件可以显示文件的Git增删状态
Plugin 'Xuyuanp/nerdtree-git-plugin'

"Ctrl+N 打开/关闭
"map <C-n> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>
" 当不带参数打开Vim时`自动加载``项目树`
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时,`关闭`项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in
" NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
"let NERDTreeMinimalUI=1
" 使用方向键，展开目录
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


"" 全局搜索
"Plugin 'kien/ctrlp.vim'
"" 后按下C-P，便可以全局搜索啦。
"" 使用C-j,C-k上下翻页，<Enter>打开选中文件。
"let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*.pyc
""let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
"" 忽略一些后缀名，例如，jgp,png.jpeg,so,exe,dll等。
"" 目录，我们要额外过滤`staticfiles`目录，这是
"" Django中执行`python manage.py
"" colleoctstatic`命令，会生成的`目录`--`staticfiles`
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/.git/*,*/staticfiles/*
"let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll|jpg|png|jpeg)$'}
""let g:ctrlp_custom_ignore = 'tmp$|.git$|.hg$|.svn$|.rvm$|.bundle$|vendor'

" 酷炫的`状态栏` airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme="luna"
"字体设置
let g:airline_powerline_fonts = 1

 "打开`tabline`功能,方便查看`Buffer`和`切换`，这个功能比较不错"
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1

 "设置切换Buffer快捷键"
 nnoremap <C-N> :bn<CR>
 "nnoremap <C-P> :bp<CR>

 " 关闭`状态`显示`空白符号`计数,这个对我用处不大"
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#symbol = '!'

Plugin 'hail2u/vim-css3-syntax'

"Javascript
"JavaScript 语法高亮只需要引入这个插件：
Plugin 'pangloss/vim-javascript'
let javascript_enable_domhtmlcss = 1

"Plugin 'nathanaelkane/vim-indent-guides'


" 注释、反注释
" `NERDCommenter`是个不错的工具，支持非常多的语言：
Plugin 'scrooloose/nerdcommenter'   " commenter: \cc \cu
"然后按下\cc来注释当前航，\cu来反注释，\c<space>来切换注释。 "其中的\\是可以设置的：
"let mapleader=';'

" 搜索字符串
" ag: Silver Searcher
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
" 在普通模式下输入`F4`,便可以自动输入`:Ack`
map <F4> :Ack<space>

" vim-unimpaired
Plugin 'tpope/vim-unimpaired'

" `Tab键`实现`自动补全`，`代码片段补全`
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"YCM server interpreter
"let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_server_python_interpreter='/home/user/project/workshop/py3env/bin/python3'

" YCM python interpreter

let g:ycm_python_interpreter_path = '/home/user/project/workshop/py3env/bin/python3'
let g:ycm_python_sys_path = ['/home/user/project/workshop/py3env/lib/python3.5/site-packages']
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" 自动补全插件YCM
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" add a few customizations
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"The former line ensures that the autocomplete window goes away when you’re done with it, 
"and the latter defines a shortcut for goto definition.
"My leader key is mapped to space, so space-g will goto definition of whatever
"I’m currently on. Helpful when exploring new code.


"括号/引号匹配
"括号和引号的自动补全和智能匹配。例如：
"
"输入前大括号补全后大括号
"在一对括号之间回车，自动分为3行并调整缩进
"输入前引号自动补全后引号
"凡此种种。。。我觉的第二条是最实用的功能，尤其是写函数和类的时候。
"
"上述的各种括号、引号匹配都可以用delimitMate来解决，官网：
"
"https://github.com/Raimondi/delimitMate
"
"delimitMate可以通过Vundle的形式安装。在~/.vimrc添加Plugin
"'Raimondi/delimitMate'并PluginInstall，重新打开Vim后括号就可以自动补全啦！
"Plugin 'Raimondi/delimitMate'

"Formatter
"`格式化程序`
" 每次按下`F6`,便可以`格式化代码`
Plugin 'Chiel92/vim-autoformat'
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatter_yapf_style = 'pep8'


" 使用`ctags`做索引
" 提供给`YouCompleteMe`
set tags=tags

" tagbar
Plugin 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F8> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启
"autocmd BufReadPost *.py call tagbar#autoopen() "如果是python语言的程序的话，tagbar自动开启

" ctrlsf
Plugin 'dyng/ctrlsf.vim'
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>



" indentLine
" `缩进指示线`
" 由纯`字符`实现，效果比较完美。
" 由于`python`是靠`代码缩进`来判断`代码块`的，因此缩进指示的功能有多方便就不言而喻了。
" `indentLine`默认是`关闭`的，因此需要在`.vimrc`中`配置`才能看到效果。
Plugin 'Yggdroot/indentLine'
"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

" 为括号添加颜色
Plugin 'kien/rainbow_parentheses.vim'
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
    \ ['black',       'SeaGreen3'],
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

" 安装vim-markdown插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

Plugin 'suan/vim-instant-markdown'
"sudo apt-get update
"sudo apt-get install nodejs
"sudo apt-get install npm
"nodejs -v
"安装instant-markdown-d
"sudo npm -g install instant-markdown-d

" fzf
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
nnoremap <silent> <C-p> :Files<CR>


""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
