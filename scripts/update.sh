#! /bin/bash
set -e
set -x

PRO_PATH=~/project/my-linux
cp ~/.vim_runtime/my_configs.vim ~/project/my-linux/vim/my_configs.vim
cp ~/.tmux.conf.local ~/project/my-linux/tmux/tmux.conf.local
cp ~/.tmux/.tmux.conf $PRO_PATH/tmux/tmux.conf
cp ~/.tmux/plugins $PRO_PATH/tmux/ -r
cp ~/.tmux/resurrect $PRO_PATH/tmux/ -r
cp ~/.zshrc $PRO_PATH/zsh/zshrc

