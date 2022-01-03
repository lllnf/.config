" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set number
set tabstop=4
set shiftwidth=4
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec ":silent !g++ % -o %<"
		exec ":!time ./%<.exe"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
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



