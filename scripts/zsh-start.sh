#! /bin/bash
CURT=$(dirname $(readlink -f $0))
ROOT=$(readlink -f $(dirname "$CURT"))
echo root dir is \"$ROOT\"

bash $ROOT/zsh/install.sh

if [[ -e ~/.zshrc || -h ~/.zshrc ]]; then
    echo "the existing zshrc will be mv to .zshrc_bk"
    mv ~/.zshrc ~/.zshrc_bk
    mv ~/.inputrc ~/.inputrc_bk
fi
ln -s $ROOT/zsh/zshrc ~/.zshrc
ln -s $ROOT/zsh/inputrc ~/.inputrc
