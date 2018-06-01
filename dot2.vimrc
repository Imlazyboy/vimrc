"支持UTF-8编码
"大部分情况下，进行Python开发时你应该使用UTF-8编码，尤其是使用Python 3的时候。确保Vim设置文件中有下面的命令：
set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

"参考文件来自：
"Harttle Land
"《在VIM下写C++能有多爽？ Vim-Practice》
"https://harttle.land/2015/07/18/vim-cpp.html


"设置行号
"set nu
set number



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
"
"


" UsingVimWithDjango
" Vim Modeline
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"分割布局（Split Layouts）
""split navigations
" https://www.jianshu.com/p/bc19b91354ef
" 组合快捷键：
"
" Ctrl-j 切换到下方的分割窗口
" Ctrl-k 切换到上方的分割窗口
" Ctrl-l 切换到右侧的分割窗口
" Ctrl-h 切换到左侧的分割窗口
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"代码折叠（Code Folding）
"大多数“现代”集成开发环境（IDE）都提供对方法（methods）或类（classes）进行折叠的手段，只显示类或方法的定义部分，而不是全部的代码。
"
"你可以在.vimrc中添加下面的代码开启该功能
" Enable folding
set foldmethod=indent
set foldlevel=99
"这样就可以实现，但是你必须手动输入za来折叠（和取消折叠）。使用空格键会是更好的选择。所以在你的配置文件中加上这一行命令吧：
"" Enable folding with the spacebar
nnoremap <space> za
"现在你可以轻松地隐藏掉那些当前工作时不需要关注的代码了。
"第一个命令，set foldmethod=ident会根据每行的缩进开启折叠。但是这样做会出现超过你所希望的折叠数目。但是别怕，有几个扩展就是专门解决这个问题的。在这里，我们推荐SimplyFold。在.vimrc中加入下面这行代码，通过Vundle进行安装：
Plugin 'tmhedberg/SimpylFold'
"不要忘记执行安装命令：:PluginInstall
""专业贴士: 希望看到折叠代码的文档字符串？
let g:SimpylFold_docstring_preview=1

"Python代码缩进
"当然，想要代码折叠功能根据缩进情况正常工作，那么你就会希望自己的缩进是正确的。这里，Vim的自带功能无法满足，因为它实现不了定义函数之后的自动缩进。我们希望Vim中的缩进能做到以下两点：
"
"++首先，缩进要符合PEP8标准。
"++其次，更好地处理自动缩进。
"PEP8
"要支持PEP8风格的缩进，请在.vimrc文件中添加下面的代码：

au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix
"这些设置将让Vim中的Tab键就相当于4个标准的空格符，确保每行代码长度不超过80个字符，并且会以unix格式储存文件，避免在推送到Github或分享给其他用户时出现文件转换问题。

"另外，对于全栈开发，你可以设置针对每种文件类型设置au命令：
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

"自动缩进

"自动缩进有用，但是在某些情况下（比如函数定义有多行的时候），并不总是会达到你想要的效果，尤其是在符合PEP8标准方面。我们可以利用indentpython.vim插件，来解决这个问题：
Plugin 'vim-scripts/indentpython.vim'


" 对`BadWhitespace`进行声明,否则后面`Match BadWhitespace`会报错
"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred

"标示不必要的空白字符
"我们希望避免出现多余的空白字符。可以让Vim帮我们标示出来，使其很容易发现并删除。
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"这会将多余的空白字符标示出来，很可能会将它们变成红色突出。

"支持Virtualenv虚拟环境
"上面“转到定义”功能的一个问题，就是默认情况下Vim不知道virtualenv虚拟环境的情况，所以你必须在配置文件中添加下面的代码，使得Vim和YouCompleteMe能够发现你的虚拟环境：

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

"这段代码会判断你目前是否在`虚拟环境`中`编辑`，然后切换到相应的`虚拟环境`，并设置好你的`系统路径`，
"确保`YouCompleteMe`能够找到相应的`site packages`文件夹。


" add this line to your .vimrc file
" Plugin 'mattn/emmet-vim'
Plugin 'mattn/emmet-vim'

"Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


Plugin 'scrooloose/nerdtree'
" 这个插件可以显示文件的Git增删状态
Plugin 'Xuyuanp/nerdtree-git-plugin'

"Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in
" NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
"let NERDTreeMinimalUI=1
" 使用方向键，展开目录
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" 全局搜索
Plugin 'kien/ctrlp.vim'
" 后按下C-P，便可以全局搜索啦。使用C-j,
" C-k上下翻页，<Enter>打开选中文件。同样，给出一些有用的配置：
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*.pyc
"let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll|jpg|png|jpeg)$'}



" 酷炫的状态栏 powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" CSS 语法
" CSS语法高亮
Plugin 'hail2u/vim-css3-syntax'

"Javascript
"JavaScript 语法高亮只需要引入这个插件：
Plugin 'pangloss/vim-javascript'
let javascript_enable_domhtmlcss = 1

Plugin 'nathanaelkane/vim-indent-guides'


" 支持系统剪切板
set clipboard=unnamed

"你在Vim中copy的所有内容都会上系统剪切板。
"在Vim中拷贝内容时，可以切换到拷贝模式防止自动缩进和补全。 
"我的快捷键是<F9>：
"Paste toggle
nnoremap <F9> :set invpaste paste?<CR>
set pastetoggle=<F9>
set showmode

" 注释、反注释
"NERDCommenter是个不错的工具，支持非常多的语言：
Plugin 'scrooloose/nerdcommenter'   " commenter: \cc \cu
"然后按下\cc来注释当前航，\cu来反注释，\c<space>来切换注释。其中的\\是可以设置的：
"let mapleader=';'

" 
" ag: Silver Searcher
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
" 在普通模式下输入F4,便可以自动输入`:Ack`
map <F4> :Ack<space>

" vim-unimpaired
Plugin 'tpope/vim-unimpaired'

" 自动补全插件YCM
Plugin 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" add a few customizations
"let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"The former line ensures that the autocomplete window goes away when you’re done with it, 
"and the latter defines a shortcut for goto definition.
"My leader key is mapped to space, so space-g will goto definition of whatever
"I’m currently on. Helpful when exploring new code.


" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-n>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file


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
Plugin 'Raimondi/delimitMate'

"Formatter
"格式化程序对于我们懒人和强迫症用户来讲是非常需要的。Vim的默认配置中提供了格式化功能，
"但显然我们要的更多！比如我希望：
"
"前大括号不换行，而后大括号换行
"所有运算符两边都有空格
"一键格式化当前文件
"保存时自动格式化
"…
"这里推荐的插件叫做vim-autoformat，上述的需求都能完美地解决。参照文档安装就好了。
" 每次按下F6,便可以格式化代码
Plugin 'Chiel92/vim-autoformat'
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" 定义`Python`的`代码``格式化程序`
" autopep8 for Python (supports formatting ranges)
" For Ubuntu type sudo apt-get install python-autopep8 in a terminal. 
"let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
"let g:formatters_python = ['autopep8']


" Mappings 

fun! RelatedFile(file)
    #This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()


let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/" )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap \8 :call RelatedFile ( "management/" )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

" 使用ctags
set tags=tags

" tagbar
Plugin 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
"map <F3> :Tagbar<CR>
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

"配色方案
"配色方案可以和你正在使用的基础配色共同使用。
"GUI模式可以尝试solarized方案, 终端模式可以尝试Zenburn方案：
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"接下来，只需要添加一点逻辑判断，确定什么模式下使用何种方案就可以了：
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"Solarized方案同时提供了暗色调和轻色调两种主题。要支持切换主题功能（按F5）也非常简单，只需添加：
call togglebg#map("<F5>")

" old colorshecme
"Plugin 'flazz/vim-colorschemes'
"colorscheme desert
"colorscheme gruvbox


" indentLine
" indentLine是一款缩进指示线，由纯字符实现，效果比较完美。由于python是靠代码缩进来判断代码块的，因此缩进指示的功能有多方便就不言而喻了。indentLine默认是关闭的，因此需要在.vimrc中配置才能看到效果。
Plugin 'Yggdroot/indentLine'
"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
