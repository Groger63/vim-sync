" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
filetype off

" Ajout de Vundle au runtime path et initialisation
set rtp+=~/.vim/bundle/Vundle.vim
cal vundle#begin()

" On indique à Vundle de s'auto-gérer
Plugin 'VundleVim/Vundle.vim'

" Indique ce que doit gérer Vundle

exec "source ".syncdir."vimrc.plugins"

call vundle#end()
filetype plugin indent on

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

syntax on
colorscheme monokai
set relativenumber

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"}
      \ }

" Airline config

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_detect_iminsert=0

" Cosco Semicolon
command! CommaOrSemiColon call cosco#commaOrSemiColon()
inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Vérification syntaxique du code
let g:syntastic_enable_signs=1          " Activer les signes dans la barre
" d'erreur à gauche
let g:syntastic_enable_perl_checker=1   " Réactiver l'analyse pour le Perl
" (désactivé car risque de sécurité sur les scripts Perl étrangers)
let g:syntastic_perl_checkers=['perl']
let g:syntastic_check_on_open=1         " Analyser le fichier à l'ouverture
let g:syntastic_c_include_dirs = [ '../include', 'include', '../INC', 'INC', '../inc', 'inc' ] " Spécifications des dossier d'inclusion perso
" )

exec "source ".syncdir."vimrc.bepo"
