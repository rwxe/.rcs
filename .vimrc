"自动安装vim-plug
"如果有代理，则可能需要设置$GIT_SSL_NO_VERIFY=true
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl --insecure -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
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
set softtabstop=4 "tab 4格
set shiftwidth=4 
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
set statusline+=%1*%t%*  "文件名
set statusline+=\ %<%F "文件绝对路径
set statusline+=\ %{''.(&fenc==&enc?&enc:('['.&fenc.','.&enc.']'))} "fenc和enc相同就显示enc,不同就显示[fenc,enc]
set statusline+=\ %{(&bomb?'BOM':\"\")}			   "有无BOM
set statusline+=\ %{&ff}							  "文件系统(dos/unix..)
set statusline+=\ %{&ft}							  "文件类型
set statusline+=%=			   "开始右对齐
set statusline+=%m[%B]			 "修改标记,光标处字符unicode 
set statusline+=\ %l			 "光标所在行
set statusline+=\,%v			 "光标所在列
set statusline+=\ %r%w\%p%%    "只读标记，preview标记，当前百分比标记
set background=dark
set backspace=indent,eol,start
set complete-=i "无插件情况下，i选项会递归扫描文件查找符号，非常耗时
set scrolloff=10 "上下边界偏移10行
set cursorline "高亮当前行
set cursorcolumn "高亮当前列
set showcmd "显示命令
let mapleader=";" "leader键
if &filetype != 'c' "防止将0开头的数字识别为八进制
	set nrformats-=octal
endif

"显示空格
set list
set listchars=space:·,tab::::
"色彩主题
"colorscheme solarized
"let g:molokai_original = 1
colorscheme molokai
"启用真色彩

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


"自定义附加颜色设置
"自定义颜色组1 御召御納戸 
hi User1 ctermfg=15  ctermbg=23 cterm=bold guibg=#2e5c6e
hi statusline term=bold,underline cterm=underline gui=underline ctermfg=Black ctermbg=White guibg=#f4a7b9 guifg=#08192d
hi statuslineNC term=None cterm=None ctermfg=White ctermbg=Black
"hi Normal ctermbg=None guibg=NONE
hi TabLineSel ctermfg=15  ctermbg=23 cterm=bold
"hi Comment guifg=#91989f
hi Visual guifg=#403D3D guibg=White
"hi String ctermfg=227
hi Todo ctermfg=Black ctermbg=Yellow guifg=Black guibg=Yellow

hi SpecialKey guifg=#303030
set nocompatible			  " 去除VI一致性,必须要添加


"vim-plug 列表
filetype off				  " 为了vim-plug，如果不使用vim-plug就要去掉
call plug#begin('~/.vim/plugged')
"Plug 'ycm-core/YouCompleteMe' "YCM补全
Plug 'preservim/tagbar'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'guns/xterm-color-table.vim',{'on':'XtermColorTable'}
Plug 'tell-k/vim-autopep8',{'for':'python'}
Plug 'preservim/nerdtree'
Plug 'tomasr/molokai',{'do':'mkdir -p ../../colors;mv colors/molokai.vim ../../colors/'}
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc.nvim补全
call plug#end()
"以下是插件设置

"for coc.nvim
"按下tab后可补全第一项并关闭弹出菜单
"inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
"格式化所选文本
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"重命名
nmap <leader>rn <Plug>(coc-rename)
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" for WSL clipboard
if system('uname -r') =~ "Microsoft"
    augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
        augroup END
endif

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
let g:tagbar_ctags_bin='/usr/bin/ctags' "tagbar需要需要知道ctags路径
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
let g:godef_split=3 """打开新窗口的时候左右split
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
let g:go_def_mapping_enabled=0 "禁用vim-go的gd映射，改用自定义映射
"let g:go_fmt_autosave=0 "禁用vim-go自动格式化
nnoremap  gd :call CocAction('jumpDefinition', 'drop')<CR>


command BlackBGToggle call BlackBGToggle()
command WrapToggle call WrapToggle()
command W w
command WQ wq
command Wq wq
command Wa wa
command WA wa
command Q q
command Qa qa
command QA qa
func BlackBGToggle()
	"背景黑色开关
	if !exists('g:is_blacked')
		let g:is_blacked=1
	endif
	if g:is_blacked==1
		exec 'hi Normal ctermbg=None guibg=NONE'
		let g:is_blacked=0
	else
		exec 'hi Normal ctermbg=Black guibg=Black'
		let g:is_blacked=1
	endif
endfunc
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

map <F5> :call CompileTheFile()<CR>
func CompileTheFile()
	exec "wa"
	if &filetype == 'c'
		exec "!g++ % -o %< &&  ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %< &&  ./%<"
	elseif &filetype == 'java'
		exec "!javac -encoding utf-8 -d . % &&	java %<"
	elseif &filetype == 'sh'
		exec "!./%"
	elseif &filetype == 'python'
		exec "! python %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		exec "!go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html & && firefox %.html &"
	elseif &filetype == 'markdown'
		exec '!firefox %'
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

	inoremap (<BACKSPACE> (
	inoremap [<BACKSPACE> [
	inoremap {<BACKSPACE> {
	inoremap '<BACKSPACE> '
	inoremap "<BACKSPACE> "
	if &filetype=='vim'
		inoremap " "
	elseif &filetype=='cpp'||&filetype=='c'||&filetype=='java' ||&filetype=='css'
		inoremap {<CR> {<CR>}<up><end><CR>
	elseif &filetype=='go'
		inoremap (<CR> (<CR>)<up><end><CR>
		inoremap {<CR> {<CR>}<up><end><CR>
	elseif &filetype=='markdown'
		inoremap ``` ``````<left><left><left><CR><up><END>
	elseif &filetype=='python'
		set expandtab
		inoremap """ """"""<left><left><left>
		inoremap ''' ''''''<left><left><left>
		inoremap < <
		inoremap <<BACKSPACE> <<BACKSPACE>
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
		call setline(2,'using namespace std;')
		call setline(3,'int main()')
		call setline(4,'{')
		call setline(5,'	return 0;')
		call setline(6,'}')
		call feedkeys('4Go','t')
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
	call BracesMatch()
	"对于gd跳转，分裂新窗口
"	nmap <buffer> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
endfunc
func CallAtBufEnter()
	call BracesMatch()
	"对于gd跳转，分裂新窗口
"nmap <buffer> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
endfunc
func CallAtTabEnter()
	call BracesMatch()
	"对于gd跳转，分裂新窗口
"nmap <buffer> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
endfunc
func CallAtWinEnter()
	call BracesMatch()
	"对于gd跳转，分裂新窗口
"nmap <buffer> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
endfunc

autocmd Filetype * call CallAtStarted()
autocmd BufNewFile * call CallAtNew()
autocmd BufEnter * call CallAtBufEnter()
autocmd TabEnter * call CallAtTabEnter()
autocmd WinEnter * call CallAtWinEnter()

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap H gT
nnoremap L gt

"repeat paste 重复粘贴
nnoremap <leader>rp "0p
vnoremap <leader>rp "0p
"快捷复制粘贴剪贴板
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
