
" vim basic config setup

" Force vim to not add older features from VI
set nocompatible

" Enable syntx coloring
syntax enable

" Enable plugins
filetype plugin on

:set number
" :set relativenumber

" Enable vim to point to the Linux + clipboard
" set clipboard=unnamedplus
" set clipboard^=unnamed,unnamedplus

:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
" Basic settings for the VIM build in complete menu
set complete+=kspell 
set completeopt=menuone,longest " Pick if there is only 1 match, and the longest
set shortmess+=c " Remove selections from the bottom status bar

set showcmd " Shows the keys and commands that I use in the insert mode

" FINDING FILES FUZZY SEARCH
" Search down into subdirectories recursively
" Provides tab-competion for all file-related tasks
set path+=**

" Display all matching fiels when we tab complete
set wildmenu

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
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
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







