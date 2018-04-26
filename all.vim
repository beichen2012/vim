""""""""""""""""""""""""""""""""""""""""""""""""""" vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 配色
Plug 'sickill/vim-monokai'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'

Plug 'ludovicchabant/vim-gutentags'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Yggdroot/LeaderF'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'


" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""" 通用设置
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
"//******搜索和匹配
set hlsearch            "对被搜索的表达式高亮
set incsearch           "在输入要搜索的文字时，实时匹配(逐字符高亮)
set showmatch
set matchtime=3
set ignorecase
set cursorline          "高亮显示当前行
"文件编码
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=utf-8,gbk,big5,ucs-bom,cp936,gb18030,gb2312,euc-jp,euc-kr,latin1
set fileencoding=utf-8
"临时文件交换文件保存目录
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
if g:isGUI
	set termencoding=cp936  "解决console输出乱码
else
	set termencoding=utf-8
endif
language messages zh_CN.utf-8   "设置中文提示
set helplang=cn         "设置中文帮助
set ambiwidth=double    "设置为双字宽显示
set number              "显示行号
set wrap                "自动换行,不自动换行（nowrap)

set ruler               "显示标尺
set nobackup
set backupdir=$VIMRUNTIME/tmpdir           "设置备份文件夹（~文件保存的地方）
set undodir=$VIM/tmpdir
set showcmd             "在状态栏显示正在输入的命令
filetype on
filetype plugin on
filetype indent on      "文件类型缩进
set foldmethod=syntax   "折叠方式为：indent
set nofoldenable        "设置启动时关闭代码折叠
set tabstop=4           "tab的长度为4个空格
set shiftwidth=4        "每层缩进的空格数是4
if g:isGUI
	set go = "无菜单、工具栏" "这一句可以简单粗暴的把菜单栏和工具栏禁用掉
endif
set showtabline=2       "总是在窗口上方显示标签页[0不显示，1只有多个标签页时才显示]
set clipboard+=unnamed  "设置vim的默认寄存器与系统剪切板共享
set winaltkeys=no       "设置alt键不映射到菜单
"set gcr=a:block-blinkon0
"禁用vim的光标闪烁,这样的话，在插入模式下的光标也会变成固定的块状，就不容易分清楚插入模式和普通模式
"
"//******文件模板
autocmd BufNewFile *.py 0r $VIM/vimfiles/template/python.tlp
set directory+=$TEMP	"交换文件的路径加上本机的$TEMP，这样在新建并编辑一个新文件时就不会提示无法打开交换文件了
"leader 是空格键
let mapleader = "\<space>"

" 设置代码配色方案
if g:isGUI
    colorscheme monokai              "Gvim配色方案
else
    colorscheme monokai               "终端配色方案
endif
"/*************************************key map*****************************/"
nmap <leader>h <c-w>h
nmap <leader>j <c-w>j
nmap <leader>k <c-w>k
nmap <leader>l <c-w>l

nmap <f2> :!start cmder.exe<cr>       "在当前目录启动cmd  (实验证明：ctrl+f2是非常不稳定的，时常失效)
" nmap <c-f1> :!start "C:\\Anaconda3\\python.exe"<cr>     "启动python，并把工作目录设置为当前目录
nmap <c-h> :%!xxd<cr>               "16进制浏览模式, 按u返回
" nmap <c-g> :!start "C:\\Program Files\\Git\\git-bash.exe"<cr>
nmap <c-s> :w!<cr>      "设置强制保存快捷键
"设定跳转
nmap <leader>; <c-w>]<cr>
"/*************************************vim airline*****************************/"
"Plugin 'vim-airline'
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⮀'             " tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = '⮂'                " tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#rightt_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1         " tabline中buffer显示编号
"bufferline
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#bufferline#overwrite_variables = 1
"let g:airline#extensions#branch#enabled = 1
" airline 主题
let g:airline_theme='dark'
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 设置字体字号，会覆盖前面的设置，这个字体是专为airline的特殊符号设计的
set guifont=Consolas\ for\ Powerline\ FixedD:h14
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
"/*************************************tags*****************************/"
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"----------------------------------------------------------------------
" indentLine
"----------------------------------------------------------------------
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'
"let g:indentLine_char = '|'
"let g:indentLine_enabled = 1
"/*******************************************NERDTree **********************/"
"NERDTree
let NERDTreeWinSize = 35 
let NERDTreeWinPos = 'left'
let NERDTreeDirArrowExpandable = '▸'
let NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }
"autocmd vimenter * NERDTree            "在打开文件时自动打开NERDTree
"autocmd vimenter * wincmd p            "在打开NERDTree后，把光标放到编辑的文件窗口
"let g:nerdtree_tabs_open_on_gui_startup=0
"let g:nerdtree_tabs_open_on_new_tab=0
"打开NERDTree，并把焦点设置回文件
nmap <F3> :NERDTreeToggle<cr>:wincmd p<cr>
"/******************************************* vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
"/*******************************************LeaderF
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
nmap <leader>ff :LeaderfFunction<cr>
"/******************************************* tagbar
nmap <F4> :TagbarToggle<cr>
"//******************************for vim-session(它需要 vim-misc的支持)
set sessionoptions-=help
set sessionoptions-=buffers         "会话不保存那些隐藏和非激活的buffers(即只保存两个buffer:一个当前，一个轮换)
set sessionoptions-=blank
set sessionoptions+=winpos
set sessionoptions+=slash
set sessionoptions+=unix
let g:session_direcory="~/vimsessions"
let g:session_autosave="yes"                "自动保存会话
let g:session_default_name="default"        "默认的会话的名字是default
let g:session_autoload="no"             "自动加载会话
let g:session_default_to_last=0             "配合上一条设置，自动打开最后一次打开的会话
let g:session_command_aliases=1             "打开命令的别名，如：SessionOpen = OpenSession
nmap <leader>sc :CloseSession<cr>
nmap <leader>sd :DeleteSession<cr>
nmap <leader>so :OpenSession<space>
nmap <leader>ss :SaveSession<space>

