
" vim basic config setup

" Force vim to not add older features from VI
set nocompatible

" Automatic reloading of .vimrc file  on save of .vimrc
" Instead to use `:source $MYVIMRC` every single time
autocmd! bufwritepost .vimrc source %




" Enable syntx coloring
syntax enable

" Enable plugins
filetype plugin on

set number
" :set relativenumber

" Enable vim to point to the Linux + clipboard
" set clipboard=unnamedplus
" set clipboard^=unnamed,unnamedplus

" Make sure that a tab means indent by 4 spaces
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set shiftround
set expandtab





" Basic settings for the VIM build in autocompletion menu

" Using completefunc
set complete+=kspell 
set completeopt=menuone,longest " Pick if there is only 1 match, and the longest
set shortmess+=c " Remove selections from the bottom status bar

" Using omnifunc 
" This is the location where all these omnifunc functions are located on a Linux machine `/usr/share/vim/vim82/autoload/RstFold.vim` 
" adacomplete.vim, ccomplete.vim, clojurecomplete.vim, haskellcomplete.vim, and more...
" To activate press Ctr + x and Ctr + o and then the menu will pop up for the omnifunc function
" set omnifunc=javascriptcomplete#CompleteJS
" set omnifunc=htmlcompete#CompleteTags
" set omnifunc=csscomplete#CompleteCSS
" set omnifunct=phpcomplete#CompletePHP


set showcmd " Shows the keys and commands that I use in the insert mode

" FINDING FILES FUZZY SEARCH
" To search a file you can use `:find foo.txt` and press `Tab` Key to get any file withing the tree
" Search down into subdirectories recursively
" Provides tab-competion for all file-related tasks
set path+=**

" Display all matching fiels when we tab complete
set wildmenu

" Ignore the huge node_modules directory which will slow down my VIM or any
" other search program because this directory is very very large!!...  
set wildignore+=**/node_modules/**


" Search text in one file
" Highlight the text found with `/` commmand in vim 
set hlsearch


"Make backspace to behave like normal backspace 
set bs=2


" Easier moving of code blocks, indentation for `>` and `<` keys
vnoremap < <gv 
vnoremap > >gv 




" NOW WE CAN: 
" - Hit tab to :find by partial match
" -Use * to make it fuzzy

" THINGS TO CONSIDER
" - :b lets you autocomplete any open buffer

" TAG JUMPING
" Create the `tags` file (may need to install ctags first)
" You should go and run this commad in the terminal first `$ ctags -R .`
command! MakeTags !ctags -R .

" NOW WE CAN: 
" -Use ^] to jump to tag under cursor
" -Use g^] for ambigous tags
" -Use ^t to jump back up the tag stack

" THINGS TO CONSIDER: 
" - Thins doens't help if you want a visual list of tags

" Open the first tile split on the right instead of on the bottom
" "set splitbelow splitright
" set splitright
set splitright splitbelow 


" Make sure that the line end is a Linux line and and not Windows line endif (aka line break )
" set fileformat unix

" Force vim to read a file when it was updated outside of vim, for example if
" a SASS compiler ouputed a new CSS file or another compiler outputs new code
" like Typescript to JavaScript..
set autoread

" I just disable the creation of swap files, I know I could lose my work in
" case of a blackout, but this is a quick way to solve this problem  
set noswapfile
set nowritebackup
set nobackup








" vim plug 
" Use `:PlugInstall` to install a new pluging
" Use `:PlugClean` to uninstall a plug that you delete from .vimrc file, this file

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vim-airline/vim-airline' " Status bar at the bottom
Plug 'https://github.com/preservim/nerdtree' " Tree of directories and files on left
Plug 'https://github.com/mattn/emmet-vim' " Emmet code snipets for html
Plug 'https://github.com/vim-scripts/AutoComplPop' " A pop up that will apear and it is using the VIM buildin autocomplete feature
Plug 'https://github.com/rakr/vim-one' " Vim One theme, it is a nice theme, and I prefer the dark color..

call plug#end()





" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree



" Key bindings

" Nerdtree key bindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" Emmet shortcuts
let g:user_emmet_mode='n' " only enables functions in normal mode 
let g:user_emmet_expandabbr_key = '<Tab>' " Triger when I press tab 
" let g:user_emmet_leader_key=','
" let g:user_emmet_leader_key='<tab>'


" Keybindings for the complete menu in VIM
" I got this code from here: `https://github.com/nickjj/dotfiles/blob/master/.vimrc`
" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
" inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
" inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
inoremap <expr> <Tab> pumvisible() ? "<C-y>" :"<Tab>"


" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"



" Automaticall close pair of brakets like: (), {}, "", and so on and so forth... 

inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" Remap Visual Mode to other keys 
nnoremap vv <C-v>

" Change copy paste behaviour
" To have clipboard support for VIM, I installed `sudo apt install vim-gtk3` a new version of vim
" To see more on the features run `vim --version` inside Terminal
" If `:echo has('clipboard')` returns `1` the it is good you have access to Linux OS clipboard, else if it returns `0` that means you don't have access to your Linux OS system clipboard.
" You could use gvim to get around this issue..
vnoremap <C-c> "+y
map <C-v> "+P
" vnoremap <C-c> "+y
" vnoremap <C-c> y
" map <C-v> "+p
" map <C-v> "+P




" Theme Background
" Activating the theme plugin 

" colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

" Add the true color suport for vim-one plugin
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
colorscheme one



" Vim Airline modify default behaviour
" Automatically displays all buffers when there's only one tab open.
" let g:airline#extensions#tabline#enabled = 1

" Separators can be configured independently for the tabline, so here is how you can define 'straight' tabs: 
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" My code snipets
" I will need to be in NORMAL mode not in the INSERT mode for this to work
" nnoremap tells vim to not reinvoke the commands again and again and the first "n" out of nnoremap stands for normal mode
" the `,` is just a normal character also called 'the leader character'. Also this colon character `,` tels vim to change from normal mode to command mode.
" The `:` initiates the vim shell, remember that everytime when you give a command to vim you will need this double colon character
" The `read` command will read the file and ouput, similar to `echo` command
" The `<CR>` at the end means `Enter`, so this script will be as if the script itself presses Enter to execute.
" Make sure that you have a file at that location that you use...
nnoremap ,snipet :-1read $HOME/.vim/snippets/my-snipet.js<CR>


" ------------------------------------------------------------







