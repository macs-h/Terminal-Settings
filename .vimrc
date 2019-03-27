" vimrc

"to stop crazy indenting when pasting using the mouse use
":set paste (then :set nopaste afterwards)

set ai                  " auto indenting
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
syntax on               " syntax highlighting
set hlsearch            " highlight the last searched term
filetype plugin on      " use the file type plugins
 
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
         \ if ! exists("g:leave_my_cursor_position_alone") |
         \ if line("'\"") > 0 && line ("'\"") <= line("$") |
         \ exe "normal g'\"" |
         \ endif |
         \ endif

set tabstop=4
set shiftwidth=4
set textwidth=79

filetype indent on
set incsearch
set expandtab
set showcmd
set hidden

let java_allow_cpp_keywords="I do not like red backgrounds"

" make sure <BS> and <DEL> work okay
"set t_kb=
"fixdel

" abbreviations
abb #d #define
abb #i #include
abb #m #include <math.h>
abb #s #include <string.h>
abb #c #include <ctype.h>
abb mainn public static void main(String[] args) {
abb sooout System.out.println("
abb serr System.err.println("

" complete word or insert tab
function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

:noremap <Space> <PageDown>
:noremap - <PageUp>

