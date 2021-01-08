set nocompatible              " be iMproved, required
filetype off                  " required

"================================
"plug-vim  插件管理
"================================
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'           					" 通过vundle 管理插件
Plug 'tpope/vim-fugitive'                           " 配合airline show branch info
Plug 'fatih/vim-go', {'for':'go'}                   " vim-go
Plug 'junegunn/vim-easy-align'     					" 快速对齐
Plug 'scrooloose/nerdtree'         					" 导航目录栏
Plug 'Xuyuanp/nerdtree-git-plugin' 					" 导航栏显示git分支信息
Plug 'majutsushi/tagbar'           					" 查看当前文件的变量，函数列表
Plug 'jiangmiao/auto-pairs'        					" 括号补全
Plug 'vim-airline/vim-airline'     					" 状态栏显示
Plug 'vim-airline/vim-airline-themes'               " airline themes
Plug 'Valloric/YouCompleteMe'      					" 自动补全
Plug 'vim-scripts/SuperTab'        					" tab 补全
Plug 'kien/ctrlp.vim'              					" ctl-p 文件搜索
Plug 'airblade/vim-gitgutter'      					" 可以在文档中显示 git 信息
Plug 'jistr/vim-nerdtree-tabs'     					" 可以在导航目录中看到 git 版本信息
Plug 'dkprice/vim-easygrep'        					" 全局搜索
Plug 'pangloss/vim-javascript'     					" javascript-vim
"配色方案
Plug 'KeitaNakamura/neodark.vim'
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
" Plugin for lua
Plug 'vim-scripts/luainspect.vim',{'for':'lua'}
Plug 'xolox/vim-lua-ftplugin',{'for':'lua'}
"All of your Plugins must be added before the following line
"call vundle#end()            " required
call plug#end()
filetype plugin indent on    " required

" ================================
" vim 配置 
" ================================
syntax on " 语法高亮
set nu " 显示行号
set cursorline "突出显示当前行
set showmatch " 显示括号匹配
set incsearch " 开启实时搜索
set ignorecase " 开启不区分大小写
set tabstop=4  " 设置tab长度为4
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释
set clipboard=unnamed " share system clipboard
"au InsertLeave *.go,*.sh write  " 退出插入模式指定类型文件自动保存
"set mouse=a        "启用鼠标
set encoding=utf-8
set t_co=256


"==============================================================================
" theme
"==============================================================================

set termguicolors  " 开启24bit的颜色，开启这个颜色会更漂亮一些
syntax enable
colorscheme solarized " 主题
set background=dark " 主题背景 dark-深色; light-浅色

" ================================
" Plugin Configure 
" ================================

"==============================================================================
" Valloric/YouCompleteMe
"==============================================================================

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion   = ['<C-n>', '<space>']
let g:ycm_key_list_previous_completion = ['<C-P>', '<Up>']
let g:SuperTabDefaultCompletionType    = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger           = "<tab>"
let g:UltiSnipsJumpForwardTrigger      = "<tab>"
let g:UltiSnipsJumpBackwardTrigger     = "<s-tab>"

"==============================================================================
" NERDTree 插件
"==============================================================================
" 打开和关闭NERDTree快捷键
map <F10> :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers                 = 1
" 打开文件时是否显示目录
let NERDTreeAutoCenter                      = 1
" 是否显示隐藏文件
let NERDTreeShowHidden                      = 0
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore                          = ['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks                   = 2
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup = 0


"==============================================================================
" vim-go 插件
"==============================================================================
" 格式化将默认的 gofmt 替换
let g:go_fmt_command              = "goimports" 
let g:go_autodetect_gopath        = 1
let g:go_list_type                = "quickfix"
let g:go_def_mod                  = 'gopls'
let g:go_version_warning          = 1
let g:go_highlight_types          = 1
let g:go_highlight_fields         = 1
let g:go_highlight_functions      = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators      = 1
let g:go_highlight_extra_types    = 1
let g:go_highlight_methods        = 1
let g:go_highlight_generate_tags  = 1

let g:godef_split=2

"==============================================================================
"  majutsushi/tagbar 插件
"==============================================================================

" majutsushi/tagbar 插件打开关闭快捷键
nmap <F9> :TagbarToggle<CR>

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

"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeGitStatusShowIgnored = 1
nmap <Leader>pwd :NERDTreeCWD<CR>
"==============================================================================
"  easy-grep 插件
"==============================================================================
": Grep word 全局搜索word

"==============================================================================
"  air-line 插件
"==============================================================================
" buffer
let g:airline#extensions#tabline#enabled        = 1
let laststatus                                  = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
" section
"section_c show current work dir
let g:airline_section_c                         = '%-0.30{getcwd()}'  
" branch
let g:airline#extensions#branch#format          = 1
" file parent path
let g:airline#extensions#tabline#fnamemod       = ':.'
let g:airline#extensions#tabline#fnametruncate  = 0
let g:airline#extensions#tabline#fnamecollapse  = 0

"==============================================================================
"  airline theme 插件
"==============================================================================
let g:airline_theme='simple'

"==============================================================================
"  easy-align 插件
"==============================================================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
