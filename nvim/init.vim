" ===
" === Auto load for first time uses
" ===
"if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
"	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
"					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"
"if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif


" 創建一個新的 MyTabSpace 組,並設置它的顏色
highlight MyColor guifg=darkgrey ctermfg =darkgrey
" 指定tab字符和空格的顏色組為MyTabSpace,不同字符串之間用|隔開,要使用\|轉義.
match MyColor /\t\| /
" 針對特定類型的代碼文件,設置顯示Tab鍵和行尾空格以便在查看代碼時注意到它們
autocmd FileType c,cpp,java,xml setlocal list | set listchars=tab:>~,trail:.


set cursorline
set number
set tabstop=4
set shiftwidth=4
set smartindent
" 自動右括號
set showmatch


map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec ":silent !gcc % -o %<"
		exec ":!time ./%<"
	elseif &filetype == 'cpp'
		exec ":silent !g++ % -o %<"
		exec ":!time ./%<"
	elseif &filetype == 'html'
		exec "!chromium % &"
	elseif &filetype == 'python'
		set splitright
		":vsp
		":vertical resize-10
		:sp
		:term python3 %
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype =='markdown'
	endif
endfunc


call plug#begin()
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
call plug#end()


" === NERDTree
map T : NERDTreeToggle<CR>


" === Undotree
map L :UndotreeToggle<CR>



