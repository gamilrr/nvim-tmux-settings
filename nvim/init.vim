"============================= PLUGINS ===========================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

"themes VScode dark theme
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"directory tree
Plug 'scrooloose/nerdtree'

"git nerdtree integration
Plug 'Xuyuanp/nerdtree-git-plugin'

"development icons in nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Indent line
Plug 'Yggdroot/indentLine'

"You Complete Me 
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ycmd'
"Plug 'rdnetto/YCM-Generator', {'branch' : 'stable'}

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Syntastic
Plug 'vim-syntastic/syntastic'

"HighLights
Plug 'octol/vim-cpp-enhanced-highlight'

"Initialize plugin system
call plug#end()
"==================================================================

"======================== SETTIINGS =============================== 
"color theme and editor setting
"-editor color
colorscheme codedark
"-font
set guifont=Monospace\ 10
"-powerline color
let g:airline_theme = 'codedark'
"-cursor line
set cursorline
"-number line
set number
"-show existing tab with 4 spaces width
set tabstop=4
"-when indenting with '>', use 4 spaces width
set shiftwidth=4
"-sets the numbers of columns for a TAB
set softtabstop=4
"-on pressing tab, insert 4 spaces
set expandtab
"-move to windows in insert mode 
imap <C-w><C-w> <esc><C-w><C-w>
"-string compeltion
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
"-save and insert again with c-s
nmap <F2> :w<CR>
vmap <F2> <Esc><c-s>gv
imap <F2> <Esc><c-s>
nmap <c-s> :update<CR>
vmap <c-s> <Esc><F2>gv
imap <c-s> <c-o><F2>
"-column
let &colorcolumn="80"
"-indent
hi SpecialKey ctermfg=239 guifg=239
set listchars=tab:>·,trail:~,space:·
set list
set smartindent
let g:indentLine_char='▏'
let g:indentLine_color_term = 239
"NerdTree config
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp']
let g:NERDTreeDirArrows = 0
let g:NERDTreeShowGitStatus = 1
let g:NERDTreeUpdateOnWrite = 1

"Auto refresh on change
"autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
"nerd position
let g:NERDTreeWinPos="left"
"see hide
let NERDTreeShowHidden =1
"-toggle cntrl + t
silent! nmap <C-t> :NERDTreeToggle<CR>
"-current file dir
silent! nmap <C-c> :NERDTreeFind<CR>
"-git integration symbols
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Ignored"   : "☒'",
    \ "Unknown"   : "?"
    \}
"-close if dir is alone
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif

"-delete buffer if you delete file
let NERDTreeAutoDeleteBuffer = 1
"-icons configuration 
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" Force extra padding in NERDTree so that the filetype icons line up vertically
"let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '?'
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1
" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1
" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0

"YCM completion
"-auto triger
let g:ycm_auto_trigger = 1
"-completion global file
let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/plugged/ycmd/.ycm_extra_conf.py'
"-close preview automatically
let g:ycm_autoclose_preview_window_after_completion = 1
"-characters to start suggestions
let g:ycm_min_num_of_chars_for_completion = 1
"-seed with language you are writing
""let g:ycm_seed_identifiers_with_syntax = 1
"-Goto maps
map <F9> :YcmCompleter FixIt<CR>

nmap <F4> :vertical YcmCompleter GoToDeclaration<CR>
imap <F4> <F2>:vertical YcmCompleter GoToDeclaration<CR>

nmap <F3> :vertical YcmCompleter GoToDefinition<CR>
imap <F3> <F2>:vertical YcmCompleter GoToDefinition<CR>
"-Split in Goto command
let g:ycm_goto_buffer_command='split'
"-Error pane
imap <F5> <F2>:lopen<CR>
vmap <F5> <F2>:lopen<CR>
nmap <F5> :lopen<CR>
imap <F6> <F2>:lclose<CR>
nmap <F6> :lclose<CR>
vmap <F6> <F2>:lclose<CR>

"Snippets
"Trigger configuration.
let g:UltiSnipsExpandTrigger ='<c-j>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ownSnips"]

"Syntastic recommended config
syntax on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
"======================================================================================================
