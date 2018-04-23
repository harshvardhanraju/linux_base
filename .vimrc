" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\ | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set colorcolumn=79
set nu			" Show line number
set incsearch		" Incremental search
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
set foldclose=all
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Pathogen load
"filetype off
"
execute pathogen#infect()
"call pathogen#infect()
"call pathogen#helptags()

filetype on
filetype plugin on
filetype plugin indent on
syntax on

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"----------Added for highlighting extra spaces--------------
let c_space_errors = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"


"-----Added for Highlighting spelling mistakes in comments-----
autocmd BufRead,BufNewFile *.py setlocal spell
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"--------------Added for Color scheme----------------
let g:solarized_termcolors=16 | 256
let g:solarized_termtrans=0 | 1
let g:solarized_degrade=0 | 1
let g:solarized_bold=1 | 0
let g:solarized_underline=1 | 0
let g:solarized_italic=1 | 0
let g:solarized_contrast="high" | "high" or "low"
let g:solarized_visibility="normal" | "high" or "low"

"---For Italic fonts-----
set t_ZH=[3m
set t_ZR=[23m

syntax enable
set background=dark
colorscheme solarized
highlight ColorColumn ctermbg=cyan

"----- For Syntastic ------
let g:syntastic_python_checkers = ['pylint']

"----- Indent line highlighting ------
" Vim
let g:indentLine_color_term = 239
let g:indentLine_indentLevel=6
let g:indentLine_enabled=1
"let g:indentLine_fileType=['.py', 'c', 'cpp', 'js', 'json']
"let g:indentLine_setConceal=0
"IndentLinesReset 2

"GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

"------- Vim Airline ------
let g:airline#extensions#tabline#enabled=1
set laststatus=2
"let g:airline_section_z=airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

"------ Key Remapping ------
map <C-j> :%!python -m json.tool<CR>

inoremap <C-K> <C-\><C-O>b
inoremap <C-L> <C-\><C-O>w

"------ Vim Tmux Mapping ------
let g:tmux_navigator_no_mappings = 1

nnoremap <C-\> :TmuxNavigatePrevious<cr>

"-------- To open the function definition in the new tab -----------
map <C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"--------- For CPP Folding -----------
autocmd BufRead,BufNewFile *.cpp,*.h  setlocal foldmethod=syntax
autocmd BufRead,BufNewFile *.cpp,*.h setlocal foldlevelstart=1
autocmd BufRead,BufNewFile *.cpp,*.h setlocal colorcolumn=100
autocmd BufRead,BufNewFile *.cpp,*.h setlocal cindent
"autocmd BufRead,BufNewFile *.cpp setlocal foldnestmax=2
"set foldmethod=syntax
"set foldlevelstart=1
set foldnestmax=2

"------- Shortcut for folding and unfolding ----------
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"------- For YouCompleteMe -------------
" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_confirm_extra_conf = 1

let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = ''
set completeopt-=preview

"---------------- For Copying to Clipboard directly ------------
set clipboard=unnamedplus
set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
set errorformat=%f:%l:\ %m
map <C-n> :NERDTreeToggle<CR>
