" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype indent on
filetype plugin on
filetype plugin indent on

" <<

" >>
" vim 自身（非插件）快捷键

" 设置快捷键将选中文本块复制至系统剪贴板
"vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p
nmap <Leader>P "+P

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap wn <C-W><C-W>
" 跳转至右方的窗口
nnoremap <C-L>  <C-W>l
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <C-H>  <C-W>h
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <C-K>  <C-W>k
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <C-J>  <C-W>j
nnoremap <Leader>jw <C-W>j

" <<

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" >>
" 其他
"设置鼠标支持
set mouse=a

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" <<

"设置全局变量供session与tags等使用
let g:curpath = getcwd()
"设置自动折叠代码
set fdm=marker

" >>>>
" 插件安装

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"主题风格素雅 solarized
Plugin 'altercation/vim-colors-solarized'
"多彩 molokai
Plugin 'tomasr/molokai'
"复古 phd
Plugin 'vim-scripts/phd'
"状态栏
Plugin 'Lokaltog/vim-powerline'
"C++ 语法高亮
Plugin 'octol/vim-cpp-enhanced-highlight'
"可视化的方式能将相同缩进的代码关联起来
Plugin 'nathanaelkane/vim-indent-guides'
"在接口文件（MyClass.h）和实现文件（MyClass.cpp）中来回切换
Plugin 'derekwyatt/vim-fswitch'
"书签可视化
Plugin 'kshenoy/vim-signature'
"书签行高亮，如下是它的快捷键：，高亮所有书签行；，关闭所有书签行高亮；，清除
"[a-z] 的所有书签；，收藏当前行；，取消收藏当前行
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"基于标签的标识符列表插件
Plugin 'majutsushi/tagbar'
"自动生成标签并引入
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"搜索结果显示上下文
Plugin 'dyng/ctrlsf.vim'
"多光标编辑功能
"Plugin 'terryma/vim-multiple-cursors'
"快速开关注释
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
"模板补全
"Plugin 'SirVer/ultisnips'
"自动补全
"Plugin 'Valloric/YouCompleteMe'
Plugin 'OmniCppComplete'
Plugin 'SuperTab'
"由接口快速生成实现框架
"Plugin 'derekwyatt/vim-protodef'
"查看文件列表
Plugin 'scrooloose/nerdtree'
"多文档编辑
Plugin 'fholgado/minibufexpl.vim'
"winmanager
"Plugin 'winmanager'
"自然地选中结对符内的文本
Plugin 'gcmt/wildfire.vim'
"支持分支的 undo
Plugin 'sjl/gundo.vim'
"快速移动
Plugin 'Lokaltog/vim-easymotion'
"markdown 即时预览
"Plugin 'suan/vim-instant-markdown'
"中/英输入平滑切换
"Plugin 'lilydjwg/fcitx.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"ack 搜索
Plugin 'mileszs/ack.vim'
" ag.vim : Use ag, the_silver_searcher (better than ack, which is better than
" grep) 
Plugin 'rking/ag.vim' 
"Plugin 'autopreview'
" 插件列表结束
call vundle#end()
filetype plugin indent on
" <<<<

" 配色方案
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd

" >>
" 营造专注气氛

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
"" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

" <<

" >>
" 辅助信息

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" <<

" >>
" 其他美化

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 10.5

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" <<

" >>
" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" <<

" >>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" <<

" >>
" 代码折叠

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" <<

" >>
" 接口与实现快速切换

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" <<

" >>
" 代码收藏

" 自定义 vim-signature 快捷键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" <<

" >>
" 标签列表

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'unionlt'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" <<

" >>
" 代码导航
 
" 基于标签的代码导航

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
"let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 正向遍历同名标签
"nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
"nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" <<

" >>
" 查找

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" <<

" >>

"OmniCppComplete主要提供输入时实时提供类或结构体的属性或方法的提示和补全。
set nocp  
filetype indent on
filetype plugin on
filetype plugin indent on
set completeopt=longest,menu
if has("autocmd")
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    autocmd FileType Python set omnifunc=pythoncomplete#Complete
    autocmd FileType JavaScript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType PHP set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
endif
if has("autocmd") && exists("+omnifunc") 
    autocmd Filetype * 
    \if &omnifunc == "" | 
    \setlocal omnifunc=syntaxcomplete#Complete | 
    \endif 
endif 
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
"OmniCppComplete主要提供输入时实时提供类或结构体的属性或方法的提示和补全。

" SuperTab
let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" <<


" >>
" 工程文件浏览

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=32
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
"let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" <<

" >>
" 多文档编辑
 
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>

" buffer 切换快捷键
map <Leader>n :MBEbn<cr>
map <C-Tab> :MBEbn<cr>
map <Leader>N :MBEbp<cr>
map <C-S-Tab> :MBEbp<cr>
"设置miniBufExpl
let g:miniBufExplMapWindowNavVim = 1   
"可以使用<C-h,j,k,l>切换到上下左右的窗口中去
let g:miniBufExplMapWindowNavArrows = 1   
"用<C-箭头键>切换到上下左右窗口中去
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0  

" <<

"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}



"==========================================================================
map <leader>0 :call Dogtags0()<cr>
map <leader>9 :call Dogtags9()<cr>
"ctags {{{
function! Dogtags0()
	if(DeleteFile(g:curpath, "gtags.files") )
		return
	endif
    silent! execute "!find . -path '.\/out' -o -type d -name '\.svn' -o -type d -name '\.git'  -prune  -o  -type f  > gtags.files"
    call Do_CsTag()
endfunction
function! Dogtags9()
	if(DeleteFile(g:curpath, "gtags.files") )
		return
	endif
    silent! execute "!find vendor  -path '.\/out' -o -type d -name '\.svn' -o -type d -name '\.git'  -prune  -o  -type f  > gtags.files"
    silent! execute "!find frameworks  -path '.\/out' -o -type d -name '\.svn' -o -type d -name '\.git'  -prune  -o  -type f  >> gtags.files"
    silent! execute "!find packages -path '.\/out' -o -type d -name '\.svn' -o -type d -name '\.git'  -prune  -o  -type f  >> gtags.files"
    silent! execute "!find prebuilts  -path '.\/out' -o -type d -name '\.svn' -o -type d -name '\.git'  -prune  -o  -type f  >> gtags.files"
    call Do_CsTag()
endfunction
function! Do_CsTag()
	cd g:curpath
	"先删除已有的tags和cscope文件，如果存在且无法删除，则报错。
"	if(DeleteFile(g:curpath, \"tags") )
"		return
"	endif
"	if(DeleteFile(g:curpath, \"cscope.files"))
"		return
"	endif
"	if(DeleteFile(g:curpath, \"cscope.out") )
"		return
"	endif
"	if(DeleteFile(g:curpath, \"cscope.in.out") )
"		return
"	endif
"	if(DeleteFile(g:curpath, \"cscope.po.out") )
"		return
"	endif

"	if(executable('ctags'))
		"silent! execute \"!g++ -E % -o tmpcpp -I../eg"
"		silent! execute \"!ctags -R --c++-kinds=+p --java-kinds=+l --fields=+ialS --extra=+q"
		"silent! execute \"!unlink tmpcpp"
"	endif
"	if(executable('cscope') && has("cscope"))
"		if(has("win32"))
"			silent! execute \"!dir /s/b *.c,*.cpp,*.h,*.java,*.cs,*.xml >> cscope.files"
"		else
			"silent! execute \"!find . -path '.\/out' -prune  -o -iname '*.[ch]' -o -name '*.cpp' -o -name '*.cc' -o -name '*.java' -o -name '*.mk' -o -name '*.mak' -o -name '*.sh' -o -name '*.xml' -o -name '*.conf'  -o -name '*.php' -o -name '*.sql'> cscope.files"
"			silent! execute \"!findalltextfile.sh > cscope.files"
"		endif
"		silent! execute \"!cscope -bq -i cscope.files"
"		execute \"normal :"
"		if filereadable("cscope.out")
"			execute \"cs add cscope.out"
"		endif
"	endif
	if(DeleteFile(g:curpath, "GPATH") )
		return
	endif
	if(DeleteFile(g:curpath, "GRTAGS"))
		return
	endif
	if(DeleteFile(g:curpath, "GSYMS") )
		return
	endif
	if(DeleteFile(g:curpath, "GTAGS") )
		return
	endif
	if(executable('cscope') && has("cscope"))
        "silent! execute "!findallfile.sh > gtags.files"
		silent! execute "!time gtags"
		execute "normal :"
		if filereadable("gtags.files")
			execute "set cscopeprg=gtags-cscope"
			execute "cs add GTAGS"
		endif
    endif
	"刷新屏幕
	execute "redr!"
endfunction

"写入文件时自动更新GTAGS
function! UpdateGtags(f)
     let dir = fnamemodify(a:f, ':p:h')
      exe 'silent !cd ' . dir . ' && killall gtags &>/dev/null  && global -u &> /dev/null &'
endfunction
au BufWritePost * call UpdateGtags(expand('<afile>'))

"cscope 绑定
if has("cscope")
	set csto=1
	set cst
	set nocsverb
	if filereadable("cscope.out")
		cs add cscope.out
	endif
    if filereadable("gtags.files")
        set cscopeprg=gtags-cscope
        cs add GTAGS
    endif
	" s: C语言符号  g: 定义     d: 这个函数调用的函数 c: 调用这个函数的函数
	" t: 文本       e: egrep模式    f: 文件     i: include本文件的文件
	nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
	
	"把cscope搜索出来的结果输出到quickfix窗口
	set cscopequickfix=s-,c-,d-,i-,t-,e-
endif " }}} 


" 预览窗口 
nnoremap <Leader>v :call PreviewWord()<CR> 
nnoremap <Leader>cv :pclose <CR>
func! PreviewWord()
  if &previewwindow			" don't do this in the preview window
    return
  endif
  let w = expand("<cword>")		" get the word under cursor
  if w =~ '\a'			" if the word contains a letter

    " Delete any existing highlight before showing another tag
    silent! wincmd P			" jump to preview window
    if &previewwindow			" if we really get there...
      match none			" delete existing highlight
      wincmd p			" back to old window
    endif

    " Try displaying a matching tag for the word under the cursor
    try
        exe "belowright pedit"
    catch
      return
    endtry
    silent! wincmd P
    if &previewwindow
        try
            exe "ptag " . w
        catch
          wincmd p
          return
        endtry
        wincmd p
    endif    

    silent! wincmd P			" jump to preview window
    if &previewwindow		" if we really get there...
	 if has("folding")
	   silent! .foldopen		" don't want a closed fold
	 endif
	 call search("$", "b")		" to end of previous line
	 let w = substitute(w, '\\', '\\\\', "")
	 call search('\<\V' . w . '\>')	" position cursor on match
	 " Add a match highlight to the word at this position
      hi previewWord term=bold ctermbg=green guibg=green
	 exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
      wincmd p			" back to old window
    endif
  endif
endfun


"Save_Session() Read_Session(){{{
let g:session_file = g:curpath . "\/session.vim"
let g:info_file = g:curpath . "\/viminfo.vim"
"保存vim状态与viminfo 
function! Save_Session()
	"先删除已有的session和viminfo文件，如果存在且无法删除，则报错。
	if(DeleteFile(g:curpath, "session.vim") )
		return
	endif
	if(DeleteFile(g:curpath, "viminfo.vim") )
		return
	endif
	"if (IsWinManagerVisible())
	"	execute "WMToggle"
	"endif
    execute "cclose"
    execute "MBEClose"
    execute "NERDTreeClose"
    execute "TagbarClose"
	execute "mksession " .  g:session_file
	execute "wviminfo " .  g:info_file 
endfunction

"回复vim状态与viminfo
function! Read_Session()
	if filereadable(g:session_file)
		execute "source " . g:session_file
	endif
	if filereadable(g:info_file)
		execute "rviminfo " . g:info_file
	endif
endfunction

" }}}
"使用\q时保存vim状态与viminfo
nmap <leader>q :call Save_Session()<CR>:qa<CR>
"回复vim状态与viminfo

if &diff
	"比较模式不加载vim状态与viminfo
	"将差异应用于对面窗口
	nmap <C-F8> dp]c
	"将对面窗口的不同应用于本窗口
	nmap <C-F7> do]c
else
call Read_Session()
endif


"如果是java项目允许使用Eclim
if filereadable(".classpath")
	"使用eclim的taglist
	let g:EclimTaglistEnabled=1
else
	"使用官方版本的taglist
	let g:EclimTaglistEnabled=0
endif

"DeleteFile(){{{
function! DeleteFile(dir, filename)
	if filereadable(a:filename)
		if (has("win32"))
			let ret = delete(a:dir."\\".a:filename)
		else
			let ret = delete("./".a:filename)
		endif
		if (ret != 0)
			echohl WarningMsg ! echo "Failed to delete ".a:filename | echohl None
			return 1
		else
			return 0
		endif
	endif
	return 0
endfunction
"}}}


" doxygen 
let g:doxygenToolkit_authorName="tony.wu"
let g:doxygenToolkit_briefTag_funcName="yes"


" use AStyle format code
function! CodeFormat()
    "取得当前光标所在行号
    let lineNum = line(".")

    if &filetype == 'c'
         exec "%! astyle -A1T4KNLwYm2M40fpDyjJck1W3\<CR>"
        "exec "%! astyle -A1T4KNLwYm2M40fpDxdyjJck1W3\<CR>"
    elseif &filetype == 'cpp'
        exec "%! astyle -A1pNYk3\<CR>"
    elseif &filetype == 'java'
        exec "%! astyle -A1pNYk3\<CR>"
    elseif &filetype == 'html'
        exec "%! astyle -aan-dep-fb-fbc-fu-js-ll-n-ox-pe-qa-qn-m-wa-wj-wp-ws-sw-fo-i0-d1-ce0-ie0-oe0-w0\<CR>"
    elseif &filetype == 'xml'
        exec "%! astyle -aan-dep-fb-fbc-js-ll-n-ix-qa-qn-m-wa-wj-wp-ws-sw-fo-i1-ce0-ie0-oe0-w0\<CR>"
    elseif &filetype == 'php'
        exec "%! astyle -sas-icd-samt-salo-saeo-saro-sabo-saao-samp-aas-rsl-iel-rpc-rst-st\<CR>"
    elseif &filetype == 'javascript'
        exec "%! astyle -nb-cn4\<CR>"
    elseif &filetype == 'json'
        exec "%! astyle -cn3\<CR>"
    elseif &filetype == 'sql'
        exec "%! astyle -cn2-el-ml0\<CR>"
    else 
        echo "unsupport ".&filetype
    endif
    "返回先前光标所在行
    exec lineNum
endfunction
map <leader>cf :call CodeFormat()<CR>


" ctrlpvim/ctrlp.vim CTRLP[文件搜索]
"let g:ctrlp_map = '<leader>c'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
map <leader>m :CtrlPMixed<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=35
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

"Ag.vim 
nnoremap <Leader>ag :Ag <cword><CR> 



