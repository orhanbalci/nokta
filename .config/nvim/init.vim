source ~/.config/nvim/plugins.vim

set clipboard=unnamed

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set ruler
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set nobackup
set noswapfile
set showcmd
set ttimeout
set ttimeoutlen=0
set tabstop=4
set expandtab
set autoread
set signcolumn=yes
set nohlsearch
set cursorline

syntax enable 
set backspace=indent,eol,start
 
" enable true color support
if has('termguicolors')
  set termguicolors
endif

set guifont=Iosevka
" set guifont=FiraCode\ Nerd\ Font " English OK, Utf8 Square
" set guifont=TerminessTTF\ Nerd\ Font\ Mono:h18
set encoding=UTF-8

" sonokai theme config
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" airline statusline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='sonokai'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\uE0B8"
let g:airline_right_sep = "\uE0BA"

" auto save config
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0

" git gutter config
" let g:gitgutter_realtime = 0 
" let g:gitgutter_eager = 0
let g:gitgutter_sign_added = '▌' " U+258c
let g:gitgutter_sign_modified = '▌' " U+258c
let g:gitgutter_sign_removed = '▌' " U+2502
let g:gitgutter_sign_modified_removed = '▌' " U+2502

" fzf config
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" language client config
let g:LanguageClient_serverCommands = {
            \'rust' : ['/usr/bin/rust-analyzer'],
            \'python' : ['/home/orhan/.pyenv/versions/liveapp/bin/pyls'],
            \}
let g:LanguageClient_settingsPath = "/home/orhan/.config/nvim/ls_settings.json"
nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent>gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
nmap <silent><leader>s <Plug>(lcn-symbols)
nmap <silent><leader>h <Plug>(lcn-highlight)
"
" use system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

inoremap jk <Esc>

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR> 

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ae"] = "@conditional.outer",
        ["ie"] = "@conditional.inner",
      },
    },
  },
}
EOF
   
