"------------------------------------
" basic
"------------------------------------
set encoding=utf-8
set number
set clipboard+=unnamedplus
set nowrap "行を折り返さない
set autochdir "カレントディレクトリを自動的に切り替え
set mouse=a " マウス

" タブ/インデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smarttab      "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする

" 検索関連
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" インデントの詳細設定
if has("autocmd")
    filetype indent on
    " 無効にしたい場合
    " autocmd FileType html filetype indent off
    autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
    autocmd FileType vue        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
    autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
    " autocmd FileType lisp       setlocal sw=4 sts=4 ts=4 et
endif

" カーソル移動関連の設定
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
set ambiwidth=double           "□や○の文字があってもカーソル位置がずれないようにする

set showmatch   " カッコに一瞬飛ばす
set matchtime=1 " カッコに一瞬飛ばす
let loaded_matchparen = 1 " カッコの強調表示やめる
set matchpairs& matchpairs+=<:> " < >にも対応
"" カッコの補完
"inoremap { {}<Left>
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<ESC>i
"inoremap (<Enter> ()<Left><CR><ESC><S-o>

" 不可視文字の表示記号指定
set listchars=tab:--,eol:↲,extends:❯,precedes:❮

" ファイル処理関連の設定
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" undoの設定
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

" カーソル位置記憶
if has("autocmd")
    autocmd BufReadPost *
		\ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

" その他設定
inoremap <silent> jj <ESC>
