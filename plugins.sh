#!/bin/bash
set -e
plugdir="$HOME/.local/share/nvim/site/pack/plugins/start"
optdir="$HOME/.local/share/nvim/site/pack/plugins/opt"
plugins="https://github.com/neovim/nvim-lspconfig https://github.com/preservim/nerdtree https://github.com/vala-lang/vala.vim https://github.com/tpope/vim-fugitive https://github.com/simrat39/rust-tools.nvim https://github.com/ibhagwan/fzf-lua"
mkdir -p $plugdir
mkdir -p $optdir
cd $plugdir
for plugin in $plugins; do
	plugname=${plugin##*/}
	echo $plugname
	if [ -d $plugname ];then
		cd $plugname && git pull && cd $plugdir
	else
		git clone --depth 1 $plugin
	fi
done
