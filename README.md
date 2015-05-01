# VIM-Config

This repo contains my personal VIM configuration (.vim/ directory).

## Installation instructions

Just run these commands
<pre>
cd ~
git clone git://github.com/emilecantin/vim-config.git .vim
cd .vim
git submodule init
git submodule update
vim -u bundles.vim +BundleInstall +q #Install bundles
cd ..
ln -s .vim/.vimrc
</pre>

## LICENSE

MIT: http://opensource.org/licenses/MIT
