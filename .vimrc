"自动安装vim-plug
"如果有代理，则可能需要设置$GIT_SSL_NO_VERIFY=true
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl --insecure -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"[START vim-plug 导入]
" 先导入插件可避免设置被覆盖
"vim-plug list 插件列表
"set nocompatible			  " 去除VI一致性,必须要添加
"filetype off				  " 为了vim-plug，如果不使用vim-plug就要去掉
call plug#begin('~/.vim/plugged')
"Plug 'nokobear/vim-colorscheme-edit' "简易主题编辑器
"Plug 'ycm-core/YouCompleteMe' "YCM补全
"Plug 'gko/vim-coloresque', {'for':'css, html, vim'} "显示颜色数值的颜色
Plug 'jiangmiao/auto-pairs'
Plug 'yianwillis/vimcdoc' "中文文档
Plug 'arzg/vim-colors-xcode' "Xcode主题
Plug 'rwxe/termguiattrhook' "用gui属性覆盖cterm属性
Plug 'google/vim-searchindex' "显示搜索匹配
Plug 'guns/xterm-color-table.vim' "xterm颜色查看
Plug 'tomasr/molokai',{'do':'mkdir -p ../../colors;mv colors/molokai.vim ../../colors/'} "molokai主题
Plug 'vim-scripts/MultipleSearch' "多重搜索
Plug 'luochen1990/rainbow' "彩虹括号增强
Plug 'tell-k/vim-autopep8',{'for':'python'} "Python PEP8 格式化
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc.nvim补全
Plug 'preservim/tagbar' "代码结构显示
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "go代码辅助提示
Plug 'tpope/vim-fugitive' "Git插件
Plug 'airblade/vim-gitgutter' "Git侧边栏插件
Plug 'preservim/nerdtree' "文件管理器
Plug 'Xuyuanp/nerdtree-git-plugin' "文件管理器Git状态显示
call plug#end()
"[END vim-plug 导入]

"[START 常规设置]
let mapleader=" " "leader键
set nu "行号
syntax enable "语法高亮
set ruler "尺子，显示行列号
set noeb "不要响铃
set clipboard=unnamed "剪贴板指向*寄存器
set autoindent "自动缩进
filetype plugin indent on
set smartindent "智能缩进
set history=1500 "历史1500行
set tabstop=4 "tab 4格
"set expandtab "tab统一为空格
set softtabstop=4 "tab 4格
set shiftwidth=4 "左右移距离
set hlsearch "高亮搜索
set incsearch "高亮当前搜索
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set completeopt=menu,menuone,popup
set mouse=a "支持鼠标
set nowrap "不折叠行
set t_Co=256 "启用256色
set laststatus=2 "2为一直启用状态栏
set wildmenu "底线命令模式补全栏
set statusline = "手写状态栏
set statusline+=%#StatuslineFileName#%t%*  "文件名
"set statusline+=\ %<%F "文件绝对路径，用户目录下用~开头
set statusline+=\%<%{'\|'.expand('%:p:~:h').'\|'} "文件绝对路径，用户目录下用~开头
set statusline+=\ %{''.(&fenc==&enc?&enc:('['.&fenc.','.&enc.']'))} "fenc和enc相同就显示enc,不同就显示[fenc,enc]
set statusline+=\ %{(&bomb?'BOM':\"\")}			   "有无BOM
set statusline+=\ %{&ff}							  "文件系统(dos/unix..)
set statusline+=\ %{&ft}							  "文件类型
set statusline+=%=			   "开始右对齐
set statusline+=%m[%B]			 "修改标记,光标处字符unicode 
set statusline+=\ %l			 "光标所在行
set statusline+=\,%v			 "光标所在列
set statusline+=\ %r%w\%p%%    "只读标记，preview标记，当前百分比标记
set backspace=indent,eol,start
set complete-=i "无插件情况下，i选项会递归扫描文件查找符号，非常耗时
set scrolloff=10 "上下边界偏移10行
set cursorline "高亮当前行
set cursorcolumn "高亮当前列
set showcmd "显示命令
set shortmess-=S "显示搜索匹配数
set updatetime=4000
"if &filetype != 'c' "防止将0开头的数字识别为八进制
"	set nrformats-=octal
"endif
"

"[END 常规设置]


"[START 自定义色彩主题]
"显示空格和tab
set list
set listchars=space:·,tab:\ \ \|
colorscheme molokai
"colorscheme eclipse
"set background=dark "手动设置背景色调，会影响其他插件的颜色显示
"let g:molokai_original = 1
func CustomHighlight()
    "自定义附加颜色设置
    "自定义颜色组1 状态栏文件名 bg:omeshionando
    hi StatuslineFileName ctermfg=15  ctermbg=23 cterm=bold,italic guifg=White guibg=#2e5c6e
    "gui fg:kachi bg:ikkonzome
    hi StatusLine term=bold,underline cterm=None ctermfg=Black ctermbg=White gui=None guibg=#f4a7b9 guifg=Black
    hi StatusLineNC term=None cterm=None ctermfg=DarkGrey ctermbg=Black guifg=DarkGrey guibg=Black
    "hi Normal ctermbg=None guibg=NONE
    hi TabLineSel ctermfg=15  ctermbg=23 cterm=bold
    "hi Comment guifg=#91989f
    hi Visual ctermfg=DarkGrey ctermbg=White guifg=#804020 guibg=#ffc0a0
    "hi String ctermfg=227
    hi Todo cterm=standout gui=standout
    hi CursorLineNr guifg=#81d8d0
    if &background=="light"
        hi SpecialKey cterm=None ctermfg=254 gui=None guifg=#e4e4e4 
    else
        hi SpecialKey cterm=None ctermfg=236 gui=None guifg=#303030
    endif

endfunc
call CustomHighlight()

"启用真色彩 true colors
if exists('+termguicolors')
    let &t_Ts = "\e[9m"   " Strikethrough 删除线
    let &t_Te = "\e[29m"
    let &t_Cs = "\e[4:3m" " Undercurl 下波浪线
    let &t_Ce = "\e[4:0m"
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
"[END 自定义色彩主题]

" for WSL clipboard
if system('uname -r') =~ "Microsoft"
    augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
    augroup END
endif


"
"[START 插件设置 plug setting ]
"
"[START MultipleSearch设置]
let g:MultipleSearchColorSequence = "LightYellow, LightRed, LightMagenta, LightGreen, LightCyan, Cyan, DarkYellow, DarkBlue"
let g:MultipleSearchTextColorSequence = "Black, Black, Black, Black, Black, Black, White, White"
"[END MultipleSearch设置]
"
"[START 彩虹括号]
let g:rainbow_active = 1 "启用
"nerdtree: 0 NERDTree与Rainbow会冲突，产生多余括号
let rainbow_guifgs_darkbg = ['deepskyblue', 'seagreen3', 'orange', 'deeppink', 'fuchsia']
let rainbow_guifgs_lightbg = ['darkblue', 'webgreen', 'orangered3', 'red3', 'webpurple']
let rainbow_ctermfgs_darkbg = ['white', 'lightblue', 'lightgreen', 'lightyellow','magenta']
let rainbow_ctermfgs_lightbg = ['black', 'darkblue', 'darkgreen', 'darkyellow','darkmagenta']
let g:rainbow_conf = {
\	'guifgs': (&background == "dark"? rainbow_guifgs_darkbg : rainbow_guifgs_lightbg),
\	'ctermfgs': (&background == "dark"? rainbow_ctermfgs_darkbg : rainbow_ctermfgs_lightbg),
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
    \		'*': {},
    \		'tex': { 'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'], },
    \		'lisp': { 'guifgs': ['deepskyblue', 'seagreen3','orange', 'deeppink','fuchsia'], },
    \		'vim': { 'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'], },
    \		'html': { 'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'], },
    \		'css': 0,
    \		'nerdtree': 0, 
    \	}
    \}
"[END 彩虹括号]
"
"[START auto-pairs的快捷键]

let g:AutoPairsShortcutFastWrap = ""
let g:AutoPairsShortcutJump = ""
let g:AutoPairsMapBS = 0
let g:AutoPairsMapCh = 0
let g:AutoPairsCenterLine = 0
let g:AutoPairsMapSpace = 0
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0

"[END auto-pairs的快捷键]

"[START NERDTree设置]
nnoremap <C-e> :NERDTreeToggle<CR>
command NT NERDTreeToggle
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'✱',
            \ 'Staged'    :'✚',
            \ 'Untracked' :'■',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'═',
            \ 'Deleted'   :'✖',
            \ 'Dirty'     :'✗',
            \ 'Ignored'   :'☒',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }
"[END NERDTree设置]
"
"[START vim-fugitive设置]
"git blame
command BL Git blame --abbrev=5 -w --date=short --color-by-age
command GDV Gvdiffsplit "git diff，暂存区和工作区的差异
"[END vim-fugitive设置]
"
"[START vim-gitgutter设置]
""上下一个修改处 IDEA like
nmap <C-A-S-Down>  <Plug>(GitGutterNextHunk) 
nmap <C-A-S-Up>  <Plug>(GitGutterPrevHunk)
"暂存修改处
nmap <leader>hs <Plug>(GitGutterStageHunk)
"取消修改处
nmap <leader>hu <Plug>(GitGutterUndoHunk)   
"预览修改处
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
command! GQF GitGutterQuickFix | copen "显示所有修改处到copen列表
"[END vim-gitgutter设置]
"
"[START coc.nvim设置]
"let g:coc_disable_startup_warning = 1
"跳转警告和错误
"Visual Studio Like
nmap <F8>     <Plug>(coc-diagnostic-next)
nmap <S-F8>   <Plug>(coc-diagnostic-prev)
nmap <leader>[ <Plug>(coc-diagnostic-prev)
nmap <leader>] <Plug>(coc-diagnostic-next)
"按下tab后可补全第一项并关闭弹出菜单
"旧版coc可用
" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : \"<Tab>"
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"
"新版coc可用
"inoremap <silent><expr> <tab> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"
"格式化所选文本
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"重命名
nmap <leader>r <Plug>(coc-rename)
"Visual Studio like
nmap <F2> <Plug>(coc-rename) 

"coc GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"[END coc.nvim设置]

"[START tagbar设置]
"IDEA like
nnoremap <C-F12> :TagbarToggle<CR> 
let g:tagbar_ctags_bin='/usr/bin/ctags' "tagbar需要需要知道ctags路径
"[END tagbar设置]
"
"[START YCM设置]
let g:ycm_key_invoke_completion = '<C-N><C-P>' "手动触发补全
let g:ycm_auto_trigger = 1 "自动触发补全候选词
let g:ycm_auto_hover = 'CursorHold' "自动悬停文档
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_open_loclist_on_ycm_diags = 1
"let g:ycm_open_loclist_on_ycm_diags = 1
"let g:ycm_always_populate_location_list = 0
"let g:ycm_complete_in_strings = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"强制左侧的诊断标签栏开启
"set signcolumn=yes
"let g:ycm_show_diagnostics_ui=0
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_filetype_whitelist = {
            \ "vim":1,
            \ "c":1,
            \ "cpp":1,
            \ "cs":1,
            \ "python":1,
            \ "html":1,
            \ "htmldjango":1,
            \ "php":1,
            \ "go":1,
            \ "rust":1,
            \ "java":1,
            \ "JavaScript":1,
            \ "TypeScript":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

"nnoremap K :YcmCompleter GoTo<CR>
"[END YCM 设置]
"
"[START vim-go 设置]
"Go Fmt Disable
command GFD let g:go_fmt_autosave=0 | let g:go_imports_autosave=0
let g:godef_split=3 """打开新窗口的时候左右split
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口
"let g:go_def_mapping_enabled=0 "禁用vim-go的gd映射，改用自定义映射
"[END vim-go 设置]
"[START vim-colors-xcode 设置]
let g:xcodelighthc_green_comments =1
let g:xcodedarkhc_green_comments = 1
"[END vim-colors-xcode 设置]
"Go Fmt Disable

"[END 插件设置 plug setting ]


command SOURVIMRC :source %
command TAB4 set tabstop=4 softtabstop=4 shiftwidth=4
command TAB8 set tabstop=8 softtabstop=8 shiftwidth=8
command DarkLightToggle call DarkLightToggle() "明暗开关
command ShowTime echo strftime("%Y %b %d %X")
command BC call BackgroundColorToggle() "背景色开关
command WrapToggle call WrapToggle() "快速折叠开关
command SSGB call ShowSyntaxGroupBelongs() "显示当前字符的语法高亮组
command ShowSyntaxGroupBelongs call ShowSyntaxGroupBelongs() "显示当前字符的语法高亮组
command ShowNonASCII call ShowNonASCII() "显示非ASCII字符开关
command ShowChinesePunctuation call ShowChinesePunctuation() "显示中文标点字符开关
command W w
command WQ wq
command Wq wq
command Wa wa
command WA wa
command Q q
command Qa qa
command QA qa
command Noh noh
command NOh noh
command NOH noh

"明暗开关
func DarkLightToggle()
    if &background=="dark"
        "colorscheme eclipse
        colorscheme xcodelighthc
    else
        colorscheme molokai
    endif
    call CustomHighlight()
    exec 'RainbowToggleOff'
    exec 'RainbowToggleOn'
endfunc
"背景色开关
func BackgroundColorToggle()
    let l:bg_hi_group = execute('hi Normal')

    if l:bg_hi_group =~# 'guibg' || l:bg_hi_group =~# 'ctermbg'
        let l:bg_color_on=1
    else
        let l:bg_color_on=0
    endif

    if l:bg_color_on==1
        let g:bgct_bg_color_hi_group = execute('hi Normal')
        exec 'hi Normal ctermbg=None guibg=NONE'
    else
        let l:bg_hi_group_args = split(g:bgct_bg_color_hi_group, '\s\+')
        let l:exec_hi_str = join(l:bg_hi_group_args[2:], ' ')
        exec 'hi Normal ' . exec_hi_str
    endif

endfunc

"快速折叠开关
func WrapToggle()
    if !exists('g:is_wrapped')
        let g:is_wrapped=0
    endif
    if g:is_wrapped==0
        nmap j gj
        nmap k gk
        set wrap
        let g:is_wrapped=1
    else
        "使用unmap系列命令，后面不要有空格
        nunmap j
        nunmap k
        set nowrap
        let g:is_wrapped=0
    endif
endfunc

"显示当前字符的语法高亮组
func ShowSyntaxGroupBelongs()
    :let s = synID(line('.'), col('.'), 1) | echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
endfunc

"显示非ASCII字符开关
func ShowNonASCII()
    call feedkeys("/[^\\x00-\\x7F]\<CR>") "非扩展ASCII
endfunc
"显示中文标点字符开关
func ShowChinesePunctuation()
    call feedkeys("/[。？！，、；：“”‘（）《》〈〉【】『』「」﹃﹄〔〕…—～﹏￥]\<CR>")
endfunc

map <F5> :call CompileAndRun()<CR>

func CompileAndRun()
    exec "wa"
    if &filetype == 'c'
        exec "!g++ % -o %< &&  ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< &&  ./%<"
    elseif &filetype == 'java'
        exec "!javac -encoding utf-8 -d . % &&	java %<"
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'python'
        exec "! python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go run %"
    elseif &filetype == 'rust'
        exec "!rustc % &&  ./%<"
    elseif &filetype == 'markdown'
        exec "!firefox %"
    endif
endfunc
map <F6> :call RunDebugger()<CR>

func RunDebugger()
    exec "wa"
    if &filetype == 'c'
        exec "!g++ -g % -o %< && gdb %<"
    elseif &filetype == 'cpp'
    elseif &filetype == 'java'
    elseif &filetype == 'sh'
    elseif &filetype == 'python'
        exec '!python -m ipdb %'
    elseif &filetype == 'html'
    elseif &filetype == 'go'
        exec '!dlv debug %'
    elseif &filetype == 'mkd'
    elseif &filetype == 'markdown'
    endif
endfunc


func BracesMatch()
    "手写的括号匹配
    inoremap (	()<left>
    inoremap [	[]<left>
    inoremap {	{}<left>
    inoremap '	''<left>
    inoremap " ""<left>
    inoremap ` ``<left>

    inoremap () ()
    inoremap [] []
    inoremap {} {}
    inoremap '' ''
    inoremap "" ""
    inoremap `` ``

    "inoremap (<BACKSPACE> (
    "inoremap [<BACKSPACE> [
    "inoremap {<BACKSPACE> {
    "inoremap '<BACKSPACE> '
    "inoremap \"<BACKSPACE> "
    
    if &filetype=='vim'
        inoremap " "
    elseif &filetype=='cpp'||&filetype=='c'||&filetype=='java' ||&filetype=='css'
        "inoremap {<CR> {<CR>}<up><end><CR>
    elseif &filetype=='go'
        "inoremap (<CR> (<CR>)<up><end><CR>
        "inoremap {<CR> {<CR>}<up><end><CR>
    elseif &filetype=='markdown'
        inoremap ``` ``````<left><left><left>
    elseif &filetype=='python'
        inoremap """ """"""<left><left><left>
        inoremap ''' ''''''<left><left><left>
    elseif &filetype=='php' || &filetype=='html' || &filetype=='htmldjango'
        inoremap < <><left>
        inoremap <<BACKSPACE> <
        inoremap {<CR> {<CR>}<up><end><CR>
        "For Django
        inoremap {% {%	 %}<left><left><left><left>
        inoremap {%<BACKSPACE> {%
        inoremap {# {#	 #}<left><left><left><left>
        inoremap {#<BACKSPACE> {#
    endif
endfunc


func AutoTitle()
    "自动标题
    if &filetype=='sh'
        call setline(1,'#!/usr/bin/env bash')
        call feedkeys('o','t')
    elseif &filetype=='python'
        call setline(1,'# -*-coding:utf-8-*-')
        call feedkeys('o','t')
    elseif &filetype=='c'
        call setline(1,'#include<stdio.h>')
        call setline(2,'int main()')
        call setline(3,'{')
        call setline(4,'	return 0;')
        call setline(5,'}')
        call feedkeys('3Go','t')
    elseif &filetype=='cpp'
        call setline(1,'#include<iostream>')
        call setline(2,'int main()')
        call setline(3,'{')
        call setline(4,'	return 0;')
        call setline(5,'}')
        call feedkeys('3Go','t')
    elseif &filetype=='java'
        call setline(1,'public class '.expand('%:t:r'))
        call setline(2,'{')
        call setline(3,'}')
        call feedkeys('2Go','t')
    elseif &filetype=='html' || &filetype=='php'
        call setline(1,'<!DOCTYPE html>')
        call setline(2,'<html>')
        call setline(3,'<head>')
        call setline(4,'<meta charset="utf-8">')
        call setline(5,'	<title></title>')
        call setline(6,'</head>')
        call setline(7,'<body>')
        call setline(8,'	')
        call setline(9,'</body>')
        call setline(10,'</html>')
    endif
endfunc


func FoldMethod()
    if &filetype=='python'
        set foldmethod=indent
        set foldlevel=20
    endif
endfunc




"启动时会运行的函数

func CallAtStarted()
endfunc

"新建文件时会运行的函数

func CallAtNew()
    call AutoTitle()
    "对于gd跳转，分裂新窗口
    "	nmap <buffer> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
endfunc

func CallAtBufReadPost()
endfunc

func CallAtBufEnter()
    "call BracesMatch() "手写括号匹配
    "对于gd跳转，分裂新窗口
    "nmap <buffer> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
endfunc

func CallAtTabEnter()
    "对于gd跳转，分裂新窗口
    "nmap <buffer> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
endfunc

func CallAtWinEnter()
    "对于gd跳转，分裂新窗口
    "nmap <buffer> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
endfunc

augroup vimrcautocmd
    autocmd!
    autocmd Filetype * call CallAtStarted()
    autocmd BufNewFile * call CallAtNew()
    autocmd BufReadPost * call CallAtBufReadPost()
    autocmd BufEnter * call CallAtBufEnter()
    autocmd TabEnter * call CallAtTabEnter()
    autocmd WinEnter * call CallAtWinEnter()
augroup END

"[START 基础通用按键MAP]
"窗口焦点切换
nnoremap <c-h> <c-w>h 
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
"窗口大小调整
command WVRIncr vertical resize+10
command WVRDecr vertical resize-10
command WHRIncr resize+10
command WHRDecr resize-10
"跳转行首尾 helix like
nnoremap gh 0
nnoremap gl $
xnoremap gh 0
xnoremap gl $
"tab标签切换
nnoremap H gT
nnoremap L gt

"快捷复制粘贴剪贴板
"For GUI terminal，不完全兼容WSL设置
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

"[END 基础通用按键MAP]

