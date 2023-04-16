#!/bin/bash

zsh_dir="./zsh"
nvim_dir="./nvim"
vscode_dir="./vscode"

dotfile_dirs=(
    "$zsh_dir"
    "$nvim_dir"
    "$vscode_dir"
    )
# ディレクトリが存在しなければ作成する
for dir in "${dotfile_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
    fi
done

zsh_files=(
    "$HOME/.zlogin"
    "$HOME/.zlogout"
    "$HOME/.zpreztorc"
    "$HOME/.zprofile"
    "$HOME/.zshenv"
    "$HOME/.zshrc"
    )
for file in "${zsh_files[@]}"; do
    cp "$file" "$zsh_dir"
done

# nvim設定ファイルコピー
cp "$HOME/.config/nvim/init.vim" "$nvim_dir"

# vscode設定ファイルコピー
cp "$HOME/Library/Application Support/Code/User/settings.json" "$vscode_dir"
