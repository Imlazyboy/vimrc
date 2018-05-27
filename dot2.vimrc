set nocompatible              " be iMproved, required
filetype off                  " required

"设置行号
"set nu


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
Plugin 'flazz/vim-colorschemes'

colorscheme desert
"colorscheme gruvbox


" UsingVimWithDjango
" Vim Modeline
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


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
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}



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

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

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
map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启
autocmd BufReadPost *.py call tagbar#autoopen() "如果是python语言的程序的话，tagbar自动开启
